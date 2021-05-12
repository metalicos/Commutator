package net.cyberdone.commutator.controller;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.Device;
import net.cyberdone.commutator.model.entity.Product;
import net.cyberdone.commutator.model.entity.enums.Color;
import net.cyberdone.commutator.model.entity.enums.DeviceInfo;
import net.cyberdone.commutator.model.entity.enums.DeviceStatus;
import net.cyberdone.commutator.service.DeviceChannelService;
import net.cyberdone.commutator.service.DeviceService;
import net.cyberdone.commutator.service.ProductService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/redactor")
public class RedactorController {

    private final DeviceService deviceService;
    private final DeviceChannelService deviceChannelService;
    private final ProductService productService;

    @GetMapping
    @PreAuthorize("hasAuthority('product:read')")
    public String welcome(Model model) {
        model.addAttribute("isRedactorActive", "active");
        return "redactor";
    }

    @GetMapping("/add-device")
    @PreAuthorize("hasAnyAuthority('product:write','product:update','device:write','device:update')")
    public String getAddDevicePage(Model model) {
        model.addAttribute("statusArray", DeviceStatus.values());
        model.addAttribute("deviceInfo", DeviceInfo.values());
        model.addAttribute("colors", Color.values());
        model.addAttribute("generatedUID", UUID.randomUUID());
        return "add-device";
    }

    @PostMapping("/add-device")
    @PreAuthorize("hasAnyAuthority('product:write','product:update','device:write','device:update')")
    public String postAddDevicePage(@RequestParam("deviceName") String deviceName,
                                    @RequestParam("status") String deviceStatus,
                                    @RequestParam("color") String colorName,
                                    @RequestParam("photo") MultipartFile photo,
                                    @RequestParam("uid") String UID,
                                    @RequestParam("description") String description,
                                    @RequestParam("model") String model,
                                    @RequestParam("type") String type) {

        try {
            if (UID == null) {
                UID = UUID.randomUUID().toString();
            }
            log.info("{},{},{},{},{},{},{},{}",deviceName,deviceStatus,colorName,photo,UID,description,model,type);
            DeviceInfo dInfo = DeviceInfo.getDeviceInfo(deviceName);
            if (dInfo==null){
                throw new RuntimeException("Device name is Wrong.");
            }
            if (description == null) {
                description = dInfo.getDescription();
            }
            if (model == null) {
                model = dInfo.getModel();
            }
            if (type == null) {
                type = dInfo.getType();
            }
            Device device = new Device();
            device.setUID(UID);
            device.setDeviceStatus(DeviceStatus.valueOf(deviceStatus));

            Product product = new Product();
            product.setDevice(dInfo);
            product.setUID(UID);
            product.setColor(colorName);
            product.setPhoto(photo.getBytes());
            product.setDescription(description);
            product.setModel(model);
            product.setType(type);
            deviceService.createDevice(device);
            productService.createProduct(product);
        } catch (Exception ex) {
            log.error(ex.getMessage());
        }
        return "redirect:add-device";
    }
}

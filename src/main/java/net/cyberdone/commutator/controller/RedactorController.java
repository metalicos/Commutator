package net.cyberdone.commutator.controller;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.Device;
import net.cyberdone.commutator.model.entity.Product;
import net.cyberdone.commutator.model.entity.enums.DeviceName;
import net.cyberdone.commutator.model.entity.enums.Status;
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

import java.security.SecureRandom;
import java.util.UUID;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/redactor")
public class RedactorController {

    private static final int UID_LENGTH = 9;
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
        model.addAttribute("statusArray", Status.values());
        model.addAttribute("deviceNames", DeviceName.values());
        String UID = "";
        String letter = "0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz_-.;:?&%@";
        for (int i = 0; i < UID_LENGTH; i++) {
            UID += letter.charAt(new SecureRandom().nextInt(letter.length()));
        }
        return "add-device";
    }

    @PostMapping("/add-device")
    @PreAuthorize("hasAnyAuthority('product:write','product:update','device:write','device:update')")
    public String postAddDevicePage(@RequestParam("deviceName") String deviceName,
                                    @RequestParam("status") Status deviceStatus) {

        String UID = "a4b4";
        String uid = UUID.randomUUID().toString();
        System.out.println(uid);

        Device device = new Device();
        device.setUID(UID);
        Product product = new Product();
        product.setDevice(DeviceName.CYBER_PLANT);
        product.setUID(UID);

        deviceService.createDevice(device);
        productService.createProduct(product);
        return "redirect:add-device";
    }
}

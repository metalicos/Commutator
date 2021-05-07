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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/redactor")
public class RedactorController {

    private final DeviceService deviceService;
    private final DeviceChannelService deviceChannelService;
    private final ProductService productService;
    private char[] letter = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'a', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e', 'F', 'f', 'G', 'g', 'H', 'h', 'I', 'i', 'J', 'j', 'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z', '_', '-', '.', ' '};

    @GetMapping
    public String welcome(Model model) {
        model.addAttribute("isRedactorActive", "active");
        return "redactor";
    }

    @GetMapping("/add-device")
    public String getAddDevicePage(Model model) {
        model.addAttribute("statusArray", Status.values());
        model.addAttribute("deviceNames", DeviceName.values());
        return "add-device";
    }

    @PostMapping("/add-device")
    public String postAddDevicePage(@RequestParam("deviceName") String deviceName,
                                    @RequestParam("status") Status deviceStatus) {

        String UID = "a4b4";

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

package net.cyberdone.commutator.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.component.SessionInfo;
import net.cyberdone.commutator.model.dto.DeviceDto;
import net.cyberdone.commutator.model.entity.Product;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.service.DeviceService;
import net.cyberdone.commutator.service.ProductService;
import net.cyberdone.commutator.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.Set;

@Slf4j
@Controller
@AllArgsConstructor
public class DevicesController {

    private final DeviceService deviceService;
    private final ProductService productService;
    private final UserService userService;
    private final SessionInfo sessionInfo;

    @GetMapping("/devices")
    @PreAuthorize("hasAuthority('device:read')")
    public String welcome(Model model, HttpSession session) {
        model.addAttribute("isDevicesActive", "active");
        User user = userService.getUser(sessionInfo.getUserEmail());
        model.addAttribute("userID",user.getId());
        session.setAttribute("userID",user.getId());
        System.out.println("User = " + user);
        Set<DeviceDto> devices = null;
        try {
            Set<Product> products = productService.getUserProducts(user);
            System.out.println("Products = " + products);
            devices = deviceService.getUserDeviceDtoSet(products);
            System.out.println("Devices = " + devices);
        } catch (Exception ex) {
            System.out.println("Error while loading UserDevices");
            ex.printStackTrace();
        }
        model.addAttribute("devicesDto", devices);
        return "devices";
    }
}

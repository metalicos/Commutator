package net.cyberdone.commutator.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DevicesController {

    @GetMapping("/devices")
    @PreAuthorize("hasAuthority('device:read')")
    public String welcome(Model model) {
        model.addAttribute("isDevicesActive", "active");
        return "devices";
    }
}

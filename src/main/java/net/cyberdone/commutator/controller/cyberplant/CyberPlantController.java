package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant")
public class CyberPlantController {
    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String getCyberPlantDevicePage() {
        log.info("getCyberPlantDevicePage");
        return "cyber-plant-v1";
    }
}

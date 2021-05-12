package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant")
public class CyberPlantController {
    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String getCyberPlantDevicePage(Model model) {
        setActive(model);
        log.info("getCyberPlantDevicePage");
        return "cyber-plant";
    }

    private void setActive(Model model){
        model.addAttribute("webControlIsActive", "active");
        model.addAttribute("channel1IsActive", "");
        model.addAttribute("channel2IsActive", "");
        model.addAttribute("channel3IsActive", "");
        model.addAttribute("channel4IsActive", "");
        model.addAttribute("generalSettingsIsActive", "");
    }
}

package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.CyberPlantWebControlDto;
import net.cyberdone.commutator.service.mqtt.CyberPlantMqttWebControlTransmittionService;
import net.cyberdone.commutator.validator.validation.CyberPlantWebControlValidation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant/webcontrol")
public class CyberPlantWebControlController {

    private final CyberPlantMqttWebControlTransmittionService transmittionService;
    private final CyberPlantWebControlValidation validation;

    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String getWebControlCommand(@RequestParam("uid") String UID,
                                @RequestParam("command") Integer command,
                                Model model) {
        UID = "a4b4";//##############################################################################################
        CyberPlantWebControlDto webControlDto = new CyberPlantWebControlDto(UID, command);
        setActive(model);
        boolean isValid = validation.validate(model, webControlDto);
        if (!isValid) {
            return "cyber-plant";
        }
        boolean isTransmitted = transmittionService.transmitWebControlCommand(webControlDto);
        if (!isTransmitted) {
            model.addAttribute("error","Помилка передачі команди");
            return "cyber-plant";
        }
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

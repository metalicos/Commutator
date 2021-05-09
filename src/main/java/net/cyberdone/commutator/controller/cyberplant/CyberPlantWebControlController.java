package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.enums.CyberPlantEndpoint;
import net.cyberdone.commutator.service.mqtt.MQTTService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant/webcontrol")
public class CyberPlantWebControlController {

    private final MQTTService mqttService;

    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String getWebControlCommand(@RequestParam("uid") String UID,
                   @RequestParam("command") Integer command) {
        String uID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.WEBCONTROL, uID);
        mqttService.publish(endpoint, "#" + command + "#");
        return "cyber-plant-v1";
    }
}

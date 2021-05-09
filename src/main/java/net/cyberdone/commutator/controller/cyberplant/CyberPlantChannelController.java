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

import javax.validation.constraints.NotBlank;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant/channel-settings")
public class CyberPlantChannelController {

    private final MQTTService mqttService;

    /**
     * &uid=3232
     * &channel=0
     * &type=1
     * &logic=1
     * &maintain-value=2
     * &open-value=3
     * &control-mode=1
     * &pid-direction=1
     * &pid-kp=4
     * &pid-ki=3
     * &pid-kd=2
     * &pid-dt=1
     * &relay-direction=0
     * &relay-hysteresis=34
     * &relay-k=3
     * &relay-dt=3
     */
    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String changeSettingsOnDeviceChannel(@NotBlank @RequestParam("uid") String UID,
                                         @NotBlank @RequestParam("channel") Integer channel,
                                         @NotBlank @RequestParam("type") Integer type,
                                         @NotBlank @RequestParam("logic") Integer logic,
                                         @NotBlank @RequestParam("maintain-value") Double maintainValue,
                                         @NotBlank @RequestParam("open-value") Integer openValue,
                                         @NotBlank @RequestParam("control-mode") Integer controlMode,
                                         @NotBlank @RequestParam("pid-direction") Integer pidDirection,
                                         @NotBlank @RequestParam("pid-kp") Double pidKp,
                                         @NotBlank @RequestParam("pid-ki") Double pidKi,
                                         @NotBlank @RequestParam("pid-kd") Double pidKd,
                                         @NotBlank @RequestParam("pid-dt") Integer pidDt,
                                         @NotBlank @RequestParam("relay-direction") Integer relayDirection,
                                         @NotBlank @RequestParam("relay-hysteresis") Double relayHysteresis,
                                         @NotBlank @RequestParam("relay-k") Double relayK,
                                         @NotBlank @RequestParam("relay-dt") Integer relayDt) {
        String uID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.WEBCONTROL, uID);
        //mqttService.publish(endpoint, "#" + command + "#");
        return "cyber-plant-v1";
    }

}

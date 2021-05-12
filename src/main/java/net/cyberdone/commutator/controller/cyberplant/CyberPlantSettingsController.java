package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.service.mqtt.MQTTService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant/settings")
public class CyberPlantSettingsController {

    private final MQTTService mqttService;

    @GetMapping
    @PreAuthorize("hasAuthority('device:read')")
    String getCyberPlantV1Page(Model model) {
        setActive(model);
        return "cyber-plant";
    }
    private void setActive(Model model){
        model.addAttribute("webControlIsActive", "");
        model.addAttribute("channel1IsActive", "");
        model.addAttribute("channel2IsActive", "");
        model.addAttribute("channel3IsActive", "");
        model.addAttribute("channel4IsActive", "");
        model.addAttribute("generalSettingsIsActive", "active");
    }







    //cyberplant/v1/channel/type?number=0&value=0
/*
    @GetMapping("/sound")
    @PreAuthorize("hasAnyAuthority('device:read','device:write')")
    String getChannelRelayDt(@RequestParam("uid") String UID,
                             @RequestParam("sound") Integer sound,
                             Model model) {
        String uID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.SOUND, UID);
        mqttService.publish(endpoint, "#" + sound + "#");
        return "cyber-plant-v1";
    }
    */

    /*
    private Boolean sound = false;
    private Boolean waterCheck = false;
    private Boolean screensaver = false;
    private Short screensaverType = 0;
    private Integer screensaverAfter = 0;
    private Boolean screenLight = true;

    private Short dateSecond;
    private Short dateMinute;
    private Short dateHour;
    private Short dateDay;
    private Short dateMonth;
    private Short dateYear;

    private String wifiSSID;
    private String wifiPASS;

    private Integer sendDataToServerEvery = 1000;
    private Short checkSensorEvery = 1000;
    private Boolean turnOff = false;
    private Short restartCounter = 0;
    private Short workedTimeInSeconds = 0;
    private Integer workedTimeInHours = 0;
    private String uId;
    */
}

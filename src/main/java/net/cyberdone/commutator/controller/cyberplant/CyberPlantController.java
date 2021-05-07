package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.enums.CyberPlantEndpoint;
import net.cyberdone.commutator.service.mqtt.MQTTService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant/v1")
public class CyberPlantController {

    private final MQTTService mqttService;

    @GetMapping
    String getCyberPlantV1Page(Model model) {
        return "cyber-plant-v1";
    }

    //cyberplant/v1/channel/type?number=0&value=0

    @GetMapping("/channel/type")
    String getType(@RequestParam("number") Integer n,
                   @RequestParam("value") Integer type,
                   Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_TYPE, n, UID);
        mqttService.publish(endpoint, "#" + type + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/logic")
    String getLogic(@RequestParam("number") Integer n,
                    @RequestParam("value") Integer logic,
                    Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_LOGIC, n, UID);
        mqttService.publish(endpoint, "#" + logic + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/sensor/data")
    String getAnalogSensorData(@RequestParam("number") Integer n,
                               @RequestParam("value") Integer data,
                               Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.SENSOR_DATA, "sen", n, UID);
        mqttService.publish(endpoint, "#" + data + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/sensor/maintain-value")
    String getSensorMaintainValue(@RequestParam("number") Integer n,
                                  @RequestParam("value") Integer val,
                                  Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.SENSOR_MAINTAIN_VALUE, "sen", n, UID);
        mqttService.publish(endpoint, "#" + val + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/value")
    String getChannelOpenValue(@RequestParam("number") Integer n,
                               @RequestParam("value") Integer val,
                               Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_OPEN_VALUE, n, UID);
        mqttService.publish(endpoint, "#" + val + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/control-mode")
    String getChannelControlMode(@RequestParam("number") Integer n,
                                 @RequestParam("value") Integer mode,
                                 Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_CONTROL, n, UID);
        mqttService.publish(endpoint, "#" + mode + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/pid/direction")
    String getChannelPidDirection(@RequestParam("number") Integer n,
                                  @RequestParam("value") Integer dir,
                                  Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_DIRECTION, n, UID);
        mqttService.publish(endpoint, "#" + dir + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/pid/kp")
    String getChannelPidKp(@RequestParam("number") Integer n,
                           @RequestParam("value") Double kp,
                           Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_KP, n, UID);
        mqttService.publish(endpoint, "#" + kp + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/pid/ki")
    String getChannelPidKi(@RequestParam("number") Integer n,
                           @RequestParam("value") Double ki,
                           Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_KI, n, UID);
        mqttService.publish(endpoint, "#" + ki + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/pid/kd")
    String getChannelPidKd(@RequestParam("number") Integer n,
                           @RequestParam("value") Double kd,
                           Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_KD, n, UID);
        mqttService.publish(endpoint, "#" + kd + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/pid/dt")
    String getChannelPidDt(@RequestParam("number") Integer n,
                           @RequestParam("value") Integer dt,
                           Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_DT, n, UID);
        mqttService.publish(endpoint, "#" + dt + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/relay/direction")
    String getChannelRelayDirection(@RequestParam("number") Integer n,
                                    @RequestParam("value") Integer direction,
                                    Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_DIRECTION, n, UID);
        mqttService.publish(endpoint, "#" + direction + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/relay/hysteresis")
    String getChannelRelayHysteresis(@RequestParam("number") Integer n,
                                     @RequestParam("value") Double hys,
                                     Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_HYSTERESIS, n, UID);
        mqttService.publish(endpoint, "#" + hys + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/relay/k")
    String getChannelRelayK(@RequestParam("number") Integer n,
                            @RequestParam("value") Double k,
                            Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_K, n, UID);
        mqttService.publish(endpoint, "#" + k + "#");
        return "cyber-plant-v1";
    }

    @GetMapping("/channel/relay/dt")
    String getChannelRelayDt(@RequestParam("number") Integer n,
                             @RequestParam("value") Integer dt,
                             Model model) {
        String UID = "a4b4";
        String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_DT, n, UID);
        mqttService.publish(endpoint, "#" + dt + "#");
        return "cyber-plant-v1";
    }
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

package net.cyberdone.commutator.service.mqtt;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.CyberPlantChannelDto;
import net.cyberdone.commutator.model.entity.enums.CyberPlantEndpoint;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@AllArgsConstructor
public class CyberPlantMqttChannelTransmitterService {

    private final MQTTService mqttService;

    public boolean transmitChannelSettings(CyberPlantChannelDto dto) {
        String UID = dto.getUID();
        Integer ch = dto.getChannel();
        try {
            String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_TYPE, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getType() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_LOGIC, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getLogic() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.SENSOR_MAINTAIN_VALUE, "sen", ch, UID);
            mqttService.publish(endpoint, "#" + dto.getMaintainValue() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_OPEN_VALUE, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getOpenValue() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_CONTROL, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getControlMode() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_DIRECTION, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getPidDirection() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_KP, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getPidKp() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_KI, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getPidKi() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_KD, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getPidKd() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_PID_DT, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getPidDt() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_DIRECTION, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getRelayDirection() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_HYSTERESIS, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getRelayHysteresis() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_K, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getRelayK() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.CHANNEL_RELAY_DT, ch, UID);
            mqttService.publish(endpoint, "#" + dto.getRelayDt() + "#");

            endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.SAVE_ALL, UID);
            mqttService.publish(endpoint, "#Saving Data#");

        } catch (MqttException ex) {
            log.error("MQTT transmit transaction error! Device UID={} ,toChannel={} ,settings={}", UID, ch, dto);
            return false;
        }
        return true;
    }
}

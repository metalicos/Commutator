package net.cyberdone.commutator.service.mqtt;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.CyberPlantWebControlDto;
import net.cyberdone.commutator.model.entity.enums.CyberPlantEndpoint;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@AllArgsConstructor
public class CyberPlantMqttWebControlTransmittionService {

    private final MQTTService mqttService;

    public boolean transmitWebControlCommand(CyberPlantWebControlDto dto) {
        try {
            String endpoint = CyberPlantEndpoint.getUrl(CyberPlantEndpoint.WEBCONTROL, dto.getUID());
            mqttService.publish(endpoint, "#" + dto.getCommand() + "#");

        } catch (MqttException ex) {
            log.error("MQTT transmit WebControl error! Command={}", dto);
            return false;
        }
        return true;
    }
}

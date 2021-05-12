package net.cyberdone.commutator.service.mqtt;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.cyberplant.CyberPlantDto;
import net.cyberdone.commutator.service.DeviceDataService;
import net.cyberdone.commutator.service.DeviceService;
import net.cyberdone.commutator.service.ProductService;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MQTTService implements MqttCallback {

    private final ProductService productService;
    private final DeviceService deviceService;
    private final DeviceDataService deviceDataService;

    private MqttClient client = null;

    @Override
    public void connectionLost(Throwable arg0) {
        log.warn("connectionLost :" + arg0.getMessage() + " :" + arg0);
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken arg0) {
        log.debug("deliveryCompleted ");
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) {
        if (topic.equals("outTopic")) {
            Gson gson = new Gson();
            String json = message.toString();
            CyberPlantDto cyberPlantDto = gson.fromJson(json, CyberPlantDto.class);
            System.out.println(cyberPlantDto);

            deviceService.updateDevice(cyberPlantDto);
        }
    }

    public void publish(String topicSuffix, String content) throws MqttException {
        MqttMessage message = new MqttMessage();
        message.setPayload(content.getBytes());
        message.setQos(2);
        message.setRetained(true);
        client.publish(topicSuffix, message);
    }

    public void startMqtt() {
        MemoryPersistence persistence = new MemoryPersistence();
        try {
            String mqttIpAddress = "b85b0aa3fd23.sn.mynetname.net";
            client = new MqttClient("tcp://" + mqttIpAddress + ":1883",
                    MqttClient.generateClientId(), persistence);
        } catch (MqttException e1) {
            e1.printStackTrace();
        }

        MqttConnectOptions connectOptions = new MqttConnectOptions();
        connectOptions.setCleanSession(true);
        connectOptions.setMaxInflight(3000);
        connectOptions.setAutomaticReconnect(true);
        String mqttUserName = "user";
        connectOptions.setUserName(mqttUserName);
        String mqttPassword = "Qwerty123";
        connectOptions.setPassword(mqttPassword.toCharArray());
        client.setCallback(this);
        try {
            IMqttToken mqttConnectionToken = client.connectWithResult(connectOptions);
            log.info(" Connection Status :" + mqttConnectionToken.isComplete());
            client.subscribe("#");
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

}

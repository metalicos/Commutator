package net.cyberdone.commutator.service.mqtt;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.cyberplant.CyberPlantDto;
import net.cyberdone.commutator.model.entity.Device;
import net.cyberdone.commutator.model.entity.DeviceChannel;
import net.cyberdone.commutator.model.entity.DeviceData;
import net.cyberdone.commutator.model.entity.DeviceSettings;
import net.cyberdone.commutator.service.DeviceDataService;
import net.cyberdone.commutator.service.DeviceService;
import net.cyberdone.commutator.service.ProductService;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
		log.warn("connectionLost :" + arg0.getMessage()+" :"+arg0);
	}

	@Override
	public void deliveryComplete(IMqttDeliveryToken arg0) {
			log.debug("deliveryCompleted " );
	}

	@Override
	public void messageArrived(String topic, MqttMessage message) {
		if(topic.equals("outTopic")){
			Gson gson = new Gson();
			String json = message.toString();
			CyberPlantDto plantDto = gson.fromJson(json, CyberPlantDto.class);

			Device device = deviceService.getDevice(plantDto.getUId());

			//log.info("Cyber Plant object found {}",device);
			List<DeviceChannel> channels = device.getChannels();
			for (int i = 0; i <channels.size() ; i++) {
				DeviceChannel ch = channels.get(i);
				ch.setChannelType(plantDto.getChannelType()[i]);
				ch.setChannelLogic(plantDto.getChannelLogic()[i]);
				ch.setAnalogSensorData(plantDto.getAnalogSensorData()[i]);
				ch.setMaintainValue(plantDto.getMaintainValue()[i]);
				ch.setChannelOpenValue(plantDto.getChannelValue()[i]);
				ch.setChannelControlMode(plantDto.getChannelControlMode()[i]);
				ch.setPidDirection(plantDto.getPidDirection()[i]);
				ch.setPidKp(plantDto.getPidKd()[i]);
				ch.setPidKi(plantDto.getPidKi()[i]);
				ch.setPidKd(plantDto.getPidKd()[i]);
				ch.setPidDt(plantDto.getPidDt()[i]);
				ch.setRelayDirection(plantDto.getRelayDirection()[i]);
				ch.setRelayHysteresis(plantDto.getRelayHysteresis()[i]);
				ch.setRelayK(plantDto.getRelayK()[i]);
				ch.setRelayDt(plantDto.getRelayDt()[i]);
				channels.set(i,ch);
			}

			device.setChannels(channels);

			DeviceSettings deviceSettings = device.getSettings();
			deviceSettings.setSound(plantDto.getSound());
			deviceSettings.setWaterCheck(plantDto.getWaterCheck());
			deviceSettings.setScreensaver(plantDto.getScreensaver());
			deviceSettings.setScreensaverType(plantDto.getScreensaverType());
			deviceSettings.setScreensaverAfter(plantDto.getScreensaverAfter());
			deviceSettings.setScreenLight(plantDto.getScreenLight());
			deviceSettings.setDateSecond(plantDto.getDateSecond());
			deviceSettings.setDateMinute(plantDto.getDateMinute());
			deviceSettings.setDateHour(plantDto.getDateHour());
			deviceSettings.setDateDay(plantDto.getDateDay());
			deviceSettings.setDateMonth(plantDto.getDateMonth());
			deviceSettings.setDateYear(plantDto.getDateYear());
			deviceSettings.setWifiSSID(plantDto.getWifiSSID());
			deviceSettings.setWifiPASS(plantDto.getWifiPASS());
			deviceSettings.setSendDataToServerEvery(plantDto.getSendDataToServerEvery());
			deviceSettings.setCheckSensorEvery(plantDto.getCheckSensorEvery());
			deviceSettings.setTurnOff(plantDto.getTurnOff());
			deviceSettings.setRestartCounter(plantDto.getRestartCounter());
			deviceSettings.setWorkedTimeInSeconds(plantDto.getWorkedTimeInSeconds());
			deviceSettings.setWorkedTimeInHours(plantDto.getWorkedTimeInHours());

			device.setSettings(deviceSettings);

			DeviceData cpd = new DeviceData();
			List<DeviceData> data = new ArrayList<>();
			for (int i = 0; i < 4 ; i++) {
				cpd.setDevice(device);
				cpd.setName("SOIL_MOISTURE_SENSOR_"+i);
				cpd.setValue(plantDto.getAnalogSensorData()[i]);
				data.add(deviceDataService.createDeviceData(cpd));
			}
			device.setData(data);
			deviceService.updateDevice(device);
			log.debug("Successfully added data to DB!!!");
		}

	}

	public void publish(String topicSuffix, String content) {
		MqttMessage message = new MqttMessage();
		message.setPayload(content.getBytes());
		message.setQos(2);
		message.setRetained(true);
		try {
			client.publish(topicSuffix, message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void startMqtt() {
		MemoryPersistence persistence = new MemoryPersistence();
		try {
			String mqttIpAddress = "b85b0aa3fd23.sn.mynetname.net";
			client = new MqttClient("tcp://" + mqttIpAddress + ":1883",
					MqttClient.generateClientId(),persistence);
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

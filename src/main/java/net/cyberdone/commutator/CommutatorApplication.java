package net.cyberdone.commutator;

import net.cyberdone.commutator.service.mqtt.MQTTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CommutatorApplication implements CommandLineRunner {

	@Autowired
	private MQTTService mqttService;
	public static void main(String[] args) {
		SpringApplication.run(CommutatorApplication.class, args);
	}


	@Override
	public void run(String... args) throws Exception {
		mqttService.startMqtt();
	}
}

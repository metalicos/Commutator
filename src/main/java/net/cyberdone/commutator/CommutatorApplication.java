package net.cyberdone.commutator;

import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.service.mqtt.MQTTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class CommutatorApplication implements CommandLineRunner {

    @Autowired
    private MQTTService mqttService;

    public static void main(String[] args) {
        SpringApplication.run(CommutatorApplication.class, args);
    }


    @Override
    public void run(String... args) {
        try {
            mqttService.startMqtt();
        } catch (Exception ex) {
            log.error("MQTT CRASH");
        }
    }
}

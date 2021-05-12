package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceSettings extends Model {

    private Integer sound = 0;
    private Integer waterCheck = 0;
    private Integer screensaver = 0;
    private Integer screensaverType = 0;
    private Integer screensaverAfter = 0;
    private Integer screenLight = 1;
    private Integer dateSecond = 1;
    private Integer dateMinute = 1;
    private Integer dateHour = 1;
    private Integer dateDay = 1;
    private Integer dateMonth = 5;
    private Integer dateYear = 2021;
    private String wifiSSID = "ssid";
    private String wifiPASS = "pass";
    private Integer sendDataToServerEvery = 1000;
    private Integer checkSensorEvery = 1000;
    private Integer turnOff = 0;
    private Integer restartCounter = 0;
    private Integer workedTimeInSeconds = 0;
    private Integer workedTimeInHours = 0;

    @OneToOne
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Device device;
}

package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceSettings extends Model {

    private Short sound = 0;

    private Short waterCheck = 0;

    private Short screensaver = 0;

    private Short screensaverType = 0;

    private Integer screensaverAfter = 0;

    private Short screenLight = 1;

    private Short dateSecond = 1;

    private Short dateMinute = 1;

    private Short dateHour = 1;

    private Short dateDay = 1;

    private Short dateMonth = 5;

    private Integer dateYear = 2021;

    private String wifiSSID = "ssid";

    private String wifiPASS = "pass";

    private Integer sendDataToServerEvery = 1000;

    private Short checkSensorEvery = 1000;

    private Short turnOff = 0;

    private Integer restartCounter = 0;

    private Integer workedTimeInSeconds = 0;

    private Integer workedTimeInHours = 0;

    @OneToOne(fetch = FetchType.LAZY)
    private Device device;




}

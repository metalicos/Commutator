package net.cyberdone.commutator.model.dto.cyberplant;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CyberPlantDto {
    /**
     * Channel Settings
     */
    private Short[] channelType;
    private Short[] channelLogic;
    private Double[] analogSensorData;
    private Double[] maintainValue;
    private Short[] channelValue;
    private Short[] channelControlMode;
    /**
     * Channel PID Settings
     */
    private Short[] pidDirection;
    private Double[] pidKp;
    private Double[] pidKi;
    private Double[] pidKd;
    private Integer[] pidDt;
    /**
     * Channel Relay Hysteresis Regulator Settings
     */
    private Short[] relayDirection;
    private Double[] relayHysteresis;
    private Double[] relayK;
    private Integer[] relayDt;
    /**
     * User Settings
     */
    private Short sound = 0;
    private Short waterCheck = 0;
    private Short screensaver = 0;
    private Short screensaverType = 0;
    private Integer screensaverAfter = 0;
    private Short screenLight = 1;

    private Short dateSecond;
    private Short dateMinute;
    private Short dateHour;
    private Short dateDay;
    private Short dateMonth;
    private Integer dateYear;
    /**
     * WiFi Settings
     */
    private String wifiSSID;
    private String wifiPASS;
    /**
     * Developer Settings
     */
    private Integer sendDataToServerEvery = 1000;
    private Short checkSensorEvery = 1000;
    private Short turnOff = 0;
    private Integer restartCounter = 0;
    private Integer workedTimeInSeconds = 0;
    private Integer workedTimeInHours = 0;
    private String uId;
}

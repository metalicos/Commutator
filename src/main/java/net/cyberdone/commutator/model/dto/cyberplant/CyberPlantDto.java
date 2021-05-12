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
    private Integer[] channelType;
    private Integer[] channelLogic;
    private Double[] analogSensorData;
    private Double[] maintainValue;
    private Integer[] channelValue;
    private Integer[] channelControlMode;
    /**
     * Channel PID Settings
     */
    private Integer[] pidDirection;
    private Double[] pidKp;
    private Double[] pidKi;
    private Double[] pidKd;
    private Integer[] pidDt;
    /**
     * Channel Relay Hysteresis Regulator Settings
     */
    private Integer[] relayDirection;
    private Double[] relayHysteresis;
    private Double[] relayK;
    private Integer[] relayDt;
    /**
     * User Settings
     */
    private Integer sound = 0;
    private Integer waterCheck = 0;
    private Integer screensaver = 0;
    private Integer screensaverType = 0;
    private Integer screensaverAfter = 0;
    private Integer screenLight = 1;

    private Integer dateSecond;
    private Integer dateMinute;
    private Integer dateHour;
    private Integer dateDay;
    private Integer dateMonth;
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
    private Integer checkSensorEvery = 1000;
    private Integer turnOff = 0;
    private Integer restartCounter = 0;
    private Integer workedTimeInSeconds = 0;
    private Integer workedTimeInHours = 0;
    private String uId;
}

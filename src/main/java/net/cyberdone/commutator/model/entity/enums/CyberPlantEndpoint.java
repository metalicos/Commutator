package net.cyberdone.commutator.model.entity.enums;

public enum CyberPlantEndpoint {
    CHANNEL_TYPE("/type"),
    CHANNEL_LOGIC("/logic"),
    SENSOR_DATA("/data"),
    SENSOR_MAINTAIN_VALUE("/maintain_value"),
    CHANNEL_OPEN_VALUE("/open_value"),
    CHANNEL_CONTROL("/control"),
    CHANNEL_PID_DIRECTION("/pid/direction"),
    CHANNEL_PID_KP("/pid/kp"),
    CHANNEL_PID_KI("/pid/ki"),
    CHANNEL_PID_KD("/pid/kd"),
    CHANNEL_PID_DT("/pid/dt"),
    CHANNEL_RELAY_DIRECTION("/relay/direction"),
    CHANNEL_RELAY_HYSTERESIS("/relay/hysteresis"),
    CHANNEL_RELAY_K("/relay/k"),
    CHANNEL_RELAY_DT("/relay/dt"),
    SOUND("/sound"),
    WATER_CHECK("/wcheck"),
    SCREEN_LIGHT("/screen_light"),
    SCREENSAVER("/screensaver"),
    SCREENSAVER_TYPE("/screensaver_type"),
    SCREENSAVER_AFTER("/screensaver_after"),
    SECOND("/date/second"),
    MINUTE("/date/minute"),
    HOUR("/date/hour"),
    DAY("/date/day"),
    MONTH("/date/month"),
    YEAR("/date/year"),
    WIFI_SSID("/wifi/ssid"),
    WIFI_PASS("/wifi/pass"),
    SEND_DATA_TO_SERVER_EVERY("/send_data_every"),
    RECHECK_SENSORS_EVERY("/sensor_recheck_every"),
    TURN_THE_DEVICE_CONTROL_OFF("/turn_off"),
    COUNTER_RESTART("/counter/restart"),
    COUNTER_WORKED_IN_SECONDS("/counter/worked_in_seconds"),
    COUNTERWORKED_IN_HOURS("/counter/worked_in_hours"),
    WEBCONTROL("/webcontrol"),
    SAVE_ALL("/save_all"),
    READ_ALL("/read_all"),
    REBOOT("/reboot");

    private String url;

    CyberPlantEndpoint(String url) {
        this.url = url;
    }

    public static String getUrl(CyberPlantEndpoint endpoint, String UID) {
        return "cd/" + UID + endpoint.url;
    }
    public static String getUrl(CyberPlantEndpoint endpoint, Integer channel, String UID) {
        return "cd/"+ UID +"/ch/"+channel+ endpoint.url;
    }
    public static String getUrl(CyberPlantEndpoint endpoint, String endp, Integer num, String UID) {
        return "cd/"+ UID +"/"+endp+"/"+num+ endpoint.url;
    }

    public static void main(String[] args) {
        System.out.println(CyberPlantEndpoint.getUrl(WATER_CHECK, "a4b4"));
    }
}

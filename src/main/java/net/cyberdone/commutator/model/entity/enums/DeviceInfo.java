package net.cyberdone.commutator.model.entity.enums;

public enum DeviceInfo {
    CYBER_PLANT_V1(
            "Cyber Plant One",
            """
            Прилад для контролю якості поливу рослин із фізичним керуванням та змогою управління через WiFi точку доступу.
            Cyber Plant One - дозволяє окремо ноалаштовувати 4 канали управління, виставляючи необхідні параметри для контролю.
            Прилад дозволяє керувати MOSFET ключами, застосовуючи широтно-імпульсну модуляцію (ШІМ), режим "Диммер", а також релейними модулями у режимі "Реле".
            У відповідності до цього перший режим керується автоматичним регулятором на основі пропорційно-інтегрально-диференціального (ПІД) регулятора, а другий "Реле" регулятором на основі гістерезису.
            """,
            "MulCha",
            "Greenhouse Controller"),
    TTDSPH1(
            "TTDSPH-1",
            """
            Блок сенсорів призначений для вимірювання температури, PH та TDS води, із I2C інтерфейсом для комунікації.
            Дзволяє калібрувати значення TDS та PH.
            """,
            "Water Analyzer",
            "Sensor Block");

    String name;
    String description;
    String model;
    String type;

    DeviceInfo(String name, String description, String model, String type) {
        this.name = name;
        this.description = description;
        this.model = model;
        this.type = type;
    }

    public static DeviceInfo getDeviceInfo(String name){
        for (DeviceInfo i:DeviceInfo.values()) {
          if(i.name.equals(name))
              return i;
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getModel() {
        return model;
    }

    public String getType() {
        return type;
    }
}

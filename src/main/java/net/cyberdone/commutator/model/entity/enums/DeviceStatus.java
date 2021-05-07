package net.cyberdone.commutator.model.entity.enums;

public enum DeviceStatus {
    ON,
    OFF,
    BANNED,     //якщо turnOff = true
    BROKEN      //якщо restartCounter за 1 хв збільшився на 5 одиниць і більше
}

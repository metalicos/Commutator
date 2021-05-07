package net.cyberdone.commutator.model.entity.enums;

public enum DeviceName {
    CYBER_PLANT("Cyber Plant");
    String name;

    DeviceName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}

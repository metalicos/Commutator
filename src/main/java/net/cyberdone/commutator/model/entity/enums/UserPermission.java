package net.cyberdone.commutator.model.entity.enums;

public enum UserPermission {

    DEVICE_READ("device:read"),
    DEVICE_WRITE("device:write"),
    DEVICE_UPDATE("device:update"),
    DEVICE_DELETE("device:delete"),

    PRODUCT_READ("product:read"),
    PRODUCT_WRITE("product:write"),
    PRODUCT_UPDATE("product:update"),
    PRODUCT_DELETE("product:delete"),

    TIMER_READ("timer:read"),
    TIMER_WRITE("timer:write"),
    TIMER_UPDATE("timer:update"),
    TIMER_DELETE("timer:delete"),

    SCHEDULE_READ("schedule:read"),
    SCHEDULE_WRITE("schedule:write"),
    SCHEDULE_UPDATE("schedule:update"),
    SCHEDULE_DELETE("schedule:delete"),

    SELF_READ("self:read"),
    SELF_WRITE("self:write"),
    SELF_UPDATE("self:update"),
    SELF_DELETE("self:delete"),

    USER_READ("user:read"),
    USER_WRITE("user:write"),
    USER_UPDATE("user:update"),
    USER_DELETE("user:delete"),

    ADMIN_READ("admin:read"),
    ADMIN_WRITE("admin:write"),
    ADMIN_UPDATE("admin:update"),
    ADMIN_DELETE("admin:delete"),

    DEVICE_DATA_READ("device-data:read"),
    DEVICE_DATA_WRITE("device-data:write"),
    DEVICE_DATA_UPDATE("device-data:update"),
    DEVICE_DATA_DELETE("device-data:delete");

    private final String permission;

    UserPermission(String permission) {
        this.permission = permission;
    }

    public String getPermission() {
        return permission;
    }
}

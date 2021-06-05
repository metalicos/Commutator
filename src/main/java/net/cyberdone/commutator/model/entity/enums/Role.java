package net.cyberdone.commutator.model.entity.enums;

import com.google.common.collect.Sets;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Set;
import java.util.stream.Collectors;

import static net.cyberdone.commutator.model.entity.enums.UserPermission.*;

public enum Role {
    SUPER_ADMIN(Sets.newHashSet(
            ADMIN_READ,
            ADMIN_WRITE,
            ADMIN_UPDATE,
            ADMIN_DELETE,
            USER_READ,
            USER_WRITE,
            USER_UPDATE,
            USER_DELETE,
            PRODUCT_READ,
            PRODUCT_WRITE,
            PRODUCT_UPDATE,
            PRODUCT_DELETE,
            DEVICE_READ,
            DEVICE_WRITE,
            DEVICE_UPDATE,
            DEVICE_DELETE,
            DEVICE_DATA_READ,
            DEVICE_DATA_WRITE,
            DEVICE_DATA_UPDATE,
            DEVICE_DATA_DELETE,
            TIMER_READ,
            TIMER_WRITE,
            TIMER_UPDATE,
            TIMER_DELETE,
            SCHEDULE_READ,
            SCHEDULE_WRITE,
            SCHEDULE_UPDATE,
            SCHEDULE_DELETE,
            SELF_READ,
            SELF_WRITE,
            SELF_UPDATE,
            SELF_DELETE
            )),
    ADMIN(Sets.newHashSet(
            USER_READ,
            USER_WRITE,
            USER_UPDATE,
            USER_DELETE,
            PRODUCT_READ,
            PRODUCT_WRITE,
            PRODUCT_UPDATE,
            PRODUCT_DELETE,
            DEVICE_READ,
            DEVICE_WRITE,
            DEVICE_UPDATE,
            DEVICE_DELETE,
            DEVICE_DATA_READ,
            DEVICE_DATA_WRITE,
            DEVICE_DATA_UPDATE,
            DEVICE_DATA_DELETE,
            TIMER_READ,
            TIMER_WRITE,
            TIMER_UPDATE,
            TIMER_DELETE,
            SCHEDULE_READ,
            SCHEDULE_WRITE,
            SCHEDULE_UPDATE,
            SCHEDULE_DELETE,
            SELF_READ,
            SELF_WRITE,
            SELF_UPDATE,
            SELF_DELETE
    )),

    USER(Sets.newHashSet(
            DEVICE_READ,
            DEVICE_WRITE,
            DEVICE_UPDATE,
            DEVICE_DELETE,
            DEVICE_DATA_READ,
            DEVICE_DATA_WRITE,
            DEVICE_DATA_UPDATE,
            DEVICE_DATA_DELETE,
            TIMER_READ,
            TIMER_WRITE,
            TIMER_UPDATE,
            TIMER_DELETE,
            SCHEDULE_READ,
            SCHEDULE_WRITE,
            SCHEDULE_UPDATE,
            SCHEDULE_DELETE,
            SELF_READ,
            SELF_WRITE,
            SELF_UPDATE,
            SELF_DELETE
    ));

    private final Set<UserPermission> permissions;

    Role(Set<UserPermission> permissions) {
        this.permissions = permissions;
    }

    public Set<UserPermission> getPermissions() {
        return permissions;
    }

    public Set<SimpleGrantedAuthority> grantedAuthorities() {
        Set<SimpleGrantedAuthority> permissions = getPermissions().stream()
                .map(p -> new SimpleGrantedAuthority(p.getPermission()))
                .collect(Collectors.toSet());
        permissions.add(new SimpleGrantedAuthority("ROLE_" + this.name()));
        return permissions;
    }
}

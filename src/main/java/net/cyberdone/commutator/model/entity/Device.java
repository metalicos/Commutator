package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import net.cyberdone.commutator.model.entity.enums.DeviceStatus;

import javax.persistence.*;
import java.util.List;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class Device extends Model {

    @Column(length = 500, nullable = false, unique = true)
    private String UID;

    @Column(length = 500)
    private String customName;

    @Enumerated(EnumType.ORDINAL)
    private DeviceStatus deviceStatus;

    @OneToMany(mappedBy = "device",cascade = CascadeType.ALL)
    private List<DeviceChannel> channels;

    @OneToMany(mappedBy = "device",cascade = CascadeType.ALL)
    private List<DeviceData> data;

    @OneToOne(mappedBy = "device",cascade = CascadeType.ALL)
    private DeviceSettings settings;

}

package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import net.cyberdone.commutator.model.entity.enums.DeviceInfo;

import javax.persistence.*;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class Product extends Model {

    @Column(length = 500, nullable = false, unique = true)
    private String UID;

    @Enumerated(EnumType.ORDINAL)
    private DeviceInfo device;

    private String description;
    private String model;
    private String type;
    private String color;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] photo;

    @ManyToOne(cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private User user;
}

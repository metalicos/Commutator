package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import net.cyberdone.commutator.model.entity.enums.DeviceName;

import javax.persistence.*;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class Product extends Model{

    @Column(length = 500, nullable = false, unique = true)
    private String UID;

    @Enumerated(EnumType.ORDINAL)
    private DeviceName device;

    @ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.REMOVE)
    private User user;
}

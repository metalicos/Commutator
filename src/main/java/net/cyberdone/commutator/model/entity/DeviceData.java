package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceData extends Model {

    @Column(name = "NAME")
    private String name;

    @Column(name = "VALUE")
    private Double value;

    @ManyToOne(fetch = FetchType.LAZY)
    private Device device;

}

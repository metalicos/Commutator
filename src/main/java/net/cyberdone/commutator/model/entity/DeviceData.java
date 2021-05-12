package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceData extends Model {

    private String name;
    private Double value;

    @ManyToOne
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Device device;

}

package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceChannel extends Model {

    private Short channelType;
    private Short channelLogic;
    private Double maintainValue;
    private Short channelOpenValue;
    private Short channelControlMode;
    private Double analogSensorData;
    private Short pidDirection;
    private Double pidKp;
    private Double pidKi;
    private Double pidKd;
    private Integer pidDt;
    private Short relayDirection;
    private Double relayHysteresis;
    private Double relayK;
    private Integer relayDt;
    @ManyToOne
    private Device device;
}


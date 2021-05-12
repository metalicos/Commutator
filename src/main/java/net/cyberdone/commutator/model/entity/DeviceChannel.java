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
public class DeviceChannel extends Model {

    private Integer channelType = 0;
    private Integer channelLogic = 0;
    private Double maintainValue = 30.0;
    private Integer channelOpenValue=0;
    private Integer channelControlMode=0;
    private Double analogSensorData =0.0;
    private Integer pidDirection=0;
    private Double pidKp=0.5;
    private Double pidKi=0.2;
    private Double pidKd=0.1;
    private Integer pidDt=1000;
    private Integer relayDirection=0;
    private Double relayHysteresis=5.0;
    private Double relayK=0.5;
    private Integer relayDt=1000;

    @ManyToOne
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Device device;
}


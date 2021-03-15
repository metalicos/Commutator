package net.cyberdone.commutator.model.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Sensor {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private Double minValue;

    private Double maxValue;

    private Double step;

    @Enumerated(EnumType.STRING)
    private SensorType sensorType;

    @OneToOne
    private Data data;

    @OneToOne
    private Channel channel;

}

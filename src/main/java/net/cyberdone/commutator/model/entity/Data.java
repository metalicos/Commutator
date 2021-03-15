package net.cyberdone.commutator.model.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Data {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private LocalDateTime time;

    private String value;

    private String unit;

    @ManyToOne
    private Device device;

    @OneToOne
    private Sensor sensor;

}

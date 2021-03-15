package net.cyberdone.commutator.model.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;
import java.util.List;

@Entity
@Table
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Channel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String nameInDevice;

    private String description;

    @Enumerated(EnumType.STRING)
    private ChannelType type;

    private Integer value;

    private Integer workingTime;

    private Integer recheckTime;

    private Double pidKp;

    private Double pidKi;

    private Double pidKd;

    @Enumerated(EnumType.STRING)
    private PidMode pidMode;

    @Enumerated(EnumType.STRING)
    private ControlMode controlMode;

    @OneToMany(mappedBy = "channel")
    private List<Schedule> schedules;

    @OneToMany(mappedBy = "channel")
    private List<Timer> timers;

    @ManyToOne
    private Device device;

    @OneToOne
    private Sensor sensor;

}

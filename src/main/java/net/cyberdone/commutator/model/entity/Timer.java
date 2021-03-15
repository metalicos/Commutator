package net.cyberdone.commutator.model.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.DayOfWeek;
import java.time.LocalTime;

@Entity
@Table
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Timer {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @Enumerated(EnumType.STRING)
    private DayOfWeek day;

    private LocalTime startAt;

    private Integer valueStart;

    private LocalTime endAt;

    private Integer valueEnd;

    @ManyToOne
    private Channel channel;

}

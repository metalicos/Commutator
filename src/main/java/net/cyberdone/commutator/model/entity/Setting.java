package net.cyberdone.commutator.model.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Setting {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String value;

    @ManyToOne
    private Device device;
}

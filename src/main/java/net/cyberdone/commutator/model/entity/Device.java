package net.cyberdone.commutator.model.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Device {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String UID;

    private String name;

    @Enumerated(EnumType.STRING)
    private Status status;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "device")
    private List<Setting> settings;

    @OneToMany(mappedBy = "device")
    private List<Data> data;

    @OneToMany(mappedBy = "device")
    private List<Channel> channels;

}

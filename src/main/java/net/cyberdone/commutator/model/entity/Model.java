package net.cyberdone.commutator.model.entity;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public abstract class Model implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    protected Long id;

    @CreationTimestamp
    @Column(name = "CREATION_TIME")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    protected LocalDateTime created;

    @UpdateTimestamp
    @Column(name = "UPDATED_TIME")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    protected LocalDateTime updated;
}

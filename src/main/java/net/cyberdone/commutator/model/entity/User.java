package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import net.cyberdone.commutator.model.entity.enums.Role;
import net.cyberdone.commutator.model.entity.enums.Status;

import javax.persistence.*;
import java.sql.Blob;
import java.util.List;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class User extends Model {

    @Column(unique = true, nullable = false, length = 500)
    private String email;

    @Column(nullable = false, length = 500)
    private String password;

    @Column(nullable = false, length = 500)
    private String firstName;

    @Column(nullable = false, length = 500)
    private String lastName;

    @Lob
    private Blob userPhoto;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false)
    private Role role;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false)
    private Status status;

    @OneToMany(mappedBy = "user", cascade = CascadeType.MERGE)
    private List<Product> products;
}

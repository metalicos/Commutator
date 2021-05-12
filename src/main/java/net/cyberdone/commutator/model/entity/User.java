package net.cyberdone.commutator.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import net.cyberdone.commutator.model.entity.enums.Role;
import net.cyberdone.commutator.model.entity.enums.Status;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table
@Data
@EqualsAndHashCode(callSuper = true)
public class User extends Model {

    @Column(nullable = false, length = 500)
    private String firstName;

    @Column(nullable = false, length = 500)
    private String lastName;

    @Column(unique = true, nullable = false, length = 500)
    private String email;

    @Column(nullable = false, length = 500)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private String password;

    @Column(nullable = false)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Boolean isEnabled = true;

    @Column(length = 500)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private String activationCode;

    @Lob
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @Column(columnDefinition = "LONGBLOB")
    private byte[] photo;

    //    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    //    @CollectionTable(name = "user_role",joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Role role;
    //    private Set<Role> roles;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Status status;

    @OneToMany(mappedBy = "user")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Set<Product> products;


}

package net.cyberdone.commutator.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class UserDto {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String passwordCheck;
}

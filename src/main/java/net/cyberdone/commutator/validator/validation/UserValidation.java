package net.cyberdone.commutator.validator.validation;

import lombok.AllArgsConstructor;
import net.cyberdone.commutator.model.dto.UserDto;
import net.cyberdone.commutator.validator.CustomValidator;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
@AllArgsConstructor
public class UserValidation {

    private final CustomValidator validator;

    public boolean validate(Model model, UserDto userDto){

        if (!validator.strNotNullAndNotEmpty(userDto.getFirstName())) {
            model.addAttribute("firstNameError", "Ім'я не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!validator.strNotNullAndNotEmpty(userDto.getLastName())) {
            model.addAttribute("lastNameError", "Прізвище не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!validator.strNotNullAndNotEmpty(userDto.getEmail())) {
            model.addAttribute("emailError", "Email не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!validator.strNotNullAndNotEmpty(userDto.getPassword())) {
            model.addAttribute("passwordError", "Пароль не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!validator.strNotNullAndNotEmpty(userDto.getPasswordCheck())) {
            model.addAttribute("passwordCheckError", "Пароль для перевірки не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!userDto.getPassword().equals(userDto.getPasswordCheck())) {
            model.addAttribute("passwordError", "Паролі різні");
            model.addAttribute("passwordCheckError", "Паролі різні");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!userDto.getPassword().matches(CustomValidator.PASSWORD)) {
            model.addAttribute("passwordError", """
            Пароль не відповідає правилам:
            1. Повинен містити принаймні одну цифру 0-9
            2. Повинен містити принаймні одну літеру нажнього регістру a-z
            3. Повинен містити принаймні одну літеру верхнього регістру A-Z
            4. Довжина паролю 8-20 символів
            """);
            model.addAttribute("userDto",userDto);
            return false;
        }
        return true;
    }

    public boolean validateLoginData(Model model, UserDto userDto){
        if (!validator.strNotNullAndNotEmpty(userDto.getEmail())) {
            model.addAttribute("emailError", "Email не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!validator.strNotNullAndNotEmpty(userDto.getPassword())) {
            model.addAttribute("passwordError", "Пароль не введено");
            model.addAttribute("userDto",userDto);
            return false;
        }
        if (!userDto.getPassword().matches(CustomValidator.PASSWORD)) {
            model.addAttribute("passwordError", """
            Пароль не відповідає правилам:
            1. Повинен містити принаймні одну цифру 0-9
            2. Повинен містити принаймні одну літеру нажнього регістру a-z
            3. Повинен містити принаймні одну літеру верхнього регістру A-Z
            4. Довжина паролю 8-20 символів
            """);
            model.addAttribute("userDto",userDto);
            return false;
        }
        return true;
    }
}

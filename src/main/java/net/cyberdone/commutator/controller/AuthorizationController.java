package net.cyberdone.commutator.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.UserDto;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.service.UserService;
import net.cyberdone.commutator.validator.validation.UserValidation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/auth")
public class AuthorizationController {
    private final UserValidation userValidation;
    private final UserService userService;

    @GetMapping("/login")
    public String loginGet() {
        log.info("open login page");
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        log.info("logout");
        return "devices";
    }

    @GetMapping("/check-email-page")
    public String checkEmailPage() {
        log.info("check-email-page");
        return "check-email-page";
    }

    @GetMapping("/registration")
    public String register() {
        log.info("open registration page");
        return "registration";
    }

    @GetMapping("/activate/{code}")
    public String activate(@NotNull @NotEmpty @PathVariable("code") String code,
                           Model model) {
        log.info("activating registration");

        boolean isActivated = userService.activateUser(code);
        if (isActivated) {
            model.addAttribute("message", "Активація успішно пройдена");
        } else {
            model.addAttribute("errorMessage", "Помилка активації");
            return "registration";
        }
        return "login";
    }

    @GetMapping("/remove-account/{code}")
    public String removeGeneratedAccount(@NotNull @NotEmpty @PathVariable("code") String code,
                                         Model model) {
        log.info("removing account");
        boolean isDeleted = userService.deleteNotActivatedUser(code);
        if (isDeleted)
            model.addAttribute("message", "Інформацію видалено, дякуємо за співпрацю!");
        else
            model.addAttribute("errorMessage", "Користувач повністю зареєстрований, або вже видалений.");
        return "activate";
    }


    @GetMapping("/forgot-password")
    public String forgotPassword() {
        log.info("open forgot-password page");
        return "forgot-password";
    }


    @PostMapping("/registration")
    public String registrationPost(@RequestParam("firstName") String firstName,
                                   @RequestParam("lastName") String lastName,
                                   @RequestParam("email") String email,
                                   @RequestParam("password") String password,
                                   @RequestParam("passwordCheck") String passwordCheck,
                                   Model model,
                                   HttpSession session) {
        ;
        UserDto userDto = new UserDto(firstName, lastName, email, password, passwordCheck);
        log.info("userDto[firstName = {}, lastName = {}, email = {}, password = {}, passCheck = {}]",
                firstName, lastName, email, password != null, passwordCheck != null);

        boolean isValid = userValidation.validate(model, userDto);
        if (!isValid) {
            return "registration";
        }

        try {
            User newUser = userService.createUser(userDto);
            log.info("user created = {}", newUser);
            model.addAttribute("user", newUser);
            session.setAttribute("user", newUser);
            log.info("user added to model and session");

        } catch (EntityExistsException ex) {
            log.info(ex.getMessage());
            model.addAttribute("errorMessage", "Цей користувач вже зареєстрований. Якщо Ви забули пароль" +
                    ", натисніть на посилання \"Забули пароль?\"");
            return "registration";
        }

        return "redirect:check-email-page";
    }

    @PostMapping("/login")
    public String loginPost(@RequestParam(value = "error", defaultValue = "false") boolean loginError,
                            @RequestParam("email") String email,
                            @RequestParam("password") String password,
                            Model model,
                            HttpSession session) {
        UserDto userDto = new UserDto(null, null, email, password, null);
        log.info("login starts email = {} , pass = {} ", email, password != null);
        boolean isValid = userValidation.validateLoginData(model, userDto);
        if (!isValid || loginError) {
            return "registration";
        }
        User user;
        try {
            user = userService.getUser(email);
            log.info("user found = {}", user);
        } catch (EntityNotFoundException ex) {
            log.info(ex.getMessage());
            model.addAttribute("errorMessage", "Акаунту із введеними даними не існує. " +
                    "Якщо Ви ще не зареєстровані, перейдіть за посиланням нижче.");
            return "login";
        }
        if (user.getPassword().equals(password)) {
            log.info("user inputted correct password, access allowed");
            model.addAttribute("user", user);
            session.setAttribute("user", user);
            log.info("user added to model and session");
        } else {
            model.addAttribute("passwordError", "Пароль введено не правильно");
            return "login";
        }

        return "redirect:devices";
    }

}

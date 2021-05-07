package net.cyberdone.commutator.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.enums.Role;
import net.cyberdone.commutator.model.entity.enums.Status;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/auth")
public class AuthorizationController {

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

    @GetMapping("/registration")
    public String register() {
        log.info("open registration page");
        return "registration";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword() {
        log.info("open forgot-password page");
        return "forgot-password";
    }

    @PostMapping("/registration")
    public String registrationPost(@RequestParam("firstname") String firstName,
                                   @RequestParam("lastname") String lastName,
                                   @RequestParam("email") String email,
                                   @RequestParam("password") String password,
                                   @RequestParam("password-check") String passwordCheck,
                                   Model model,
                                   HttpSession session) {
        log.info("registration starts firstname = {} ,last name = {} ,email = {} , pass = {} , ch-pass = {} ",
                firstName, lastName, email, password, passwordCheck);
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setStatus(Status.ACTIVE);
        newUser.setRole(Role.USER);
        newUser.setPassword(password);
        newUser = userService.createUser(newUser);

        log.info("user created = {}", newUser);
        model.addAttribute("user", newUser);
        session.setAttribute("user", newUser);
        log.info("user added to model and session");

        return "devices";
    }

    @PostMapping("/login")
    public String loginPost(@RequestParam("email") String email,
                            @RequestParam("password") String password,
                            Model model,
                            HttpSession session) {
        log.info("login starts email = {} , pass = {} ", email, password);

        User user = userService.getUser(email);
        log.info("user found = {}", user);

        if (user.getPassword().equals(password)) {
            log.info("user inputted correct password, access allowed");
            model.addAttribute("user", user);
            session.setAttribute("user", user);
            log.info("user added to model and session");
        }

        return "devices";
    }

}

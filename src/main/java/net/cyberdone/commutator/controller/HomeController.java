package net.cyberdone.commutator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class HomeController {

    @GetMapping("/")
    public String welcome(Map<String, Object> model) {
        String message = "Hello World";
        model.put("message", message);
        return "home";
    }

}

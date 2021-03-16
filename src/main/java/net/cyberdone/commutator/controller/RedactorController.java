package net.cyberdone.commutator.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping(value = "/redactor")
public class RedactorController {

    @GetMapping
    public String welcome(Map<String, Object> model) {
        return "redactor";
    }
}

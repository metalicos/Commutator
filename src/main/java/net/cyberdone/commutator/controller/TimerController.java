package net.cyberdone.commutator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class TimerController {

    @GetMapping("/timers")
    public String getTimer(Map<String,Object> model){
        return "timers";
    }
}

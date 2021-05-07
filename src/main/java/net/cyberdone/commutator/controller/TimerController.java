package net.cyberdone.commutator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TimerController {

    @GetMapping("/timers")
    public String getTimer(Model model){
        model.addAttribute("isTimerActive","active");
        return "timers";
    }
}

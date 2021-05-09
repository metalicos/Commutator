package net.cyberdone.commutator.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TimerController {

    @GetMapping("/timers")
    @PreAuthorize("hasAuthority('timer:read')")
    public String getTimer(Model model){
        model.addAttribute("isTimerActive","active");
        return "timers";
    }
}

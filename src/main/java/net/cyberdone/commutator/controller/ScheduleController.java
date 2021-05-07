package net.cyberdone.commutator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScheduleController {

    @GetMapping("/schedules")
    public String getSchedules(Model model) {
        model.addAttribute("isSchedulesActive", "active");
        return "schedules";
    }
}

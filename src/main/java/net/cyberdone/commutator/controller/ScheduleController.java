package net.cyberdone.commutator.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScheduleController {

    //hasRole("ROLE_") hasAnyRole("ROLE_") hasAuthority(permission) hasAnyAuthority(permission)
    @GetMapping("/schedules")
    @PreAuthorize("hasAuthority('schedule:read')")
    public String getSchedules(Model model) {
        model.addAttribute("isSchedulesActive", "active");
        return "schedules";
    }
}

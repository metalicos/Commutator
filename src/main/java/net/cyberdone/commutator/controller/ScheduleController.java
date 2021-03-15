package net.cyberdone.commutator.controller;

import net.cyberdone.commutator.model.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class ScheduleController {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @GetMapping("/schedules")
    public String getSchedules(Map<String, Object> model) {
        // List<Schedule> schedules = scheduleRepository.findAll();
        return "schedules";
    }
}

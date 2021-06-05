package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.CyberPlantChannelDto;
import net.cyberdone.commutator.service.mqtt.CyberPlantMqttChannelTransmitterService;
import net.cyberdone.commutator.validator.validation.CyberPlantChannelValidation;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant/channel-settings")
public class CyberPlantChannelController {
    private static final int MAX_TRY_TO_SEND = 5;
    private CyberPlantMqttChannelTransmitterService transmitter;
    private CyberPlantChannelValidation channelValidation;

    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String changeSettingsOnDeviceChannel(@Nullable @RequestParam("uid") String UID,
                                         @Nullable @RequestParam("channel") Integer channel,
                                         @Nullable @RequestParam("type") Integer type,
                                         @Nullable @RequestParam("logic") Integer logic,
                                         @Nullable @RequestParam("maintain-value") Double maintainValue,
                                         @Nullable @RequestParam("open-value") Integer openValue,
                                         @Nullable @RequestParam("control-mode") Integer controlMode,
                                         @Nullable @RequestParam("pid-direction") Integer pidDirection,
                                         @Nullable @RequestParam("pid-kp") Double pidKp,
                                         @Nullable @RequestParam("pid-ki") Double pidKi,
                                         @Nullable @RequestParam("pid-kd") Double pidKd,
                                         @Nullable @RequestParam("pid-dt") Integer pidDt,
                                         @Nullable @RequestParam("relay-direction") Integer relayDirection,
                                         @Nullable @RequestParam("relay-hysteresis") Double relayHysteresis,
                                         @Nullable @RequestParam("relay-k") Double relayK,
                                         @Nullable @RequestParam("relay-dt") Integer relayDt,
                                         Model model) {
        CyberPlantChannelDto channelDto = new CyberPlantChannelDto(
                UID, channel, type, logic, maintainValue, openValue, controlMode, pidDirection,
                pidKp, pidKi, pidKd, pidDt, relayDirection, relayHysteresis, relayK, relayDt
        );
        log.info("params: uid={},channel={},type={},logic={},maintVal={},opVal={},contMode={},pidDir={}," +
                        "pidKp={},pidKi={},pidKd={},pidDt={},relDir={},relHyst={},relK={},relDt={}",
                UID, channel, type, logic, maintainValue, openValue, controlMode, pidDirection, pidKp, pidKi, pidKd,
                pidDt, relayDirection, relayHysteresis, relayK, relayDt
        );
        setActiveChannel(channel,model);
        boolean isValid = channelValidation.validate(model, channelDto);
        if (!isValid) {
            return "cyber-plant";
        }

        int tryCounter = 0;
        while (!transmitter.transmitChannelSettings(channelDto) && tryCounter < MAX_TRY_TO_SEND) {
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                log.info(e.getMessage());
            }
            tryCounter++;
        }
        if (tryCounter == MAX_TRY_TO_SEND - 1) {
            log.error("Transmit total fail data lost. {}", channelDto);
            model.addAttribute("error", "Помилка передачі даних. Налаштування ймовірно не надіслані.");
            return "cyber-plant";
        }

        model.addAttribute("success", "Налаштування успішно надіслано");
        return "cyber-plant";
    }

    private void setActiveChannel(int channel, Model model) {
        if (channel == 0) {
            model.addAttribute("webControlIsActive", "");
            model.addAttribute("channel1IsActive", "active");
            model.addAttribute("channel2IsActive", "");
            model.addAttribute("channel3IsActive", "");
            model.addAttribute("channel4IsActive", "");
            model.addAttribute("generalSettingsIsActive", "");
        }
        if (channel == 1) {
            model.addAttribute("webControlIsActive", "");
            model.addAttribute("channel1IsActive", "");
            model.addAttribute("channel2IsActive", "active");
            model.addAttribute("channel3IsActive", "");
            model.addAttribute("channel4IsActive", "");
            model.addAttribute("generalSettingsIsActive", "");
        }
        if (channel == 2) {
            model.addAttribute("webControlIsActive", "");
            model.addAttribute("channel1IsActive", "");
            model.addAttribute("channel2IsActive", "");
            model.addAttribute("channel3IsActive", "active");
            model.addAttribute("channel4IsActive", "");
            model.addAttribute("generalSettingsIsActive", "");
        }
        if (channel == 3) {
            model.addAttribute("webControlIsActive", "");
            model.addAttribute("channel1IsActive", "");
            model.addAttribute("channel2IsActive", "");
            model.addAttribute("channel3IsActive", "");
            model.addAttribute("channel4IsActive", "active");
            model.addAttribute("generalSettingsIsActive", "");
        }

    }

}

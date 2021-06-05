package net.cyberdone.commutator.controller.cyberplant;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.ProductDto;
import net.cyberdone.commutator.model.entity.Device;
import net.cyberdone.commutator.model.entity.DeviceChannel;
import net.cyberdone.commutator.model.entity.DeviceData;
import net.cyberdone.commutator.model.entity.DeviceSettings;
import net.cyberdone.commutator.service.DeviceService;
import net.cyberdone.commutator.service.ProductService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cyberplant")
public class CyberPlantController {

    private final DeviceService deviceService;
    private final ProductService productService;

    @GetMapping
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String getCyberPlantDevicePage(@RequestParam("uid") String UID,
                                   Model model) {
        Device device = deviceService.getDevice(UID);
        List<DeviceChannel> channels = device.getChannels();
        DeviceSettings settings = device.getSettings();

        ProductDto product = productService.getProduct(UID);
        model.addAttribute("device", device);
        model.addAttribute("product", product);
        model.addAttribute("settings", settings);
        model.addAttribute("channel1", channels.get(0));
        model.addAttribute("channel2", channels.get(1));
        model.addAttribute("channel3", channels.get(2));
        model.addAttribute("channel4", channels.get(3));

        model.addAttribute("settings", settings);
        setActive(model);
        log.info("getCyberPlantDevicePage");
        return "cyber-plant";
    }

    @GetMapping("/moisture/{channelId}")
    @PreAuthorize("hasAnyAuthority('device:write','device:update')")
    String getCyberPlantDevicePage(@PathVariable String channelId,
                                   @RequestParam("uid") String UID,
                                   Model model) {
        Device device = deviceService.getDevice(UID);
        model.addAttribute("device", device);
        model.addAttribute("channelId", channelId);
        List<DeviceData> allSensorsData = device.getData();
        String SENSOR_NAME = "SENSOR_" + channelId;
        List<DeviceData> currentSensorData = allSensorsData
                .stream()
                .filter(deviceData -> SENSOR_NAME.equals(deviceData.getName()))
                .collect(Collectors.toList());

        List<DeviceData> last60seconds = currentSensorData
                .stream()
                .filter(last60s -> last60s.getCreated().getMinute() *
                        last60s.getCreated().getHour() *
                        last60s.getCreated().getDayOfYear() *
                        last60s.getCreated().getYear()
                        == LocalDateTime.now().getMinute() *
                        LocalDateTime.now().getHour() *
                        LocalDateTime.now().getDayOfYear() *
                        LocalDateTime.now().getYear())
                .collect(Collectors.toList());
        System.out.println(
                "##################################### last60seconds  #######################################3");
        System.out.println(last60seconds);
        model.addAttribute("last60seconds", last60seconds);


        List<DeviceData> last60minutes = currentSensorData
                .stream()
                .filter(last60m -> last60m.getCreated().getHour() *
                        last60m.getCreated().getDayOfYear() *
                        last60m.getCreated().getYear()
                        == LocalDateTime.now().getHour() *
                        LocalDateTime.now().getDayOfYear() *
                        LocalDateTime.now().getYear())
                .collect(Collectors.toList());
        System.out.println(
                "##################################### last60minutes  #######################################3");
        System.out.println(last60minutes);
        model.addAttribute("last60minutes", last60minutes);

        List<DeviceData> lastMonth = currentSensorData
                .stream()
                .filter(month -> month.getCreated().getMonth().getValue() * month.getCreated().getYear() ==
                        LocalDateTime.now().getYear() * LocalDateTime.now().getMonth().getValue())
                .collect(Collectors.toList());
        System.out.println("##################################### lastMonth  #######################################3");
        System.out.println(lastMonth);
        model.addAttribute("lastMonth", lastMonth);

        return "cyberplant-data";
    }


    private void setActive(Model model) {
        model.addAttribute("webControlIsActive", "active");
        model.addAttribute("channel1IsActive", "");
        model.addAttribute("channel2IsActive", "");
        model.addAttribute("channel3IsActive", "");
        model.addAttribute("channel4IsActive", "");
        model.addAttribute("generalSettingsIsActive", "");
    }

}

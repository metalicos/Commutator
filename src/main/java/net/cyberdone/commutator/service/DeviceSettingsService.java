package net.cyberdone.commutator.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.DeviceSettings;
import net.cyberdone.commutator.model.repository.DeviceSettingsRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeviceSettingsService {

    private final DeviceSettingsRepository deviceSettingsRepository;

    public Set<DeviceSettings> getDeviceSettingsSet() {
        log.info("getting DeviceSettingsSet from database");
        List<DeviceSettings> deviceSettings = deviceSettingsRepository.findAll();
        return new HashSet<>(deviceSettings);
    }


    public DeviceSettings getDeviceSettings(Long id) {
        log.info("getting DeviceSettings from database by id {}", id);
        return deviceSettingsRepository.findDeviceSettingsById(id)
                .orElseThrow(EntityNotFoundException::new);
    }


    public DeviceSettings createDeviceSettings(DeviceSettings deviceSettings) {
        log.info("creating DeviceSettings {}", deviceSettings);
        if (!deviceSettingsRepository.existsDeviceSettingsById(deviceSettings.getId())) {
            return deviceSettingsRepository.save(deviceSettings);
        }
        throw new EntityExistsException();
    }

    public DeviceSettings updateDeviceSettings(DeviceSettings deviceSettings) {
        log.info("updating DeviceSettings in database with: {}", deviceSettings);
        return deviceSettingsRepository.save(deviceSettings);
    }


    public void deleteDeviceSettings(Long id) {
        log.info("deleting DeviceSettings in database by id {}", id);
        DeviceSettings deviceSettings = deviceSettingsRepository.findDeviceSettingsById(id)
                .orElseThrow(EntityNotFoundException::new);
        deviceSettingsRepository.delete(deviceSettings);
    }
}

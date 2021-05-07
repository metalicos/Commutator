package net.cyberdone.commutator.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.Device;
import net.cyberdone.commutator.model.entity.DeviceChannel;
import net.cyberdone.commutator.model.entity.DeviceSettings;
import net.cyberdone.commutator.model.repository.DeviceChannelRepository;
import net.cyberdone.commutator.model.repository.DeviceDataRepository;
import net.cyberdone.commutator.model.repository.DeviceRepository;
import net.cyberdone.commutator.model.repository.DeviceSettingsRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeviceService {

    private final DeviceRepository deviceRepository;
    private final DeviceDataRepository deviceDataRepository;
    private final DeviceChannelRepository deviceChannelRepository;
    private final DeviceSettingsRepository deviceSettingsRepository;

    public Set<Device> getDeviceSet() {
        log.info("getting DeviceSet from database");
        List<Device> cyberPlantV1List = deviceRepository.findAll();
        return new HashSet<>(cyberPlantV1List);
    }


    public Device getDevice(String UID) {
        log.info("getting Device from database by UID {}", UID);
        return deviceRepository.findDeviceByUID(UID)
                .orElseThrow(EntityNotFoundException::new);
    }

    @Transactional
    public Device createDevice(Device newDevice) {
        log.info("creating Device {}", newDevice);
        if (!deviceRepository.existsDeviceByUID(newDevice.getUID())) {
            Device device = deviceRepository.save(newDevice);

            DeviceSettings settings = new DeviceSettings();
            settings.setDevice(device);
            deviceSettingsRepository.save(settings);

            List<DeviceChannel> channels = Arrays.asList(new DeviceChannel(),new DeviceChannel(),
                    new DeviceChannel(),new DeviceChannel());
            channels.forEach(d->d.setDevice(device));
            deviceChannelRepository.saveAll(channels);

            return device;
        }
        throw new EntityExistsException();
    }

    public Device updateDevice(Device device) {
        log.info("updating Device in database with: {}", device);
        return deviceRepository.save(device);
    }


    public void deleteDevice(String UID) {
        log.info("deleting Device in database by UID {}", UID);
        Device cyberPlantV1 = deviceRepository.findDeviceByUID(UID)
                .orElseThrow(EntityNotFoundException::new);
        deviceRepository.delete(cyberPlantV1);
    }

}

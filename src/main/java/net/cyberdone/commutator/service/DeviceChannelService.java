package net.cyberdone.commutator.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.DeviceChannel;
import net.cyberdone.commutator.model.repository.DeviceChannelRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeviceChannelService {

    private DeviceChannelRepository deviceChannelRepository;

    public Set<DeviceChannel> getDeviceChannelSet() {
        log.info("getting DeviceChannelSet from database");
        List<DeviceChannel> deviceChannels = deviceChannelRepository.findAll();
        return new HashSet<>(deviceChannels);
    }


    public DeviceChannel getDeviceChannel(Long id) {
        log.info("getting DeviceChannel from database by id {}", id);
        return deviceChannelRepository.findDeviceChannelById(id)
                .orElseThrow(EntityNotFoundException::new);
    }


    public DeviceChannel createDeviceChannel(DeviceChannel deviceChannel) {
        log.info("creating DeviceChannel {}", deviceChannel);
        if (!deviceChannelRepository.existsDeviceChannelById(deviceChannel.getId())) {
            return deviceChannelRepository.save(deviceChannel);
        }
        throw new EntityExistsException();
    }

    public DeviceChannel updateDeviceChannel(DeviceChannel newDeviceChannel) {
        log.info("updating DeviceChannel in database with: {}", newDeviceChannel);
        return deviceChannelRepository.save(newDeviceChannel);
    }


    public void deleteDeviceChannel(Long id) {
        log.info("deleting DeviceChannel in database by id {}", id);
        DeviceChannel deviceChannel = deviceChannelRepository.findDeviceChannelById(id)
                .orElseThrow(EntityNotFoundException::new);
        deviceChannelRepository.delete(deviceChannel);
    }

}


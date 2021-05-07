package net.cyberdone.commutator.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.DeviceData;
import net.cyberdone.commutator.model.repository.DeviceDataRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeviceDataService {

    private DeviceDataRepository deviceDataRepository;

    public Set<DeviceData> getDeviceDataSet() {
        log.info("getting DeviceDataSet from database");
        List<DeviceData> cyberPlantV1List = deviceDataRepository.findAll();
        return new HashSet<>(cyberPlantV1List);
    }


    public DeviceData getDeviceData(Long id) {
        log.info("getting DeviceData from database by id {}", id);
        return deviceDataRepository.findDeviceDataById(id)
                .orElseThrow(EntityNotFoundException::new);
    }

    public DeviceData getDeviceData(String name) {
        log.info("getting DeviceData from database by name {}", name);
        return deviceDataRepository.findDeviceDataByName(name)
                .orElseThrow(EntityNotFoundException::new);
    }

    public DeviceData createDeviceData(DeviceData deviceData) {
        log.info("creating DeviceData {}", deviceData);
        if (!deviceDataRepository.existsDeviceDataById(deviceData.getId())) {
            return deviceDataRepository.save(deviceData);
        }
        throw new EntityExistsException();
    }

    public DeviceData updateDeviceData(DeviceData newDeviceData) {
        log.info("updating DeviceData in database with: {}", newDeviceData);
        return deviceDataRepository.save(newDeviceData);
    }


    public void deleteDeviceData(Long id) {
        log.info("deleting DeviceData in database by id {}", id);
        DeviceData deviceData = deviceDataRepository.findDeviceDataById(id)
                .orElseThrow(EntityNotFoundException::new);
        deviceDataRepository.delete(deviceData);
    }

    public void deleteDeviceData(String name) {
        log.info("deleting DeviceData in database by name {}", name);
        DeviceData deviceData = deviceDataRepository.findDeviceDataByName(name)
                .orElseThrow(EntityNotFoundException::new);
        deviceDataRepository.delete(deviceData);
    }
}

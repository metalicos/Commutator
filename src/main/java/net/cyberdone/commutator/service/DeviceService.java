package net.cyberdone.commutator.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.cyberplant.CyberPlantDto;
import net.cyberdone.commutator.model.entity.Device;
import net.cyberdone.commutator.model.entity.DeviceChannel;
import net.cyberdone.commutator.model.entity.DeviceData;
import net.cyberdone.commutator.model.entity.DeviceSettings;
import net.cyberdone.commutator.model.repository.DeviceChannelRepository;
import net.cyberdone.commutator.model.repository.DeviceDataRepository;
import net.cyberdone.commutator.model.repository.DeviceRepository;
import net.cyberdone.commutator.model.repository.DeviceSettingsRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional
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

    public Device updateDevice(CyberPlantDto cpd) {
        log.info("updating Device in database with: {}", cpd);
        Device device = deviceRepository.findDeviceByUID(cpd.getUId())
                .orElseThrow(EntityNotFoundException::new);
        List<DeviceData> dd = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            DeviceData deviceData = new DeviceData();
            deviceData.setDevice(device);
            deviceData.setName("sensor_"+i);
            deviceData.setValue(cpd.getAnalogSensorData()[i]);
            dd.add(deviceDataRepository.save(deviceData));
        }
        List<DeviceChannel> chs = device.getChannels();
        for (int i = 0; i < 4; i++) {
            DeviceChannel ch = chs.get(i);
            ch.setChannelType(cpd.getChannelType()[i]);
            ch.setChannelLogic(cpd.getChannelLogic()[i]);
            ch.setAnalogSensorData(cpd.getAnalogSensorData()[i]);
            ch.setMaintainValue(cpd.getMaintainValue()[i]);
            ch.setChannelOpenValue(cpd.getChannelValue()[i]);
            ch.setChannelControlMode(cpd.getChannelControlMode()[i]);
            ch.setPidDirection(cpd.getPidDirection()[i]);
            ch.setPidKp(cpd.getPidKd()[i]);
            ch.setPidKi(cpd.getPidKi()[i]);
            ch.setPidKd(cpd.getPidKd()[i]);
            ch.setPidDt(cpd.getPidDt()[i]);
            ch.setRelayDirection(cpd.getRelayDirection()[i]);
            ch.setRelayHysteresis(cpd.getRelayHysteresis()[i]);
            ch.setRelayK(cpd.getRelayK()[i]);
            ch.setRelayDt(cpd.getRelayDt()[i]);
            ch.setDevice(device);
            chs.set(i, ch);
        }

        DeviceSettings ds = device.getSettings();
        ds.setSound(cpd.getSound());
        ds.setWaterCheck(cpd.getWaterCheck());
        ds.setScreensaver(cpd.getScreensaver());
        ds.setScreensaverType(cpd.getScreensaverType());
        ds.setScreensaverAfter(cpd.getScreensaverAfter());
        ds.setScreenLight(cpd.getScreenLight());
        ds.setDateSecond(cpd.getDateSecond());
        ds.setDateMinute(cpd.getDateMinute());
        ds.setDateHour(cpd.getDateHour());
        ds.setDateDay(cpd.getDateDay());
        ds.setDateMonth(cpd.getDateMonth());
        ds.setDateYear(cpd.getDateYear());
        ds.setWifiSSID(cpd.getWifiSSID());
        ds.setWifiPASS(cpd.getWifiPASS());
        ds.setSendDataToServerEvery(cpd.getSendDataToServerEvery());
        ds.setCheckSensorEvery(cpd.getCheckSensorEvery());
        ds.setTurnOff(cpd.getTurnOff());
        ds.setRestartCounter(cpd.getRestartCounter());
        ds.setWorkedTimeInSeconds(cpd.getWorkedTimeInSeconds());
        ds.setWorkedTimeInHours(cpd.getWorkedTimeInHours());

        device.setChannels(chs);
        device.setData(dd);
        device.setSettings(ds);

        return deviceRepository.save(device);
    }

    public void deleteDevice(String UID) {
        log.info("deleting Device in database by UID {}", UID);
        Device cyberPlantV1 = deviceRepository.findDeviceByUID(UID)
                .orElseThrow(EntityNotFoundException::new);
        deviceRepository.delete(cyberPlantV1);
    }

}

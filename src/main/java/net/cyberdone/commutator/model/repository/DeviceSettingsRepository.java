package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.DeviceSettings;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DeviceSettingsRepository extends JpaRepository<DeviceSettings, Long> {

    Optional<DeviceSettings> findDeviceSettingsById(Long is);

    void deleteDeviceSettingsById(Long id);

    boolean existsDeviceSettingsById(Long id);
}

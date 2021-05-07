package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.DeviceData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DeviceDataRepository extends JpaRepository<DeviceData,Long> {

    Optional<DeviceData> findDeviceDataById(Long id);

    Optional<DeviceData> findDeviceDataByName(String name);

    void deleteDeviceDataById(Long id);

    boolean existsDeviceDataById(Long id);
}

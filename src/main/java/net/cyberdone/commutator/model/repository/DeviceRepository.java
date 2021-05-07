package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.Device;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DeviceRepository extends JpaRepository<Device, Long> {

    Optional<Device> findDeviceByUID(String UID);

    Optional<Device> findDeviceById(Long id);

    void deleteDeviceByUID(String UID);

    boolean existsDeviceByUID(String UID);
}

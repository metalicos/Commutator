package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.DeviceChannel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DeviceChannelRepository extends JpaRepository<DeviceChannel, Long> {

    Optional<DeviceChannel> findDeviceChannelById(Long is);

    void deleteDeviceChannelById(Long id);

    boolean existsDeviceChannelById(Long id);
}

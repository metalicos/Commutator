package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.Channel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChannelRepository extends JpaRepository<Channel, Long> {
}

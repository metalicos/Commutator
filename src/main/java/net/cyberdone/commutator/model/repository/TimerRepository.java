package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.Timer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TimerRepository extends JpaRepository<Timer, Long> {
}

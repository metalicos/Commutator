package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.Setting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SettingRepository extends JpaRepository<Setting, Long> {
}

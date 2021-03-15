package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataRepository extends JpaRepository<Data, Long> {
}

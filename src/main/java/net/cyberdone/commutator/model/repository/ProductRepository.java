package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.enums.DeviceName;
import net.cyberdone.commutator.model.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Optional<Product> findProductByUIDAndDevice(String UID, DeviceName device);

    Optional<Product> findProductById(Long id);

    Optional<Product> findProductByUID(String UID);

    void deleteProductByUID(String UID);

    boolean existsProductById(Long id);

    boolean existsProductByUID(String UID);
}

package net.cyberdone.commutator.model.repository;

import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.model.entity.enums.DeviceInfo;
import net.cyberdone.commutator.model.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Optional<Product> findProductByUIDAndDevice(String UID, DeviceInfo device);

    Set<Product> findProductsByUser(User user);

    Optional<Product> findProductById(Long id);

    Optional<Product> findProductByUID(String UID);

    void deleteProductByUID(String UID);

    boolean existsProductById(Long id);

    boolean existsProductByUID(String UID);

}

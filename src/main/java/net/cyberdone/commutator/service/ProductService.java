package net.cyberdone.commutator.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.converter.ProductProductDtoConverter;
import net.cyberdone.commutator.model.dto.ProductDto;
import net.cyberdone.commutator.model.entity.Product;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.model.repository.ProductRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public Set<Product> getProductsSet() {
        log.info("getting ProductsSet from database");
        List<Product> productList = productRepository.findAll();
        return new HashSet<>(productList);
    }

    public ProductDto getProduct(String UID) {
        log.info("getting Product from database by UID {}", UID);
        Product product = productRepository.findProductByUID(UID)
                .orElseThrow(EntityNotFoundException::new);
        ProductProductDtoConverter productDtoConverter = new ProductProductDtoConverter();
        return productDtoConverter.toDto(product);
    }

    public Product getProduct(Long id) {
        log.info("getting Product from database by id {}", id);
        return productRepository.findProductById(id)
                .orElseThrow(EntityNotFoundException::new);
    }

    public Product createProduct(Product product) {
        log.info("creating Product {} with UID = {}", product, product.getUID());
        if (!productRepository.existsProductByUID(product.getUID())) {
            product = productRepository.save(product);
            return product;
        }
        throw new EntityExistsException();
    }

    public Product updateProduct(Product product) {
        log.info("updating Product in database with: {}", product);
        return productRepository.save(product);
    }

    public void deleteProduct(String UID) {
        log.info("deleting Product in database by UID {}", UID);
        Product product = productRepository.findProductByUID(UID)
                .orElseThrow(EntityNotFoundException::new);
        productRepository.delete(product);
    }

    public void deleteProduct(Long id) {
        log.info("deleting Product in database by id {}", id);
        Product product = productRepository.findProductById(id)
                .orElseThrow(EntityNotFoundException::new);
        productRepository.delete(product);
    }

    public Set<Product> getUserProducts(User user) {
        Set<Product> products = productRepository.findProductsByUser(user);
        if (products != null) {
            return products;
        }
        throw new EntityNotFoundException();
    }
}

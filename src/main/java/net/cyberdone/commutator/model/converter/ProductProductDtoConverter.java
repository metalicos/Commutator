package net.cyberdone.commutator.model.converter;

import net.cyberdone.commutator.component.ImageConverter;
import net.cyberdone.commutator.model.dto.ProductDto;
import net.cyberdone.commutator.model.entity.Product;

public class ProductProductDtoConverter implements Converter<Product, ProductDto> {

    @Override
    public ProductDto toDto(Product product) {

        return ProductDto.builder()
                .id(product.getId())
                .created(product.getCreated())
                .updated(product.getUpdated())
                .UID(product.getUID())
                .device(product.getDevice())
                .description(product.getDescription())
                .model(product.getModel())
                .type(product.getType())
                .color(product.getColor())
                .base64photo(ImageConverter.convertBlobToBase64StringImage(product.getPhoto()))
                .user(product.getUser())
                .build();
    }

    @Override
    public Product toEntity(ProductDto productDto) {
        Product product = new Product();
        product.setId(productDto.getId());
        product.setUID(productDto.getUID());
        product.setDevice(productDto.getDevice());
        product.setDescription(productDto.getDescription());
        product.setModel(productDto.getModel());
        product.setType(productDto.getType());
        product.setColor(productDto.getColor());
        product.setPhoto(ImageConverter.convertBase64StringImageToBlob(productDto.getBase64photo()));
        product.setUser(productDto.getUser());
        product.setCreated(productDto.getCreated());
        product.setUpdated(productDto.getUpdated());
        return product;
    }
}

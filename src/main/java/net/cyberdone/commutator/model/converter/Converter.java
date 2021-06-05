package net.cyberdone.commutator.model.converter;

public interface Converter<ENTITY,DTO> {
    DTO toDto(ENTITY entity);
    ENTITY toEntity(DTO dto);
}

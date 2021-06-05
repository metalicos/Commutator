package net.cyberdone.commutator.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.model.entity.enums.DeviceInfo;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
    private Long id;
    private LocalDateTime created;
    private LocalDateTime updated;
    private String UID;
    private DeviceInfo device;
    private String description;
    private String model;
    private String type;
    private String color;
    private String base64photo;
    private User user;
}

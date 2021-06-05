package net.cyberdone.commutator.model.dto;

import lombok.*;
import net.cyberdone.commutator.model.entity.DeviceChannel;
import net.cyberdone.commutator.model.entity.DeviceData;
import net.cyberdone.commutator.model.entity.DeviceSettings;
import net.cyberdone.commutator.model.entity.enums.DeviceStatus;

import java.util.List;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class DeviceDto {
    private String name;
    private String model;
    private String color;
    private String decription;
    private String customName;
    private String photo;
    private String UID;
    private DeviceStatus deviceStatus;
    private List<DeviceChannel> channels;
    private List<DeviceData> data;
    private DeviceSettings settings;
}

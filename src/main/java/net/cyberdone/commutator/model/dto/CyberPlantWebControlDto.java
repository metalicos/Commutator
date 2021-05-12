package net.cyberdone.commutator.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Builder
@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class CyberPlantWebControlDto {
    private String UID;
    private Integer command;
}

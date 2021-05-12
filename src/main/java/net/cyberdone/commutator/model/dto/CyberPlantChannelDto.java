package net.cyberdone.commutator.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import net.cyberdone.commutator.model.entity.DeviceChannel;

@Builder
@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class CyberPlantChannelDto {
    private String UID;
    private Integer channel;
    private Integer type;
    private Integer logic;
    private Double maintainValue;
    private Integer openValue;
    private Integer controlMode;
    private Integer pidDirection;
    private Double pidKp;
    private Double pidKi;
    private Double pidKd;
    private Integer pidDt;
    private Integer relayDirection;
    private Double relayHysteresis;
    private Double relayK;
    private Integer relayDt;

    public DeviceChannel mapCyberPlantChannelDtoToDeviceChannel(CyberPlantChannelDto channelDto) {
        DeviceChannel deviceChannel = new DeviceChannel();
        deviceChannel.setChannelType(channelDto.type);
        deviceChannel.setChannelLogic(channelDto.logic);
        deviceChannel.setMaintainValue(channelDto.maintainValue);
        deviceChannel.setChannelOpenValue(channelDto.openValue);
        deviceChannel.setChannelControlMode(channelDto.controlMode);
        deviceChannel.setPidDirection(channelDto.pidDirection);
        deviceChannel.setPidKp(channelDto.pidKp);
        deviceChannel.setPidKi(channelDto.pidKi);
        deviceChannel.setPidKd(channelDto.pidKd);
        deviceChannel.setPidDt(channelDto.pidDt);
        deviceChannel.setRelayDirection(channelDto.relayDirection);
        deviceChannel.setRelayHysteresis(channelDto.relayHysteresis);
        deviceChannel.setRelayK(channelDto.relayK);
        deviceChannel.setRelayDt(channelDto.relayDt);
        return deviceChannel;
    }
}

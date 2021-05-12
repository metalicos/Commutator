package net.cyberdone.commutator.validator.validation;

import lombok.AllArgsConstructor;
import net.cyberdone.commutator.model.dto.CyberPlantChannelDto;
import net.cyberdone.commutator.validator.CustomValidator;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
@AllArgsConstructor
public class CyberPlantChannelValidation {

    private final CustomValidator validator;

    public boolean validate(Model model, CyberPlantChannelDto channelDto) {

        if (!isPassed(model, channelDto, validator.strNotNullAndNotEmpty(channelDto.getUID()),
                "error", "UID пристрою не вказаний"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getChannel()),
                "error", "Номер каналу не передано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getChannel() < 0 || channelDto.getChannel() > 3),
                "error", "Неможливий номер каналу"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getType()),
                "errorChannelType", "Тип каналу не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getType() < 0 || channelDto.getType() > 1),
                "errorChannelType", "Неможливий тип каналу"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getLogic()),
                "errorChannelLogic", "Логіка каналу не вказана"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getLogic() < 0 || channelDto.getLogic() > 1),
                "errorChannelLogic", "Неможлива логіка каналу"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getMaintainValue()),
                "errorMaintainValue", "Підтримуване значення не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getMaintainValue() < 0 || channelDto.getMaintainValue() > 100),
                "errorMaintainValue", "Неможливо задати підтримуване значення меньше 0 або більше 100 %"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getOpenValue()),
                "errorOpenValue", "Значення відкритості каналу не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getOpenValue() < 0 || channelDto.getOpenValue() > 65535),
                "errorOpenValue", "Неможливо задати відкритість каналу більше 65 535 або меньше 0"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getControlMode()),
                "errorControlMode", "Тип керування каналом не вказано"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getPidDirection()),
                "errorPidDirection", "Напрям ПІД регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getPidKp()),
                "errorPidKp", "Пропорційний коефіцієнт ПІД регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getPidKp() < -30 || channelDto.getPidKp() > 30),
                "errorPidKp", "Коефіцієнт надто малий або надто великий"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getPidKi()),
                "errorPidKi", "Інтегральний коефіцієнт ПІД регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getPidKi() < -30 || channelDto.getPidKi() > 30),
                "errorPidKi", "Коефіцієнт надто малий або надто великий"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getPidKd()),
                "errorPidKd", "Диференціальний коефіцієнт ПІД регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getPidKd() < -30 || channelDto.getPidKd() > 30),
                "errorPidKd", "Коефіцієнт надто малий або надто великий"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getPidDt()),
                "errorPidDt", "Час ітерації не вказано"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getRelayDirection()),
                "errorRelayDirection", "Напрям регулювання релейного регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getRelayHysteresis()),
                "errorRelayHysteresis", "Значення гістерезису релейного регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getRelayHysteresis() < -100 || channelDto.getRelayHysteresis() > 100),
                "errorRelayHysteresis", "Коефіцієнт надто малий або надто великий"))
            return false;

        if (!isPassed(model, channelDto, validator.objNotNull(channelDto.getRelayK()),
                "errorRelayK", "Значення коефіцієнта релейного регулятора не вказано"))
            return false;

        if (!isPassed(model, channelDto, !(channelDto.getRelayK() < -100 || channelDto.getRelayK() > 100),
                "errorRelayK", "Коефіцієнт надто малий або надто великий"))
            return false;

        return isPassed(model, channelDto, validator.objNotNull(channelDto.getRelayDt()),
                "errorRelayDt", "Час ітерації не вказано");

    }

    private boolean isPassed(Model model, CyberPlantChannelDto dto, boolean isValid, String attribute, String error) {
        if (!isValid) {
            model.addAttribute(attribute, error);
            model.addAttribute("channelDto", dto);
            return false;
        }
        return true;
    }

}

package net.cyberdone.commutator.validator.validation;

import lombok.AllArgsConstructor;
import net.cyberdone.commutator.model.dto.CyberPlantWebControlDto;
import net.cyberdone.commutator.validator.CustomValidator;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
@AllArgsConstructor
public class CyberPlantWebControlValidation {

    private final CustomValidator validator;

    public boolean validate(Model model, CyberPlantWebControlDto dto) {

        if (!isPassed(model, dto, validator.strNotNullAndNotEmpty(dto.getUID()),
                "error", "UID пристрою не вказаний"))
            return false;

        if (!isPassed(model, dto, validator.objNotNull(dto.getCommand()),
                "error", "Команду не передано"))
            return false;

        return isPassed(model, dto, !(dto.getCommand() < 0),
                "error", "Неправильний формат команди");

    }

    private boolean isPassed(Model model, CyberPlantWebControlDto dto, boolean isValid, String attribute, String error) {
        if (!isValid) {
            model.addAttribute(attribute, error);
            return false;
        }
        return true;
    }
}

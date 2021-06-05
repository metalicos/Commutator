package net.cyberdone.commutator.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.component.SessionInfo;
import net.cyberdone.commutator.model.converter.Converter;
import net.cyberdone.commutator.model.converter.ProductProductDtoConverter;
import net.cyberdone.commutator.model.dto.ProductDto;
import net.cyberdone.commutator.model.entity.Product;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.service.ProductService;
import net.cyberdone.commutator.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@AllArgsConstructor
@RequestMapping("/add")
@PreAuthorize("hasAnyAuthority('device:write')")
public class AddController {

    private final UserService userService;
    private final ProductService productService;
    private final SessionInfo sessionInfo;

    @GetMapping("/new-device")
    @PreAuthorize("hasAuthority('device:write')")
    public String addNewDevice(@RequestParam("UID") String UID,
                               Model model,
                               HttpSession session) {

        if (!isPassed(model, (UID != null), "error", "UID пристрою не вказаний"))
            return "devices";
        try {
            User user = userService.getUser(sessionInfo.getUserEmail());
            ProductDto product = productService.getProduct(UID);
            product.setUser(user);
            Converter<Product,ProductDto> converter = new ProductProductDtoConverter();
            productService.updateProduct(converter.toEntity(product));
        } catch (Exception ex) {
            model.addAttribute("error", "Помилка додавання нового пристрою");
            ex.printStackTrace();
            return "devices";
        }
        System.out.println(" $$$$ Device added to user $$$$");
        return "redirect:/devices";
    }

    private boolean isPassed(Model model, boolean isValid, String attribute, String error) {
        if (!isValid) {
            model.addAttribute(attribute, error);
            return false;
        }
        return true;
    }

}

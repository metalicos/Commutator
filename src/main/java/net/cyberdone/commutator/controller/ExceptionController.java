package net.cyberdone.commutator.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.persistence.EntityNotFoundException;

@Slf4j
@Controller
public class ExceptionController {

    @GetMapping("/accessDenied")
    public String accessDeniedController(){
        log.info("ExceptionController -- Access Denied");
        return "errors/errorForbidden";
    }

    @ExceptionHandler(EntityNotFoundException.class)
    public String entityNotFound() {
        return "errors/errorNotFound";
    }

    @ResponseStatus(value = HttpStatus.FORBIDDEN)
    public String forbiddenError() {
        return "errors/errorForbidden";
    }

    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    public String badRequest() {
        return "errors/errorBadRequest";
    }

    @ResponseStatus(value = HttpStatus.GATEWAY_TIMEOUT)
    public String gatewayTimeout() {
        return "errors/errorGatewayTimeout";
    }

    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    public String notFound() {
        return "errors/errorNotFound";
    }
}

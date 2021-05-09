package net.cyberdone.commutator.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.persistence.EntityNotFoundException;

@ControllerAdvice
public class ExceptionHandlingController {

//
//    @ResponseStatus(value = HttpStatus.CONFLICT,
//            reason = "Data integrity violation")  // 409
//    @ExceptionHandler(DataIntegrityViolationException.class)
//    public void conflict() {
//
//    }
//
//    @ExceptionHandler({SQLException.class, DataAccessException.class})
//    public String databaseError() {
//        return "databaseError";
//    }
//
//    @ExceptionHandler(Exception.class)
//    public void handleError() {
//
//    }

    @ExceptionHandler(EntityNotFoundException.class)
    public String entityNotFound() {
        return "errorNotFound";
    }

    @ResponseStatus(value = HttpStatus.FORBIDDEN)
    public String forbiddenError() {
        return "errorForbidden";
    }

    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    public String badRequest() {
        return "errorBadRequest";
    }

    @ResponseStatus(value = HttpStatus.GATEWAY_TIMEOUT)
    public String gatewayTimeout() {
        return "errorGatewayTimeout";
    }

    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    public String notFound() {
        return "errorNotFound";
    }
}
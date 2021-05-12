package net.cyberdone.commutator.validator;

import org.springframework.stereotype.Component;

@Component
public class CustomValidator{

    public static final String PASSWORD = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,20}";
    public static final String EMAIL =
            "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
    public static final String NAME_SURNAME_PATRONYMIC_EN =
            "(?i)(^[a-z])((?![ .,'-]$)[a-z .,'-]){0,24}$";
    public static final String NAME_SURNAME_PATRONYMIC_UA =
            "(?i)(^[абвгґдеєжзиіїйклмнопрстуфхцчшщьюяыъэё])" +
                    "((?![ .,'-]$)[абвгґдеєжзиіїйклмнопрстуфхцчшщьюяыъэё .,'-]){0,24}$";
    public static final String UNSIGNED_DOUBLE = "([0-9]+.[0-9]+)|([0-9]+)";
    public static final String UNSIGNED_INTEGER = "[0-9]+";

    public boolean strNotNullAndNotEmpty(String str){
        return (str!=null) && (!str.isEmpty());
    }
    public boolean objNotNull(Object obj){
        return (obj!=null);
    }
}

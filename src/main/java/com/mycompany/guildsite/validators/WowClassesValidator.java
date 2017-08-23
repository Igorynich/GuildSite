package com.mycompany.guildsite.validators;

import com.mycompany.guildsite.data.WowClasses;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by User on 16.08.2017.
 */
@Component
public class WowClassesValidator implements Validator {
    public WowClassesValidator() {
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return WowClasses.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "shortName", "shortName.empty");
    }
}

package com.mycompany.guildsite.validators;

import com.mycompany.guildsite.data.GuildStatic;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by User on 10.09.2017.
 */
@Component(value = "gsvalidator")
public class GuildStaticValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return GuildStatic.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmpty(errors, "staticName", "staticName.empty");
    }
}

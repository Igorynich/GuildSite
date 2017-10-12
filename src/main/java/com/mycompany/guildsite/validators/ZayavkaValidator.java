package com.mycompany.guildsite.validators;

import com.mycompany.guildsite.data.WowClasses;
import com.mycompany.guildsite.data.Zayavka;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


/**
 * Created by User on 16.08.2017.
 */
@Component
public class ZayavkaValidator implements Validator {
    private static final Logger logger = Logger.getLogger(ZayavkaValidator.class);

    @Autowired
    @Qualifier(value = "wcvalidator")
    private Validator wowClassesValidator;

    @Autowired
    @Qualifier(value = "gsvalidator")
    private Validator guildStaticValidator;



/*    @Autowired
    public ZayavkaValidator(Validator wowClassesValidator) {
        if (wowClassesValidator == null) {
            throw new IllegalArgumentException("The supplied [Validator] is " +
                    "required and must not be null.");
        }
        if (!wowClassesValidator.supports(WowClasses.class)) {
            throw new IllegalArgumentException("The supplied [Validator] must " +
                    "support the validation of [Address] instances.");
        }
        this.wowClassesValidator = wowClassesValidator;
    }*/

    @Override
    public boolean supports(Class<?> aClass) {
        return Zayavka.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        //logger.debug("validate method of ZayavkaValidator is runnin");
        Zayavka zayavka = (Zayavka) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.empty");

        if ((zayavka.getName().length()<2)||(zayavka.getName().length()>12)||(zayavka.getName().contains(" "))){
            errors.rejectValue("name", "name.size");
        }

        try {
            errors.pushNestedPath("wowClass");
            ValidationUtils.invokeValidator(this.wowClassesValidator, zayavka.getWowClass(), errors);

        } finally {
            errors.popNestedPath();
        }

        try {
            errors.pushNestedPath("gstatic");
            ValidationUtils.invokeValidator(this.guildStaticValidator, zayavka.getGstatic(), errors);

        } finally {
            errors.popNestedPath();
        }
        if (!zayavka.getIlvl().matches("[0-9]+")){
            errors.rejectValue("ilvl", "ilvl.pattern");
        }

        ValidationUtils.rejectIfEmpty(errors, "exp", "exp.empty");
    }
}

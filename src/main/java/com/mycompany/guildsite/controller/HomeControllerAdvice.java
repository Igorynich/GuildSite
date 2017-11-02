package com.mycompany.guildsite.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.guildsite.data.*;
import com.mycompany.guildsite.validators.ZayavkaValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by User on 05.09.2017.
 */
@ControllerAdvice
public class HomeControllerAdvice {

    private static final Logger logger = Logger.getLogger(HomeControllerAdvice.class);

    @Autowired
    private WowClassesRepository wcrep;

    @Autowired
    private GuildStaticRepository gsrep;

    @Autowired
    private ZayavkaValidator zayavkaValidator;



    @InitBinder("zayavka")
    public void dataBinding(WebDataBinder binder) {
        //logger.debug("Setting validator through @IntiBuilder");
        binder.setValidator(zayavkaValidator);

    }


    /*@ModelAttribute("staticlist")
    public List<GuildStatic> staticList() {
        List<GuildStatic> staticList = gsrep.findAll();
        return staticList;
    }*/

    /*@ModelAttribute("classList")
    public List<WowClasses> classList() {
        //logger.debug("Addin @ModelAttribute classlist");
        List<WowClasses> classList = wcrep.findAllClassesByLocale(LocaleContextHolder.getLocale().getLanguage());

        return classList;
    }*/

    /*@ModelAttribute("specList")
    public String specList() {
        List<WowClasses> specList = wcrep.findAllSpecsByLocale(LocaleContextHolder.getLocale().getLanguage());
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(specList);
        } catch (Exception e) {
            logger.error(e);
            //e.printStackTrace();
        }
        *//*for (WowClasses wc : specList){
            logger.debug(wc.getShortName()+ "");
        }*//*
        return json;
    }*/
    /*@ModelAttribute("specList")
    public List<WowClasses> specList() {
        List<WowClasses> specList = wcrep.findAllSpecsByLocale(LocaleContextHolder.getLocale().getLanguage());

        return specList;
    }*/



    @ExceptionHandler(RuntimeException.class)
    public ModelAndView excHandler(Exception ex) {

        logger.error("Houston, we've got a problem: ", ex);
        return new ModelAndView("error");
    }
}

package com.mycompany.guildsite.controller;

import com.mycompany.guildsite.data.WowClasses;
import com.mycompany.guildsite.data.WowClassesRepository;
import com.mycompany.guildsite.data.Zayavka;
import com.mycompany.guildsite.data.ZayavkaRepository;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.mycompany.guildsite.validators.ZayavkaValidator;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    private WowClassesRepository wcrep;
    private ZayavkaRepository zayarep;
    private ZayavkaValidator zayavkaValidator;

    @Autowired
    public HomeController(WowClassesRepository wcrep, ZayavkaRepository zayarep, ZayavkaValidator zayavkaValidator) {
        this.wcrep = wcrep;
        this.zayarep = zayarep;
        this.zayavkaValidator = zayavkaValidator;
    }

    @InitBinder
    public void dataBinding(WebDataBinder binder) {
        binder.setValidator(zayavkaValidator);

    }

    @ModelAttribute("classList")
    public List<WowClasses> classList() {
        List<WowClasses> classList = wcrep.findAllClassesAsObjects();
        return classList;
    }

    @ModelAttribute("specList")
    public List<WowClasses> specList() {
        List<WowClasses> specList = wcrep.findAllSpecs();
        return specList;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView zayavkaForm(@ModelAttribute Zayavka zayavka) throws IOException {
        ModelAndView m = new ModelAndView("home");
        //System.out.println("Sort by class: "+ zayarep.findAllSorted("wowClass.wowClass", "asc"));

        Locale locale = LocaleContextHolder.getLocale();
        System.out.println("ЛОКАЛЬ: " + locale.toString());
        return m;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String zayavkaConfirmation(@Valid @ModelAttribute("zayavka") Zayavka zaya, BindingResult errors) throws IOException {
        //zayavkaValidator.validate(zaya, errors);
        if (errors.hasErrors()) {
            return "home";
        }
        zayarep.save(zaya);
        return "redirect: confirmed";
    }

    @RequestMapping(value = "/confirmed", method = RequestMethod.GET)
    public String home() {
        return "confirmed";
    }

    @RequestMapping(value = "/vsezayavki")
    public ModelAndView vseZayavki(@RequestParam(value = "sortBy", required = false) String sortBy, @RequestParam(value = "dir", required = false) String dir) {
        ModelAndView m = new ModelAndView("vsezayavki");
        if (sortBy != null) {
            List<Zayavka> vseZayavkiSorted = zayarep.findAllSorted(sortBy, dir);
            m.addObject("zlist", vseZayavkiSorted);

        } else {
            //List<Zayavka> vseZayavki = zayarep.findAllSorted("wowClass.wowClass", "asc");
            List<Zayavka> vseZayavki = zayarep.findAll();
            m.addObject("zlist", vseZayavki);
        }
        return m;
    }

    @RequestMapping(value = "/zayavka/{id}", method = RequestMethod.GET)
    public ModelAndView zayavka(@PathVariable("id") long id) {
        ModelAndView m = new ModelAndView("zayavka");
        Zayavka zaya = zayarep.findOneById(id);
        zayarep.setReadById(id);
        //System.out.println("Zaya read? - " + zaya.isRead());
        m.addObject("zayavka", zaya);
        return m;
    }

    @RequestMapping(value = "/gslogin")
    public ModelAndView gsLogin() {
        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)){
            return new ModelAndView("redirect: vsezayavki");
        }*/
        return new ModelAndView("gslogin");

    }
}

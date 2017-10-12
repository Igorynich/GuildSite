package com.mycompany.guildsite.controller;

import com.mycompany.guildsite.data.GuildStaticRepository;
import com.mycompany.guildsite.data.Zayavka;
import com.mycompany.guildsite.data.ZayavkaRepository;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("zayavka")
public class HomeController {

    private static final Logger logger = Logger.getLogger(HomeController.class);

    @Autowired
    private ZayavkaRepository zayarep;

    @Autowired
    private GuildStaticRepository gsrep;

    @ModelAttribute("zayavka")
    public Zayavka getZayavka() {
        //logger.debug("Creating new Zayavka()");
        return new Zayavka();
    }

    @ModelAttribute("countUnread1")
    public int countUnread1() {
        int c = zayarep.countUnreadByGstaticId(1);
        //logger.debug("Count1 = " + c);
        return c;
    }

    @ModelAttribute("countUnread2")
    public int countUnread2() {
        int c = zayarep.countUnreadByGstaticId(2);
        //logger.debug("Count2 = " + c);
        return c;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView zayavkaForm() throws IOException {
        //logger.debug("Runnin zayavkaForm() with GET");
        ModelAndView m = new ModelAndView("home");
        //System.out.println("Sort by class: "+ zayarep.findAllSortedAndByLocaleAndByGstatisId("wowClass.wowClass", "asc"));

//        Locale locale = LocaleContextHolder.getLocale();
//        System.out.println("ЛОКАЛЬ: " + locale.toString());   //У нас язык - через getLanguage
//        System.err.println("");
        return m;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String zayavkaConfirmation(@Valid Zayavka zayavka, BindingResult errors, SessionStatus sessionStatus) throws IOException {
        //zayavkaValidator.validate(zaya, errors);
        //logger.debug("Runnin zayavkaForm() with POST");
        if (errors.hasErrors()) {
            return "home";
        }
        zayarep.save(zayavka);

        sessionStatus.setComplete();
        return "redirect: confirmed";
    }

    @RequestMapping(value = "/confirmed", method = RequestMethod.GET)
    public String home() {
        return "confirmed";
    }

    @RequestMapping(value = "/vsezayavki/{id}")
    public ModelAndView vseZayavki(@RequestParam(value = "sortBy", required = false) String sortBy, @RequestParam(value = "dir", required = false) String dir, @PathVariable("id") long id) {
        ModelAndView m = new ModelAndView("vsezayavki");
        m.addObject("gstatic", gsrep.findOneById(id).getStaticName());
        //logger.debug("sortBy = "+ sortBy+";dir = "+ dir);

        if (sortBy != null) {
            List<Zayavka> vseZayavkiSorted = zayarep.findAllSortedAndByLocaleAndByGstatisId(sortBy, dir, LocaleContextHolder.getLocale().getLanguage(), id);
            m.addObject("zlist", vseZayavkiSorted);

        } else {
            //List<Zayavka> vseZayavki = zayarep.findAllSortedAndByLocaleAndByGstatisId("wowClass.wowClass", "asc");
            //List<Zayavka> vseZayavki = zayarep.findAll();
            List<Zayavka> vseZayavki = zayarep.findAllByLocaleAndGstaticId(LocaleContextHolder.getLocale().getLanguage(), id);
            m.addObject("zlist", vseZayavki);
        }
        return m;
    }

    @RequestMapping(value = "/vseunread/{id}")
    public ModelAndView vseUnread(@PathVariable("id") long id, @RequestParam(value = "sortBy", required = false) String sortBy, @RequestParam(value = "dir", required = false) String dir) {
        ModelAndView m = new ModelAndView("vsezayavki");
        m.addObject("gstatic", gsrep.findOneById(id).getStaticName());

        if (sortBy != null) {
            List<Zayavka> vseUnreadSorted = zayarep.findAllSortedAndByLocaleAndByGstatisIdAndUnread(sortBy, dir, LocaleContextHolder.getLocale().getLanguage(), id);
            m.addObject("zlist", vseUnreadSorted);

        } else {
            //List<Zayavka> vseZayavki = zayarep.findAllSortedAndByLocaleAndByGstatisId("wowClass.wowClass", "asc");
            //List<Zayavka> vseZayavki = zayarep.findAll();
            List<Zayavka> vseZayavki = zayarep.findAllByLocaleAndGstaticIdAndUnread(LocaleContextHolder.getLocale().getLanguage(), id);
            m.addObject("zlist", vseZayavki);
        }
        return m;
    }

    @RequestMapping(value = "/getvse/{id}")
    @ResponseBody
    public List<Zayavka> getVse(@PathVariable("id") long id) {
        List<Zayavka> vseZayavki = zayarep.findAllByLocaleAndGstaticId(LocaleContextHolder.getLocale().getLanguage(), id);
        return vseZayavki;
    }

    @RequestMapping(value = "/zayavka/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Zayavka zayavka(@PathVariable("id") long id) {
//        ModelAndView m = new ModelAndView();
//        m.setViewName("zayavka");
        Zayavka zaya = zayarep.findOneByIdAndLocale(id, LocaleContextHolder.getLocale().getLanguage());
//        m.addObject("zayavka", zaya);
//        zayarep.setReadById(id);
//        return m;
        return zaya;
    }

    @RequestMapping(value = "/gslogin")
    public ModelAndView gsLogin() {
        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)){
            return new ModelAndView("redirect: vsezayavki");
        }*/
        return new ModelAndView("gslogin");

    }

    @RequestMapping(value = "/readList", method = RequestMethod.POST)
    @ResponseBody
    public String readList(@RequestBody String[] readList) {
        //logger.debug("readList = "+readList);
        String str = "";
        for (String s : readList){
            str=str+" "+ s;
        }
        logger.debug("ReadList = "+ str);
        return "allrightythen";
    }

    @RequestMapping(value = "/chosenList", method = RequestMethod.POST)
    @ResponseBody
    public String chosenList(@RequestBody String[] chosenList) {

        String str = "";
        for (String s : chosenList){
            str=str+" "+ s;
        }
        logger.debug("ChosenList = "+ str);
        return "allrightythen1";
    }
}

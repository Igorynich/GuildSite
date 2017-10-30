package com.mycompany.guildsite.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mycompany.guildsite.data.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

    public String currPath = "/";

    @Autowired
    private ZayavkaRepository zayarep;

    @Autowired
    private GuildStaticRepository gsrep;

    @Autowired
    private WowClassesRepository wcrep;

    @ModelAttribute("zayavka")
    public Zayavka getZayavka() {
        //logger.debug("Creating new Zayavka()");
        return new Zayavka();
    }

/*    @ModelAttribute("countUnread1")
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

    @ModelAttribute("countChosen1")
    public int countChosen1() {
        int c = zayarep.countChosenByGstaticId(1);
        //logger.debug("Count1 = " + c);
        return c;
    }

    @ModelAttribute("countChosen2")
    public int countChosen2() {
        int c = zayarep.countChosenByGstaticId(2);
        //logger.debug("Count1 = " + c);
        return c;
    }

    @RequestMapping("/getunread1")
    @ResponseBody
    public int getUnread1() {
        int c = zayarep.countUnreadByGstaticId(1);
        //logger.debug("Count1 = " + c);
        return c;
    }*/

    public String getCurrPath() {
        return currPath;
    }


    @RequestMapping("/getcounts")
    @ResponseBody
    public List<Integer> getCounts() {
        int c = zayarep.countUnreadByGstaticId(1);
        List<Integer> list = new LinkedList<Integer>();
        list.add(c);
        logger.debug("UCount1 = " + c);
        c = zayarep.countUnreadByGstaticId(2);
        list.add(c);
        logger.debug("UCount2 = " + c);
        c = zayarep.countChosenByGstaticId(1);
        list.add(c);
        logger.debug("CCount1 = " + c);
        c = zayarep.countChosenByGstaticId(2);
        list.add(c);
        logger.debug("CCount2 = " + c);
        //logger.debug("Count1 = " + c);
        return list;
    }

    @RequestMapping(value = "/getclasslist")
    @ResponseBody
    public List<WowClasses> classList() {
        List<WowClasses> classList = wcrep.findAllClassesByLocale(LocaleContextHolder.getLocale().getLanguage());
        return classList;
    }

    @RequestMapping(value = "/")
    public String home(HttpServletRequest req) {
        currPath = req.getServletPath();
        return "redirect: info";
    }

    @RequestMapping(value = "/info")
    public ModelAndView info(HttpServletRequest req) {
        currPath = req.getServletPath();
        return new ModelAndView("info");
    }

    @RequestMapping(value = "/news")
    public ModelAndView news(HttpServletRequest req) {
        currPath = req.getServletPath();
        return new ModelAndView("news");
    }

    @RequestMapping(value = "/achievements")
    public ModelAndView achievements(HttpServletRequest req) {
        currPath = req.getServletPath();
        logger.debug("currPath = " + currPath);
        return new ModelAndView("achievements");
    }

    @RequestMapping(value = "/application", method = RequestMethod.GET)
    public ModelAndView application(HttpServletRequest req) throws IOException {
        //logger.debug("Runnin zayavkaForm() with GET");
        ModelAndView m = new ModelAndView("application");
        List<GuildStatic> staticList = gsrep.findAll();
        m.addObject("staticlist", staticList);
        List<WowClasses> classList = wcrep.findAllClassesByLocale(LocaleContextHolder.getLocale().getLanguage());
        m.addObject("classList", classList);
        List<WowClasses> specList = wcrep.findAllSpecsByLocale(LocaleContextHolder.getLocale().getLanguage());
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(specList);
        } catch (Exception e) {
            logger.error(e);
            //e.printStackTrace();
        }
        m.addObject("specList", json);

        currPath = req.getServletPath();
        logger.debug("currPath = " + currPath);
        return m;
    }

    @RequestMapping(value = "/application", method = RequestMethod.POST)
    public String zayavkaConfirmation(@Valid Zayavka zayavka, BindingResult errors, SessionStatus sessionStatus) throws IOException {
        //zayavkaValidator.validate(zaya, errors);

        if (errors.hasErrors()) {
            return "application";
        }
        zayarep.save(zayavka);

        sessionStatus.setComplete();
        return "redirect: confirmed";
    }

    @RequestMapping(value = "/confirmed", method = RequestMethod.GET)
    public String confirmed(HttpServletRequest req) {
        currPath = req.getServletPath();
        return "confirmed";
    }

    @RequestMapping(value = "/loginsuccess")
    public String loginSuccess() {
        return "redirect: " + getCurrPath().substring(1);
    }

    @RequestMapping(value = "/loginfailure")
    public String loginFailure() {
        return "redirect: " + getCurrPath().substring(1);
    }

    @RequestMapping(value = "/logoutsuccess")
    public String logoutSuccess() {
        return "redirect: info";
    }

    /*@RequestMapping(value = "/vsezayavki/{id}")
    public ModelAndView vseZayavki(@RequestParam(value = "sortBy", required = false) String sortBy, @RequestParam(value = "dir", required = false) String dir, @PathVariable("id") long id) {
        ModelAndView m = new ModelAndView("vsezayavki");
        m.addObject("gstatic", gsrep.findOneById(id).getStaticName());
        //logger.debug("sortBy = "+ sortBy+";dir = "+ dir);

        if (sortBy != null) {
            List<Zayavka> vseZayavkiSorted = zayarep.findAllSortedAndByLocaleAndByGstatisId(sortBy, dir, LocaleContextHolder.getLocale().getLanguage(), id);
            String json = new Gson().toJson(vseZayavkiSorted);
            m.addObject("zlist", json);

        } else {
            //List<Zayavka> vseZayavki = zayarep.findAllSortedAndByLocaleAndByGstatisId("wowClass.wowClass", "asc");
            //List<Zayavka> vseZayavki = zayarep.findAll();
            List<Zayavka> vseZayavki = zayarep.findAllByLocaleAndGstaticId(LocaleContextHolder.getLocale().getLanguage(), id);
            String json = new Gson().toJson(vseZayavki);
            m.addObject("zlist", json);
            //logger.debug("Json  vsezyavki = " + json);
        }
        return m;
    }*/

    @RequestMapping(value = "/vsezayavki/{id}")
    public ModelAndView vseZayavki(@PathVariable("id") long id, HttpServletRequest req) {
        currPath = req.getServletPath();
        ModelAndView m = new ModelAndView("vsezayavki");
        String addInfo = "";
        if (LocaleContextHolder.getLocale().getLanguage() == "ru") {
            addInfo = "(Все)";
        } else {
            addInfo = "(All)";
        }
        m.addObject("gstatic", gsrep.findOneById(id).getStaticName() + " " + addInfo);
        List<Zayavka> vseZayavki = zayarep.findAllByLocaleAndGstaticId(LocaleContextHolder.getLocale().getLanguage(), id);
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(vseZayavki);
        } catch (Exception e) {
            logger.error(e);
            //e.printStackTrace();
        }
        m.addObject("zlist", json);

        return m;
    }

    @RequestMapping(value = "/vseunread/{id}")
    public ModelAndView vseUnread(@PathVariable("id") long id, HttpServletRequest req) {
        currPath = req.getServletPath();
        ModelAndView m = new ModelAndView("vsezayavki");
        String addInfo = "";
        if (LocaleContextHolder.getLocale().getLanguage() == "ru") {
            addInfo = "(Новые)";
        } else {
            addInfo = "(New)";
        }
        m.addObject("gstatic", gsrep.findOneById(id).getStaticName() + " " + addInfo);
        List<Zayavka> vseUnread = zayarep.findAllByLocaleAndGstaticIdAndUnread(LocaleContextHolder.getLocale().getLanguage(), id);
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(vseUnread);
        } catch (Exception e) {
            logger.error(e);
            //e.printStackTrace();
        }
        m.addObject("zlist", json);

        return m;
    }

    @RequestMapping(value = "/vsechosen/{id}")
    public ModelAndView vseChosen(@PathVariable("id") long id, HttpServletRequest req) {
        currPath = req.getServletPath();
        ModelAndView m = new ModelAndView("vsezayavki");
        String addInfo = "";
        if (LocaleContextHolder.getLocale().getLanguage() == "ru") {
            addInfo = "(Избранные)";
        } else {
            addInfo = "(Chosen)";
        }
        m.addObject("gstatic", gsrep.findOneById(id).getStaticName() + " " + addInfo);
        List<Zayavka> vseChosen = zayarep.findAllByLocaleAndGstaticIdAndChosen(LocaleContextHolder.getLocale().getLanguage(), id);
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(vseChosen);
        } catch (Exception e) {
            logger.error(e);
            //e.printStackTrace();
        }
        m.addObject("zlist", json);
        return m;
    }

    @RequestMapping(value = "/getvse/{id}")
    @ResponseBody
    public List<Zayavka> getVse(@PathVariable("id") long id) {
        /*logger.debug("Req.url = "+req.getRequestURI());
        String uri = req.getRequestURI();
        logger.debug("substr(8) = "+uri.substring(8));
        long staticNum = Long.parseLong(uri.substring(8));*/
        List<Zayavka> vseZayavki = zayarep.findAllByLocaleAndGstaticId(LocaleContextHolder.getLocale().getLanguage(), id);
        return vseZayavki;
    }

    @RequestMapping(value = "/getunread/{id}")
    @ResponseBody
    public List<Zayavka> getUnread(@PathVariable("id") long id) {
        List<Zayavka> vseUnread = zayarep.findAllByLocaleAndGstaticIdAndUnread(LocaleContextHolder.getLocale().getLanguage(), id);
        return vseUnread;
    }

    @RequestMapping(value = "/getchosen/{id}")
    @ResponseBody
    public List<Zayavka> getChosen(@PathVariable("id") long id) {
        List<Zayavka> vseChosen = zayarep.findAllByLocaleAndGstaticIdAndChosen(LocaleContextHolder.getLocale().getLanguage(), id);
        return vseChosen;
    }

    /*@RequestMapping(value = "/zayavka/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Zayavka zayavka(@PathVariable("id") long id) {
//        ModelAndView m = new ModelAndView();
//        m.setViewName("zayavka");
        Zayavka zaya = zayarep.findOneByIdAndLocale(id, LocaleContextHolder.getLocale().getLanguage());
//        m.addObject("zayavka", zaya);
//        zayarep.setReadById(id);
//        return m;
        return zaya;
    }*/

    @RequestMapping(value = "/gslogin")
    public ModelAndView gsLogin() {
        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)){
            return new ModelAndView("redirect: vsezayavki");
        }*/
        return new ModelAndView("gslogin");

    }

    @RequestMapping(value = "/readList", method = RequestMethod.POST)
    public void readList(@RequestBody String[] readList) {
        //logger.debug("readList = "+readList);
        String str = "";
        for (String s : readList) {
            str = str + " " + s;
            long id = Long.parseLong(s);
            zayarep.setReadById(id);
        }
        logger.debug("ReadList = " + str);

    }

    @RequestMapping(value = "/chosenList", method = RequestMethod.POST)
    public void chosenList(@RequestBody String[] chosenList) {

        String str = "";
        for (String s : chosenList) {
            str = str + " " + s;
            long id = Long.parseLong(s);
            zayarep.changeChosenStatusById(id);
        }
        logger.debug("ChosenList = " + str);

    }
}

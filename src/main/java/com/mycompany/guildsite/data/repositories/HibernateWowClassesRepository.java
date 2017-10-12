/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.guildsite.data.repositories;

import com.mycompany.guildsite.controller.HomeController;
import com.mycompany.guildsite.data.WowClasses;
import com.mycompany.guildsite.data.WowClassesLocales;
import com.mycompany.guildsite.data.WowClassesRepository;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HibernateWowClassesRepository implements WowClassesRepository {

    private SessionFactory sessionFactory;
    private int i = 0;
    private static final Logger logger = Logger.getLogger(HibernateWowClassesRepository.class);

    @Autowired
    public HibernateWowClassesRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public boolean createTable() {
        Session session = currentSession();
//        session.persist(new WowClasses("hdh", "DEMON HUNTER", "HAVOC"));
//        session.persist(new WowClasses("vdh", "DEMON HUNTER", "VENGEANCE"));
//        session.persist(new WowClasses("bdk", "DEATH KNIGHT", "BLOOD"));
//        session.persist(new WowClasses("fdk", "DEATH KNIGHT", "FROST"));
//        session.persist(new WowClasses("udk", "DEATH KNIGHT", "UNHOLY"));
//        session.persist(new WowClasses("rdru", "DRUID", "RESTORATION"));
//        session.persist(new WowClasses("fdru", "DRUID", "FERAL"));
//        session.persist(new WowClasses("gdru", "DRUID", "GUARDIAN"));
//        session.persist(new WowClasses("bdru", "DRUID", "BALANCE"));
//        session.persist(new WowClasses("shunt", "HUNTER", "SURVIVAL"));
//        session.persist(new WowClasses("bmhunt", "HUNTER", "BEAST MASTERY"));
//        session.persist(new WowClasses("mhunt", "HUNTER", "MARKSMANSHIP"));
//        session.persist(new WowClasses("amage", "MAGE", "ARCANE"));
//        session.persist(new WowClasses("fimage", "MAGE", "FIRE"));
//        session.persist(new WowClasses("frmage", "MAGE", "FROST"));
//        session.persist(new WowClasses("bmonk", "MONK", "BREWMASTER"));
//        session.persist(new WowClasses("mmonk", "MONK", "MISTWEAVER"));
//        session.persist(new WowClasses("wmonk", "MONK", "WINDWALKER"));
//        session.persist(new WowClasses("hpal", "PALADIN", "HOLY"));
//        session.persist(new WowClasses("rpal", "PALADIN", "RETRIBUTION"));
//        session.persist(new WowClasses("ppal", "PALADIN", "PROTECTION"));
//        session.persist(new WowClasses("hpriest", "PRIEST", "HOLY"));
//        session.persist(new WowClasses("spriest", "PRIEST", "SHADOW"));
//        session.persist(new WowClasses("dpriest", "PRIEST", "DISCIPLINE"));
//        session.persist(new WowClasses("arogue", "ROGUE", "ASSASSINATION"));
//        session.persist(new WowClasses("orogue", "ROGUE", "OUTLAW"));
//        session.persist(new WowClasses("srogue", "ROGUE", "SUBTLETY"));
//        session.persist(new WowClasses("elsham", "SHAMAN", "ELEMENTAL"));
//        session.persist(new WowClasses("ensham", "SHAMAN", "ENHANCEMENT"));
//        session.persist(new WowClasses("rsham", "SHAMAN", "RESTORATION"));
//        session.persist(new WowClasses("alock", "WARLOCK", "AFFLICTION"));
//        session.persist(new WowClasses("demlock", "WARLOCK", "DEMONOLOGY"));
//        session.persist(new WowClasses("deslock", "WARLOCK", "DESTRUCTION"));
//        session.persist(new WowClasses("awar", "WARRIOR", "ARMS"));
//        session.persist(new WowClasses("fwar", "WARRIOR", "FURY"));
//        session.persist(new WowClasses("pwar", "WARRIOR", "PROTECTION"));
        i++;
        System.out.println("I++ = " + i);
        return true;
        //String query = "UPDATE WOWCLASSES set shortname =: shortname, wowclass =: wowclass, wowspec=: wowspec";
    }

    @Override
    public List<String> findAllClasses() {
        Session session = currentSession();
        String hql = "SELECT distinct wc.wowClass FROM WowClasses wc ORDER BY wc.wowClass ASC";
        Query query = session.createQuery(hql);
        List results = query.list();
        return results;
    }

    @Override
    public List<WowClasses> findAllSpecs() {
        Session session = currentSession();
        String hql = "Select wc FROM WowClasses wc ";
        Query query = session.createQuery(hql);
        List results = query.list();
        return results;
    }

    @Override
    public List<WowClasses> findAllSpecsByLocale(String locale) {
        Session session = currentSession();
        String hql = "Select wc FROM WowClasses wc JOIN FETCH wc.wowClassLoc wcl WHERE wcl.locale=:locale";
        Query query = session.createQuery(hql);
        query.setParameter("locale", locale);
        List results = query.list();
        return results;
    }

    @Override
    public List<String> findAllSpecByClass(String wowClass) {
        Session session = currentSession();
        String hql = "SELECT distinct wc.wowSpec FROM WowClasses wc WHERE wc.wowClass=:class ORDER BY wc.wowSpec ASC";
        Query query = session.createQuery(hql);
        query.setParameter("class", wowClass.toUpperCase());
        List results = query.list();
        return results;
    }

    @Override
    public List<WowClasses> findAllByShortname(String shortname) {
        Session session = currentSession();
        String hql = "SELECT wc FROM WowClasses wc WHERE wc.shortName=:shortname";
        Query query = session.createQuery(hql);
        query.setParameter("shortname", shortname);
        List results = query.list();
        return results;
    }

    public List<WowClasses> findAllClassesAsObjects() {
        Session session = currentSession();
        String hql = "SELECT wc FROM WowClasses wc ORDER BY wc.wowClass ASC"; 
        Query query = session.createQuery(hql);
        List results = query.list();
        return results;
        /*List betterResults = new LinkedList();
        String cl = "";
        for (Object o : results) {
            WowClasses wc = (WowClasses) o;
            if (!cl.equalsIgnoreCase(wc.getWowClass())) {
                betterResults.add(o);
                cl = wc.getWowClass();
            }
        }
        return betterResults;*/
    }

    @Override
    public List<WowClasses> findAllClassesByLocale(String locale){
        Session session = currentSession();
        String hql = "SELECT wc FROM WowClasses wc JOIN FETCH wc.wowClassLoc wcl WHERE wcl.locale=:locale ORDER BY wcl.wowClassLocalized ASC";
        Query query = session.createQuery(hql);
        query.setParameter("locale", locale);
        List results = query.list();

        List betterResults = new LinkedList();
        String cl = "";
        for (Object o : results) {
            WowClasses wc = (WowClasses) o;
            for (WowClassesLocales wcl : wc.getWowClassLoc()){
                System.out.println("WowClassesLocales: " + wcl.getWowClassLocalized()+" "+ wcl.getWowSpecLocalized());
                if (!cl.equalsIgnoreCase(wcl.getWowClassLocalized())) {
                    betterResults.add(o);
                    cl =  wcl.getWowClassLocalized();
            }}
        }

        /*for (Object o : betterResults){
            WowClasses wc = (WowClasses)o;
            logger.debug(wc.ge);
        }*/
        return betterResults;

    }
}

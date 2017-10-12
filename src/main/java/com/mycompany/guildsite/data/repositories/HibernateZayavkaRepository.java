
package com.mycompany.guildsite.data.repositories;

import com.mycompany.guildsite.data.Zayavka;
import com.mycompany.guildsite.data.ZayavkaRepository;

import java.io.Serializable;
import java.util.Date;
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
public class HibernateZayavkaRepository implements ZayavkaRepository {

    private static final Logger logger = Logger.getLogger(HibernateZayavkaRepository.class);

    private SessionFactory sessionFactory;

    @Autowired
    public HibernateZayavkaRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Zayavka save(Zayavka zayavka) {
        Serializable id = currentSession().save(zayavka);
        return new Zayavka((Long) id, zayavka.getName(), zayavka.getWowClass(), zayavka.getWhy(), zayavka.getWhat(), zayavka.getIlvl(),
                zayavka.getDate(), false, zayavka.getExp(), zayavka.getGstatic());
    }

    @Override
    public Zayavka findOneById(Long id) {
        return (Zayavka) currentSession().get(Zayavka.class, id);
    }

    @Override
    public Zayavka findOneByIdAndLocale(Long id, String locale) {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.wowClass wc JOIN FETCH wc.wowClassLoc wcl WHERE z.id=:id AND wcl.locale=:locale";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        query.setParameter("locale", locale);

        Zayavka zaya = (Zayavka)query.uniqueResult();
        return zaya;
    }

    @Override
    public List<Zayavka> findAllByName(String name) {
        Session session = currentSession();
        String hql = "FROM Zayavka z WHERE z.name=:name";
        Query query = session.createQuery(hql);
        query.setParameter("name", name);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllByClass(String cl) {
        Session session = currentSession();
        String hql = "FROM Zayavka z WHERE z.wowClass=:clas";
        Query query = session.createQuery(hql);
        query.setParameter("clas", cl);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllBySpec(String sp) {
        Session session = currentSession();
        String hql = "FROM Zayavka z WHERE z.wowSpec=:spec";
        Query query = session.createQuery(hql);
        query.setParameter("spec", sp);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllAfterIlvl(int ilvl) {
        Session session = currentSession();
        String hql = "FROM Zayavka z WHERE z.ilvl=:ilvl";
        Query query = session.createQuery(hql);
        query.setParameter("ilvl", ilvl);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllAfterDate(Date date) {
        Session session = currentSession();
        String hql = "FROM Zayavka z WHERE z.date>:zdate";
        Query query = session.createQuery(hql);
        query.setParameter("zdate", date);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAll() {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z";
        Query query = session.createQuery(hql);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllByLocaleAndGstaticId(String locale, long id) {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.wowClass wc JOIN FETCH wc.wowClassLoc wcl JOIN FETCH z.gstatic gs " +
                "WHERE wcl.locale=:locale AND gs.id=:id ORDER BY z.date";
        Query query = session.createQuery(hql);
        query.setParameter("locale", locale);
        query.setParameter("id", id);
        //logger.debug("QUERY:" + query.ge);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllByLocaleAndGstaticIdAndUnread(String locale, long id) {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.wowClass wc JOIN FETCH wc.wowClassLoc wcl JOIN FETCH z.gstatic gs " +
                "WHERE wcl.locale=:locale AND gs.id=:id AND z.read=false ORDER BY z.date";
        Query query = session.createQuery(hql);
        query.setParameter("locale", locale);
        query.setParameter("id", id);
        //logger.debug("QUERY:" + query.ge);
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllSortedAndByLocaleAndByGstatisId(String sortBy, String dir, String locale, long id) {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.wowClass wc JOIN FETCH wc.wowClassLoc wcl JOIN FETCH z.gstatic gs " +
                "WHERE wcl.locale=:locale AND gs.id=:id ORDER BY";
        if (sortBy.startsWith("wow")){
            hql = hql + " wcl." + sortBy + " " + dir;
        } else {
            hql = hql + " z." + sortBy + " " + dir;
        }
        Query query = session.createQuery(hql);
        query.setParameter("locale", locale);
        query.setParameter("id", id);
        logger.debug("Sort query:" +query.getQueryString());
        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllSortedAndByLocaleAndByGstatisIdAndUnread(String sortBy, String dir, String locale, long id) {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.wowClass wc JOIN FETCH wc.wowClassLoc wcl JOIN FETCH z.gstatic gs " +
                "WHERE wcl.locale=:locale AND gs.id=:id AND z.read=false ORDER BY";
        if (sortBy.startsWith("wow")){
            hql = hql + " wcl." + sortBy + " " + dir;
        } else {
            hql = hql + " z." + sortBy + " " + dir;
        }
        Query query = session.createQuery(hql);
        query.setParameter("locale", locale);
        query.setParameter("id", id);

        List results = query.list();
        return results;
    }

    @Override
    public List<Zayavka> findAllNotRead() {
        Session session = currentSession();
        String hql = "FROM Zayavka z WHERE z.zread=false";
        Query query = session.createQuery(hql);
        List results = query.list();
        return results;
    }

    @Override
    public boolean setReadById(long id) {
        Session session = currentSession();
        Zayavka zaya = (Zayavka) session.get(Zayavka.class, id);
        zaya.setRead(true);
        session.flush();
        return zaya.isRead();
    }

    @Override
    public List<Zayavka> findAllByGstatic(String gstatic) {
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.gstatic gs WHERE gs.staticName=:gstatic";
        Query query = currentSession().createQuery(hql);
        query.setParameter("gstatic", gstatic);
        return query.list();
    }

    @Override
    public List<Zayavka> findAllByGstaticId(long id) {
        String hql = "SELECT z FROM Zayavka z JOIN FETCH z.gstatic gs WHERE gs.id=:id";
        Query query = currentSession().createQuery(hql);
        query.setParameter("id", id);
        return query.list();
    }

    @Override
    public int countUnreadByGstaticId(long id) {
        String hql = "SELECT COUNT(z) FROM Zayavka z JOIN z.gstatic gs WHERE gs.id=:id and z.read=false";
        Query query = currentSession().createQuery(hql);
        query.setParameter("id", id);
        //logger.debug(query.);
        Long l = (Long)query.uniqueResult();



        return l.intValue();
    }
}

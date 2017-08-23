
package com.mycompany.guildsite.data.repositories;

import com.mycompany.guildsite.data.Zayavka;
import com.mycompany.guildsite.data.ZayavkaRepository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HibernateZayavkaRepository implements ZayavkaRepository {

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
                zayavka.getDate(), false, zayavka.getExp(), zayavka.getAdd2());
    }

    @Override
    public Zayavka findOneById(Long id) {
        return (Zayavka) currentSession().get(Zayavka.class, id);
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
    public List<Zayavka> findAllSorted(String sortBy, String dir) {
        Session session = currentSession();
        String hql = "SELECT z FROM Zayavka z ORDER BY z." + sortBy + " " + dir;
        Query query = session.createQuery(hql);
//        query.setParameter("sortBy", sortBy);
//        query.setParameter("dir", dir);
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


}

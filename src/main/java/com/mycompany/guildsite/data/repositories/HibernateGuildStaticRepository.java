package com.mycompany.guildsite.data.repositories;

import com.mycompany.guildsite.data.GuildStatic;
import com.mycompany.guildsite.data.GuildStaticRepository;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by User on 10.09.2017.
 */
@Repository
@Transactional
public class HibernateGuildStaticRepository implements GuildStaticRepository {

    private static final Logger logger = Logger.getLogger(HibernateGuildStaticRepository.class);

    @Autowired
    private SessionFactory sessionFactory;

    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public GuildStatic save(GuildStatic guildStatic) {
        Serializable id = currentSession().save(guildStatic);
        return new GuildStatic((Long)id, guildStatic.getStaticName(), guildStatic.getStaticDescription());
    }

    @Override
    public GuildStatic findOneById(long id) {
        return (GuildStatic) currentSession().get(GuildStatic.class, id);
    }

    @Override
    public GuildStatic findOneByStaticName(String staticName) {
        String hql = "SELECT gs FROM GuildStatic gs WHERE gs.staticName=:staticName";
        Query query = currentSession().createQuery(hql);
        query.setParameter("staticName", staticName);
        return (GuildStatic)query.uniqueResult();
    }

    @Override
    public List<GuildStatic> findAll() {
        String hql = "SELECT gs FROM GuildStatic gs";
        Query query = currentSession().createQuery(hql);
        return query.list();
    }
}

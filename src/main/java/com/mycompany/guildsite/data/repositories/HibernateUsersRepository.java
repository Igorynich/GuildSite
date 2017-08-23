
package com.mycompany.guildsite.data.repositories;

import com.mycompany.guildsite.data.UserInfo;
import com.mycompany.guildsite.data.UsersRepository;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HibernateUsersRepository implements UsersRepository{

    private SessionFactory sessionFactory;

    @Autowired
    public HibernateUsersRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public UserInfo findByUsername(String username) {
        Session session = currentSession();
        String hql = "SELECT u FROM UserInfo u WHERE u.userName=:username AND u.enabled=:enabled";
        Query query = session.createQuery(hql);
        query.setParameter("username", username);
        query.setParameter("enabled", true);
        UserInfo ui = new UserInfo();
        if (!query.list().isEmpty()){
            ui = (UserInfo) query.list().get(0);
            System.out.println("UserInfo: userName = "+ ui.getUserName() +" password = " + ui.getPassword() + " role = "+ui.getRole() + " enabled = "+ui.isEnabled());
        }
        return ui;
    }
    
    
}

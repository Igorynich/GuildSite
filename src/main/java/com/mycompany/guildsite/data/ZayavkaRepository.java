/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.guildsite.data;

import java.util.Date;
import java.util.List;

/**
 *
 * @author User
 */
public interface ZayavkaRepository {
    public Zayavka save(Zayavka zayavka);
    public Zayavka findOneById(Long id);
    public Zayavka findOneByIdAndLocale(Long id, String locale);
    public List<Zayavka> findAllByName(String name);
    public List<Zayavka> findAllByClass(String cl);
    public List<Zayavka> findAllBySpec(String sp);
    public List<Zayavka> findAllAfterIlvl(int ilvl);
    public List<Zayavka> findAllAfterDate(Date date);
    public List<Zayavka> findAll();
    public List<Zayavka> findAllByLocaleAndGstaticId(String locale, long id);
    public List<Zayavka> findAllByLocaleAndGstaticIdAndUnread(String locale, long id);
    public List<Zayavka> findAllSortedAndByLocaleAndByGstatisId(String sortBy, String dir, String locale, long id);
    public List<Zayavka> findAllSortedAndByLocaleAndByGstatisIdAndUnread(String sortBy, String dir, String locale, long id);
    public List<Zayavka> findAllNotRead();
    public boolean setReadById(long id);
    public List<Zayavka> findAllByGstatic(String gstatic);
    public List<Zayavka> findAllByGstaticId(long id);
    public int countUnreadByGstaticId(long id);
}

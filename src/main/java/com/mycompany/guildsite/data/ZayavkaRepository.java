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
    public List<Zayavka> findAllByName(String name);
    public List<Zayavka> findAllByClass(String cl);
    public List<Zayavka> findAllBySpec(String sp);
    public List<Zayavka> findAllAfterIlvl(int ilvl);
    public List<Zayavka> findAllAfterDate(Date date);
    public List<Zayavka> findAll();
    public List<Zayavka> findAllSorted(String sortBy, String dir);
    public List<Zayavka> findAllNotRead();
    public boolean setReadById(long id);
}

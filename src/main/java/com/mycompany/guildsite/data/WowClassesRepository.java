/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.guildsite.data;

import java.util.List;

/**
 *
 * @author User
 */
public interface WowClassesRepository {
    
    public boolean createTable();
    public List<String> findAllClasses();
    public List<WowClasses> findAllSpecs();
    public List<String> findAllSpecByClass(String wowClass);
    public List<WowClasses> findAllClassesAsObjects();
    public List<WowClasses> findAllByShortname(String shortname);
}

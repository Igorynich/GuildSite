/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.guildsite.data;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.persistence.*;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "wowclasses")
public class WowClasses implements Serializable {

    @Id
    @SequenceGenerator(name = "wcsequence", sequenceName = "wcsequence")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "wcsequence")
    @Column(name = "id")
    private long id;

    @Column(name = "shortname", unique = true)
    private String shortName;

    //    @OneToMany(mappedBy = "wowClass", fetch = FetchType.EAGER)
    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "wowclass_shortname", referencedColumnName = "shortname")
    private List<WowClassesLocales> wowClassLoc;




    public WowClasses() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<WowClassesLocales> getWowClassLoc() {
        return wowClassLoc;
    }

    public void setWowClass(List<WowClassesLocales> wowClassLoc) {
        this.wowClassLoc = wowClassLoc;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }


}

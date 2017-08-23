/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.guildsite.data;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="wowclasses")
public class WowClasses implements Serializable {
    
    @Id
    @SequenceGenerator(name="wcsequence",sequenceName="wcsequence")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="wcsequence")
    @Column(name = "id")
    private long id;


    @Column(name = "shortname", unique = true)
    private String shortName;
    
    @Column(name = "wowclass")
    private String wowClass;
    
    @Column(name = "wowspec")
    private String wowSpec;

    public WowClasses() {
    }

    public WowClasses(String shortName, String wowClass, String wowSpec) {
        this.shortName = shortName;
        this.wowClass = wowClass;
        this.wowSpec = wowSpec;
    }

    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getWowClass() {
        return wowClass;
    }

    public void setWowClass(String wowClass) {
        this.wowClass = wowClass;
    }

    public String getWowSpec() {
        return wowSpec;
    }

    public void setWowSpec(String wowSpec) {
        this.wowSpec = wowSpec;
    }
    
}

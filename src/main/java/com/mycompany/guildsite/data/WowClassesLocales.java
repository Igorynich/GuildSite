package com.mycompany.guildsite.data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by User on 23.08.2017.
 */
@Entity
@Table(name = "wowclasseslocales")
public class WowClassesLocales implements Serializable {

    @Id
    @SequenceGenerator(name="wclocsequence",sequenceName="wclocsequence")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="wclocsequence")
    @Column(name = "id")
    private long id;


    /*@Column(name = "wowclass_shortname")
    private String wowClassShortName;*/

//    @ManyToOne
//    @JoinColumn(name="wowclass_shortname", referencedColumnName = "shortname")
    @Column(name = "wowclass_shortname")
    private String wowClass;

    @Column(name = "locale")
    private String locale;

    @Column(name = "wowclass_localized")
    private String wowClassLocalized;

    @Column(name = "wowspec_localized")
    private String wowSpecLocalized;

    public WowClassesLocales() {
    }

    public WowClassesLocales(String wowClass, String locale, String wowClassLocalized, String wowSpecLocalized) {
        this.wowClass = wowClass;
        this.locale = locale;
        this.wowClassLocalized = wowClassLocalized;
        this.wowSpecLocalized = wowSpecLocalized;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getWowClass() {
        return wowClass;
    }

    public void setWowClass(String wowClass) {
        this.wowClass = wowClass;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getWowClassLocalized() {
        return wowClassLocalized;
    }

    public void setWowClassLocalized(String wowClassLocalized) {
        this.wowClassLocalized = wowClassLocalized;
    }

    public String getWowSpecLocalized() {
        return wowSpecLocalized;
    }

    public void setWowSpecLocalized(String wowSpecLocalized) {
        this.wowSpecLocalized = wowSpecLocalized;
    }
}

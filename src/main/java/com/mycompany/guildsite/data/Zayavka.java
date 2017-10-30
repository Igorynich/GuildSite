package com.mycompany.guildsite.data;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name = "zayavki")
public class Zayavka implements Serializable {

    @Id
    @SequenceGenerator(name = "zayasequence", sequenceName = "zayasequence")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "zayasequence")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "zayasequence")
    @Column(name = "id")
    private long id;

//    @NotNull(message = "{name.notnull}")
//    @Size(min = 2, max = 12, message = "{name.size}")
    @Column(name = "name")
    private String name;


    @OneToOne
    @JoinColumn(name = "wowclass", referencedColumnName = "shortname")
    private WowClasses wowClass;

//    @Column(name = "wowSpec")
//    private String wowSpec;
    @Column(name = "why")
    private String why;

    @Column(name = "what")
    private String what;

//    @NotNull(message = "{ilvl.notnull}")
//    @Pattern(regexp = "[0-9]+"/*, message = "{ilvl.pattern}"*/)
    @Column(name = "ilvl")
    private String ilvl;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "zdate", updatable = false)
    private Date date = new Date();

    @Column(name = "zread")
    private boolean read = false;

    @Column(name = "zchosen")
    private boolean chosen = false;


    //    @NotNull(message = "{exp.notnull}")
    @Column(name = "exp")
    private String exp;

    @OneToOne
    @JoinColumn(name = "gstatic", referencedColumnName = "staticname")
    private GuildStatic gstatic;

    public Zayavka() {
    }

    public Zayavka(Long id, String name, WowClasses cl, String why, String what, String ilvl, String exp) {
        this.id = id;
        this.name = name;
        this.wowClass = cl;
        //this.wowSpec = sp;
        this.why = why;
        this.what = what;
        this.ilvl = ilvl;
        this.exp = exp;
    }

    public Zayavka(Long id, String name, WowClasses cl, String why, String what, String ilvl, String exp, GuildStatic gstatic) {
        this.id = id;
        this.name = name;
        this.wowClass = cl;
        //this.wowSpec = sp;
        this.why = why;
        this.what = what;
        this.ilvl = ilvl;
        this.exp = exp;
        this.gstatic = gstatic;
    }

    public boolean isChosen() {
        return chosen;
    }

    public void setChosen(boolean chosen) {
        this.chosen = chosen;
    }

    public String getIlvl() {
        return ilvl;
    }

    public void setIlvl(String ilvl) {
        this.ilvl = ilvl;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isRead() {
        return read;
    }

    public void setRead(boolean read) {
        this.read = read;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public WowClasses getWowClass() {
        return wowClass;
    }

    public void setWowClass(WowClasses cl) {
        this.wowClass = cl;
        //cl.setId(this.getId());
    }

//    public String getWowSpec() {
//        return wowSpec;
//    }
//
//    public void setWowSpec(String sp) {
//        this.wowSpec = sp;
//    }
    public String getWhat() {
        return what;
    }

    public void setWhat(String what) {
        this.what = what;
    }

    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    public GuildStatic getGstatic() {
        return gstatic;
    }

    public void setGstatic(GuildStatic gstatic) {
        this.gstatic = gstatic;
    }

    public String getWhy() {
        return why;
    }

    public void setWhy(String why) {
        this.why = why;
    }

}

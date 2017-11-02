package com.mycompany.guildsite.data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by User on 09.09.2017.
 */
@Entity
@Table(name = "guildstatics")
public class GuildStatic implements Serializable{
    @Id
    @SequenceGenerator(name = "zayasequence", sequenceName = "zayasequence")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "zayasequence")
    @Column(name = "id")
    private long id;

    @Column(name = "staticname")
    private String staticName;

    @Column(name = "staticdescription")
    private String staticDescription;

    public GuildStatic() {
    }

    public GuildStatic(long id, String staticName, String staticDescription) {
        this.staticName = staticName;
        this.staticDescription = staticDescription;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getStaticName() {
        return staticName;
    }

    public void setStaticName(String staticName) {
        this.staticName = staticName;
    }

    public String getStaticDescription() {
        return staticDescription;
    }

    public void setStaticDescription(String staticDescription) {
        this.staticDescription = staticDescription;
    }
}

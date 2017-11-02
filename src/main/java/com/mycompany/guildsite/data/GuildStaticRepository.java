package com.mycompany.guildsite.data;

import java.util.List;

/**
 * Created by User on 10.09.2017.
 */
public interface GuildStaticRepository {
    public GuildStatic save(GuildStatic guildStatic);
    public GuildStatic findOneById(long id);
    public GuildStatic findOneByStaticName(String staticName);
    public List<GuildStatic> findAll();
}

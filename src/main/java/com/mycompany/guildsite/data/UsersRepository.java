
package com.mycompany.guildsite.data;

public interface UsersRepository {
    public UserInfo findByUsername(String username);
}

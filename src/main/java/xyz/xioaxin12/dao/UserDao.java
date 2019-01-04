package xyz.xioaxin12.dao;

import xyz.xioaxin12.bean.User;

/**
 * @author 小信
 */
public interface UserDao {
    void inserUser(User user);
    int updateUser(User user);
    User selevtUser(User User);
}

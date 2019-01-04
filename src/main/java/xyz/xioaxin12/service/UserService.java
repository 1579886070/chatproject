package xyz.xioaxin12.service;

import xyz.xioaxin12.bean.User;

/**
 * @author 小信
 */
public interface UserService {
    void addUser(User user);

    int modifyUser(User user);

    User findUser(User user);
}

package xyz.xioaxin12.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.xioaxin12.bean.User;
import xyz.xioaxin12.dao.UserDao;

/**
 * @author 小信
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    @Qualifier("userDao")
    private UserDao dao;

    public void setDao(UserDao dao) {
        this.dao = dao;
    }

    @Transactional
    @Override
    public void addUser(User user) {
        dao.inserUser(user);
    }

    @Override
    public int modifyUser(User user) {
        return dao.updateUser(user);
    }

    @Override
    public User findUser(User user) {
        return dao.selevtUser(user);
    }
}

package demo.house.service;


import demo.house.dao.UserDao;
import demo.house.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fanzhun on 2017/6/10.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    public User userLogin(String userName, String pwd) {
        return userDao.userLogin(userName, pwd);
    }

    public int userRegister(User user) {
        return userDao.userRegister(user);
    }

    public List<User> getByUserName(String userName) {
        return userDao.getByUserName(userName);
    }


}
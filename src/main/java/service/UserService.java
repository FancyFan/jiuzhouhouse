package service;


import dao.UserDao;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fanzhun on 2017/6/10.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User userLogin(String userName, String pwd){
        return  userDao.userLogin(userName, pwd);
    }

    public User getUserById(int userId){
        return userDao.getUserById(userId);
    }




}
package demo.house.dao;


import demo.house.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by fanzhun on 2017/6/10.
 */
@Component
public interface UserDao {
    User userLogin(@Param("userName") String userName, @Param("pwd") String pwd);

    int userRegister(User user);

    //User getUserById(int userId);
    List<User> getByUserName(@Param("userName") String userName);
}

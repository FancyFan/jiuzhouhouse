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

    void userRegister(@Param("userName") String userName,@Param("pwd") String pwd,@Param("email") String email,@Param("address") String address,@Param("phone")String phone);
    //User getUserById(int userId);
    List<User> getByUserName(@Param("userName") String userName);
}

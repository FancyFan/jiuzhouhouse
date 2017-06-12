package demo.house.dao;


import demo.house.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * Created by fanzhun on 2017/6/10.
 */
@Component
public interface UserDao {
    User userLogin(@Param("userName") String userName, @Param("pwd") String pwd);

    //User getUserById(int userId);
}

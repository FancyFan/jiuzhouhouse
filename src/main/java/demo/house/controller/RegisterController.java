package demo.house.controller;

import demo.house.model.User;
import demo.house.service.UserService;
import demo.house.util.Messager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.plugin2.message.Message;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by banma82 on 2017/6/19.
 */
@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping(value="/pages/user/register",method = RequestMethod.GET)
    @ResponseBody
    public Messager register(User user,HttpSession session){
        Messager messager = new Messager();
        try{
            List list=userService.getByUserName(user.getUserName());
            if(list!=null&&list.size()>=1){
                messager.setFlag(false);
                messager.setMessage("The userName already exists！ ");
            }else{
                userService.userRegister(user);
                session.setAttribute("jiuzhouUser", userService.getByUserName(user.getUserName()).get(0));
                messager.setFlag(true);
            }
        }catch(Exception e){
            messager.setFlag(false);
            messager.setMessage("There is something wrong!");
        }
        return messager;
    }
}

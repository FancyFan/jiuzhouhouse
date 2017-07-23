package demo.house.controller;

import demo.house.model.User;
import demo.house.service.UserService;
import demo.house.util.Messager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.plugin2.message.Message;

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
    public Messager register(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("phone") String phone, @RequestParam("email") String email, @RequestParam("address") String address){
        Messager messager = new Messager();
        try{
            List list=userService.getByUserName(username);
            if(list!=null&&list.size()>=1){
                messager.setFlag(false);
                messager.setMessage("The userName already exists！ ");
                return messager;
            }
            userService.userRegister(username,password,email,address,phone);
            messager.setFlag(true);
            return messager;
        }catch(Exception e){
            messager.setFlag(false);
            messager.setMessage("There is something wrong!");
            return messager;
        }

    }
}

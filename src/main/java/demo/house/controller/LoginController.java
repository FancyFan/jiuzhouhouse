package demo.house.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import demo.house.service.UserService;
import demo.house.util.Messager;
import demo.house.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by fanzhun on 2017/6/10.
 */

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/pages/user/login",method= RequestMethod.GET)
    @ResponseBody
    public Messager login(HttpServletResponse response, HttpServletRequest request, HttpSession session,
                          @RequestParam("username")String userName, @RequestParam("password")String passWord){

        Messager messager = new Messager();

        try{

            User jiuzhouUser = userService.userLogin(userName, passWord);   // TODO: 2017/6/12  MD5加密

            if(jiuzhouUser!=null){
                String userType = jiuzhouUser.getLoginType().trim();
                if(userType.equals("admin")||userType.equals("normal")){
                    session.setAttribute("jiuzhouUser", jiuzhouUser);
                    //session.setMaxInactiveInterval(10);
                    messager.setFlag(true);
                }else {
                    messager.setFlag(false);
                    messager.setMessage("Invalid userName or password.");
                }
            }else {
                messager.setFlag(false);
                messager.setMessage("Invalid userName or password.");
            }

        } catch (Exception e){
            e.printStackTrace();
            messager.setMessage(e.getMessage());
        }

        return messager;
    }
}

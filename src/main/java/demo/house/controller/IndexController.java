package demo.house.controller;

import demo.house.model.House;
import demo.house.service.AdminService;
import demo.house.util.Messager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by fanzhun on 2017/6/16.
 */
@Controller
public class IndexController {

    //temp use
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome(Model model) {
        model.addAttribute("hList", adminService.getHousesByToken(2));
        System.out.println("get all houses");
        return "/pages/index";
    }

    @RequestMapping(value = "/searchForCon", method = RequestMethod.GET)
    @ResponseBody
    public Messager searchForCon(@PathVariable("communityName ") String communityName, HttpSession session) {
        System.out.println(communityName);
        Messager result = new Messager();
        List<House> list = adminService.getHouseListByCommunityName(communityName);
        session.setAttribute("houseList", list);
        return result;
    }
}

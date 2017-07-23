package demo.house.controller;

import demo.house.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Created by fanzhun on 2017/6/16.
 */
@Controller
public class IndexController {

    //temp use
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome(Model model){
        model.addAttribute("hList", adminService.getHousesByToken(2));
        System.out.println("get all houses");
        return "/pages/index";
    }
}

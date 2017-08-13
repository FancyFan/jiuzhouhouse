package demo.house.controller;

import demo.house.model.House;
import demo.house.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

import org.springframework.ui.Model;

/**
 * Created by banma82 on 2017/8/11.
 */
@Controller
public class HouseController {
    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/house/houseList", method = RequestMethod.GET)
    public String houseList(Model model) {
        List<House> houses = adminService.getHousesForList(0, 9);
        model.addAttribute("houses", houses);
        return "/pages/houseList";
    }

}

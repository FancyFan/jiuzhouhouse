package demo.house.controller;

import demo.house.model.House;
import demo.house.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.swing.plaf.PanelUI;

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

    @RequestMapping(value = "/houseDetail/{houseId}",method = RequestMethod.GET)
    public String houseDetail(@PathVariable("houseId") int houseId, Model model){
        House house=adminService.getHouseById(houseId);
        model.addAttribute("house",house);
        return "/pages/HouseDetail";

    }

}

package demo.house.controller;

import demo.house.model.House;
import demo.house.model.RentHouse;
import demo.house.model.SecondHouse;
import demo.house.service.AdminService;
import demo.house.service.RentHouseService;
import demo.house.service.SecondHouseService;
import demo.house.util.Messager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private SecondHouseService secondHouseService;

    @Autowired
    private RentHouseService rentHouseService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome(Model model) {
        List<House> houses = adminService.getIndexHouse();
        model.addAttribute("houses", houses);
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


    @RequestMapping(value = "/house/search", method = RequestMethod.POST)
    public String search(String province, String city, String county, String address, String status, String houseType, Integer minArea, Integer maxArea, Integer minPrice, Integer maxPrice, HttpSession session, Model model) {
        System.out.println(province + " ;" + city + " ;" + county + " ;" + address + " ;" + status + " ;" + houseType + " ;" + minArea + " ;" + maxArea + " ;" + minPrice + " ;" + maxPrice);
        if (minArea != null && maxArea != null) {
            if (minArea < 0 | maxArea <= 0 | maxArea < minArea) return "redirect:/";
        }
        if (minPrice != null && maxPrice != null) {
            if (minPrice > maxPrice) return "redirect:/";
        }
        province = province == null ? ".*" : province;
        city = city == null ? ".*" : city;
        county = county == null ? ".*" : county;
        address = address == null ? ".*" : address;
        houseType = houseType == null ? ".*" : houseType;
        minArea = minArea == null ? 0 : minArea;
        maxArea = maxArea == null ? Integer.MAX_VALUE : maxArea;
        minPrice = minPrice == null ? 0 : minPrice;
        maxPrice = maxPrice == null ? Integer.MAX_VALUE : maxPrice;
        if (status.equals("买房")) {
            List<House> houses = adminService.searchForHouse(province, city, county, address, houseType, minArea, maxArea, minPrice, maxPrice);
            model.addAttribute("houses", houses);
            return "redirect:/";
        } else if (status.equals("二手房")) {
            List<SecondHouse> houses = secondHouseService.searchForHouse(province, city, county, address, houseType, minArea, maxArea, minPrice, maxPrice);
            model.addAttribute("houses", houses);
            return "/pages/property-listing";
        } else {
            List<RentHouse> houses = rentHouseService.searchForHouse(province, city, county, address, houseType, minArea, maxArea, minPrice, maxPrice);
            model.addAttribute("houses", houses);
            return "/pages/property-listing";
        }
    }
}

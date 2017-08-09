package demo.house.controller;

import demo.house.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    protected final Logger logger = LoggerFactory.getLogger("order");
    //temp use
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome(Model model){
        model.addAttribute("hList", adminService.getAllHouse());
        logger.debug("bizId={},bizType={},cancel={}",1,2,3);
        return "/pages/index";
    }
}

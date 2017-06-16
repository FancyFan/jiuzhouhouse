package demo.house.controller;

import demo.house.enums.OptEnum;
import demo.house.exception.HouseException;
import demo.house.model.House;
import demo.house.model.User;
import demo.house.service.AdminService;
import demo.house.util.Messager;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Z674143 on 2017/4/12.
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;



    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String getAllHouse(Model model, HttpSession session) {
        if(session.getAttribute("jiuzhouUser")==null)
            return "pages/error";

        User user = (User)session.getAttribute("jiuzhouUser");
        if(!user.getLoginType().equals("admin"))
            return "pages/error";

        List<House> houses = adminService.getAllHouse();
        model.addAttribute("houses", houses);
        return "pages/adminPage";
    }

//    @RequestMapping(value = "/admin")
//    public ModelAndView getAdmin() {
//        List<String> users = new ArrayList<>();
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("users", users);
//        mv.setViewName("admin");
//        return mv;
//    }

    @RequestMapping(value = "/house/{houseId}/detail",method = RequestMethod.GET)
    @ResponseBody
    public Messager detail(@PathVariable("houseId") int houseId) {
        Messager result;
        try {
            House house = adminService.getHouseById(houseId);
            result = new Messager(true, house);
        } catch (HouseException e) {
            result = new Messager(false, e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/house/{houseId}/delete",method = RequestMethod.GET)
    @ResponseBody
    public Messager delete(@PathVariable("houseId") int houseId) {
        Messager result;
        try {
            int deleteCount = adminService.deleteHouseById(houseId);
            if(deleteCount>0){
                result = new Messager(true,OptEnum.DELETE_SUCCESS.getStateInfo());
            }else{
                result = new Messager(false, OptEnum.DELETE_FAIL.getStateInfo());
            }

        } catch (HouseException e) {
            result = new Messager(false, e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/house/{houseId}/update",method = RequestMethod.POST)
    @ResponseBody
    public Messager update(@PathVariable("houseId") int houseId, House house){
        if(house == null){
            return  new Messager(false, OptEnum.NULLABLE_ARGUMENT.getStateInfo());
        }

        Messager result;
        try {
            int updateHouseCount = adminService.updateHouse(house);

            if (updateHouseCount>0){
                result = new Messager(true,OptEnum.UPDATE_SUCCESS.getStateInfo());
            }else {
                result = new Messager(true,OptEnum.UPDATE_FAIL.getStateInfo());
            }
        } catch (Exception e) {
            result = new Messager(false,e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/house/add",method = RequestMethod.POST)
    @ResponseBody
    public Messager add(House house){
        if(house == null) {
            return new Messager(false, OptEnum.NULLABLE_ARGUMENT.getStateInfo());
        }

        Messager result;
        try {
            int addHouseCount = adminService.addHouse(house);
            if(addHouseCount>0){
                result = new Messager(true,OptEnum.ADD_SUCCESS.getStateInfo());
            }else {
                result = new Messager(false,OptEnum.ADD_FAIL.getStateInfo());
            }
        } catch (Exception e) {
            result = new Messager(false, e.getMessage());
        }

        return result;
    }

    @RequestMapping(value = "/house/addP",method = RequestMethod.POST)
    //@ContentType(mimeType = HttpMimeType.MULTIPART_FORM_DATA)
    @ResponseBody
    public Messager uploadPicture(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,
                               @RequestParam(value = "pid")String pid, HttpSession session){
        // public Messager getPicture(@RequestParam("upload") CommonsMultipartFile file){
        System.out.print("get request");
        System.out.println("pid is "+pid);

        String url = session.getServletContext().getRealPath("/") + "house";

        //获取文件的名称
        String filename = uploadfile.getOriginalFilename();
        int prefix = filename.lastIndexOf(".");
        filename = pid+filename.substring(prefix);

        String path = url;
        try {
            FileUtils.writeByteArrayToFile(new File(path, filename), uploadfile.getBytes());
            House house = adminService.getHouseById(Integer.valueOf(pid));
            if(house.getImgSrc().equals("house/000.jpg")){
                String houseImgSrc = "house/"+filename;
                adminService.saveImgSrc(Integer.valueOf(pid),houseImgSrc);
                house.setImgSrc(houseImgSrc);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        Messager result = new Messager(true,"receive request");
        return  result;
    }

}

package demo.house.controller;

import demo.house.enums.OptEnum;
import demo.house.exception.HouseException;
import demo.house.model.House;
import demo.house.model.User;
import demo.house.service.AdminService;
import demo.house.util.Messager;
import org.apache.commons.io.FileUtils;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String getAllHouse(Model model, HttpSession session) {
        if (session.getAttribute("jiuzhouUser") == null)
            return "pages/error";

        User user = (User) session.getAttribute("jiuzhouUser");
        if (user.getLoginType().equals("normal")) {
            List<House> houses = adminService.getHouseByUserId(user.getUserId());
            model.addAttribute("houses", houses);
            return "pages/normal";
        } else if (user.getLoginType().equals("admin")) {
            List<House> houses = adminService.getAllHouse();
            model.addAttribute("houses", houses);
            return "pages/adminPage";
        } else {
            return "pages/error";
        }
    }

    @RequestMapping(value = "/href/{flag}", method = RequestMethod.GET)
    public String flag(@PathVariable("flag") int flag, HttpSession session, Model model) {
        if (session.getAttribute("jiuzhouUser") == null) {
            return "pages/error";
        }
        if (flag == 0) {
            return "pages/add";
        } else {
            session.setAttribute("houseId", flag);
            House house = adminService.getHouseById(flag);
//            session.setAttribute("houseModify", house);
            model.addAttribute("data", house);
            return "pages/modify";
        }
    }

    @RequestMapping(value = "/{houseId}/detail", method = RequestMethod.GET)
    public String detail(@PathVariable("houseId") int houseId, HttpSession session) {
        if (session.getAttribute("jiuzhouUser") == null)
            return "pages/error";
        try {
            House house = adminService.getHouseById(houseId);
            session.setAttribute("houseDetail", house);
            return "pages/detail";
        } catch (Exception e) {
            return "pages/error";
        }
    }

    @RequestMapping(value = "/house/logout", method = RequestMethod.GET)
    @ResponseBody
    public Messager logout(HttpSession session) {
        Messager result = new Messager();
        System.out.println("user");
        session.removeAttribute("jiuzhouUser");
        System.out.println("logout");
        return result;
    }

    @RequestMapping(value = "/house/{houseId}/examine", method = RequestMethod.GET)
    @ResponseBody
    public Messager examine(@PathVariable("houseId") int houseId) {
        Messager result;
        try {
            result = new Messager();
            adminService.updateHouseToken(houseId);
            result.setFlag(true);
        } catch (HouseException e) {
            result = new Messager(false, e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/house/{houseId}/delete", method = RequestMethod.GET)
    @ResponseBody
    public Messager delete(@PathVariable("houseId") int houseId) {
        Messager result;
        try {
            int deleteCount = adminService.deleteHouseById(houseId);
            if (deleteCount > 0) {
                result = new Messager(true, OptEnum.DELETE_SUCCESS.getStateInfo());
            } else {
                result = new Messager(false, OptEnum.DELETE_FAIL.getStateInfo());
            }

        } catch (HouseException e) {
            result = new Messager(false, e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/house/{houseId}/update", method = RequestMethod.POST)
    @ResponseBody
    public Messager update(@PathVariable("houseId") int houseId, House house, HttpSession session) {
        if (house == null) {
            return new Messager(false, OptEnum.NULLABLE_ARGUMENT.getStateInfo());
        }

        Messager result;
        try {
            int updateHouseCount = adminService.updateHouse(house);

            if (updateHouseCount > 0) {
                result = new Messager(true, OptEnum.UPDATE_SUCCESS.getStateInfo());
                session.setAttribute("pid", house.getHouseId());
            } else {
                result = new Messager(true, OptEnum.UPDATE_FAIL.getStateInfo());
            }
        } catch (Exception e) {
            result = new Messager(false, e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/house/add", method = RequestMethod.POST)
    @ResponseBody
    public Messager add(House house, HttpSession session) {
        User user = (User) session.getAttribute("jiuzhouUser");
        if (house == null) {
            return new Messager(false, OptEnum.NULLABLE_ARGUMENT.getStateInfo());
        }
        if (user == null) return new Messager(false, OptEnum.NO_LOG.getStateInfo());
        Messager result;
        try {
            house.setHouseToken(1);
            house.setUseId(user.getUserId());
            int addHouseCount = adminService.addHouse(house);
            if (addHouseCount > 0) {
                result = new Messager(true, OptEnum.ADD_SUCCESS.getStateInfo());
                session.setAttribute("pid", house.getHouseId());
            } else {
                result = new Messager(false, OptEnum.ADD_FAIL.getStateInfo());
            }
        } catch (Exception e) {
            result = new Messager(false, e.getMessage());
        }

        return result;
    }

    @RequestMapping(value = "/house/addPs", method = RequestMethod.POST)
    @ResponseBody
    public void uploadPictures(@RequestParam(required = false) MultipartFile[] uploadfile, final HttpServletRequest request, HttpSession session) {
        try {
            String pid = session.getAttribute("pid").toString();
            String url = session.getServletContext().getRealPath("/") + "house";
            String path = url + "//" + pid;
            House house = adminService.getHouseById(Integer.valueOf(pid));
            System.out.println("update" + uploadfile.length);
            File dir = new File(path);
            if (!dir.exists() && !dir.mkdir()) return;
            for (int i = 0; i < uploadfile.length; i++) {
                System.out.println("update:file" + i);
                MultipartFile file = uploadfile[i];
                System.out.println(file);
                String filename = file.getOriginalFilename();
                System.out.println(filename);
                int prefix = filename.lastIndexOf(".");
                filename = i + filename.substring(prefix);
                if (house.getImgSrc().equals("house/" + "000.jpg")) {
                    house.setImgSrc("house/" + filename);
                    adminService.updateHouse(house);
                }
                FileUtils.writeByteArrayToFile(new File(path, filename), file.getBytes());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/house/addP", method = RequestMethod.POST)
    //@ContentType(mimeType = HttpMimeType.MULTIPART_FORM_DATA)
    @ResponseBody
    public Messager uploadPicture(@RequestParam(value = "uploadfile", required = false) MultipartFile[] uploadfiles,
                                  @RequestParam(value = "pid") String pid, HttpSession session) {
        // public Messager getPicture(@RequestParam("upload") CommonsMultipartFile file){
//        System.out.print("get request");
        System.out.println("pid is " + pid);

        String url = session.getServletContext().getRealPath("/") + "house";
        System.out.println(url);


        //获取文件的名称
        try {
            for (int i = 0; i < uploadfiles.length; i++) {
                MultipartFile uploadfile = uploadfiles[i];
                String filename = uploadfile.getOriginalFilename();
                int prefix = filename.lastIndexOf(".");
                filename = pid + "-" + i + filename.substring(prefix);
                String path = url;
                FileUtils.writeByteArrayToFile(new File(path, filename), uploadfile.getBytes());
                House house = adminService.getHouseById(Integer.valueOf(pid));
                System.out.println(house.getImgSrc());
                if (house.getImgSrc().equals("house/" + "000.jpg")) {
                    String houseImgSrc = "house/" + filename;
                    adminService.saveImgSrc(Integer.valueOf(pid), houseImgSrc);
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        Messager result = new Messager(true, "receive request");
        return result;
    }

}

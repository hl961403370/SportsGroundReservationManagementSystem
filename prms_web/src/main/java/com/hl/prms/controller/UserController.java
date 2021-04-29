package com.hl.prms.controller;

import com.github.pagehelper.PageInfo;
import com.hl.prms.biz.ReserveBiz;
import com.hl.prms.biz.UserBiz;
import com.hl.prms.entity.Reserve;
import com.hl.prms.entity.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

    @Resource(name = "userBiz")
    private UserBiz userBiz;

    @Resource(name = "reserveBiz")
    private ReserveBiz reserveBiz;

    @RequestMapping("/list")
    public String list(Map<String,Object> map, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5")int size){
        List<User> userList = userBiz.getAll(page,size);
        Map<Integer,Integer> sumList = new HashMap<>();
        for(User user : userList){
            List<Reserve> reserveList = reserveBiz.getAllById(String.valueOf(user.getId()));
            double sum = 0;
            for (Reserve reserve : reserveList){
                if(reserve.getRstatus() == 3){
                    sum+=reserve.getRmoney();
                }
            }
            sumList.put(user.getId(),(int)sum);
        }
        map.put("list",userList);
        map.put("sumList",sumList);
        PageInfo pageInfo = new PageInfo(userBiz.getAll(page,size));
        map.put("ps",pageInfo);
        return "user_list";
    }

    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("user",new User());
        return "user_add";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
        FileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        List<FileItem> fileItemList = servletFileUpload.parseRequest(request);
        User user = new User();
        boolean upload =true;
        for (FileItem fileItem : fileItemList) {
            if (fileItem.isFormField()) {
                //存放对应的属性
                if(fileItem.getFieldName().equals("userName")){
                    //输出对应接收到的属性
                    user.setUserName(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("passWord")){
                    user.setPassWord(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("name")){
                    user.setName(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("sex")){
                    user.setSex(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("phoneNumber")){
                    user.setPhoneNumber(fileItem.getString("UTF-8"));
                }
            } else {
                //存放文件
                String fileName = fileItem.getName();
                if(fileName.equals("")){
                    upload =false;
                }
                String ext = ".jpg";
                String rootPath = request.getServletContext().getRealPath("/");
                if (fileName.indexOf(".") != -1) {
                    ext = fileName.substring(fileName.lastIndexOf("."));
                }
                String path = "/upload/" + UUID.randomUUID().toString().replaceAll("-", "") + ext;
                try {
                    //存入对应的位置
                    fileItem.write(new File(rootPath + path));
                    user.setProfileImg(path);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        //执行完毕跳转到对应页面
        if(upload == false){
            user.setProfileImg("/upload/wrtx.jpg");
        }
        user.setIdentity(1);
        userBiz.add(user);
        return "redirect:list";
    }

    @RequestMapping(value = "/to_update",params = "id")
    public String toUpdate(String id,Map<String,Object> map){
        map.put("user",userBiz.get(id));
        return "user_update";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
        FileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        List<FileItem> fileItemList = servletFileUpload.parseRequest(request);
        User user = null;
        String img = null;
        boolean upload =true;
        for (FileItem fileItem : fileItemList) {
            if(fileItem.getFieldName().equals("id")) {
                user = userBiz.get(fileItem.getString("UTF-8"));
            }
        }
        for (FileItem fileItem : fileItemList) {
            if (fileItem.isFormField()) {
                //存放对应的属性
                if(fileItem.getFieldName().equals("name")){
                    user.setName(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("sex")){
                    user.setSex(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("phoneNumber")){
                    user.setPhoneNumber(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("img")){
                    img =fileItem.getString("UTF-8");
                }
            } else {
                //存放文件
                String fileName = fileItem.getName();
                if(fileName.equals("")){
                    upload =false;
                }
                String ext = ".jpg";
                String rootPath = request.getServletContext().getRealPath("/");
                if (fileName.indexOf(".") != -1) {
                    ext = fileName.substring(fileName.lastIndexOf("."));
                }
                String path = "/upload/" + UUID.randomUUID().toString().replaceAll("-", "") + ext;
                try {
                    //存入对应的位置
                    fileItem.write(new File(rootPath + path));
                    user.setProfileImg(path);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        if(upload == false){
            user.setProfileImg(img);
        }
        userBiz.edit(user);
        request.getSession().setAttribute("user",user);
        return "redirect:../self";
    }

    @RequestMapping(value = "/to_updateIV",params = "id")
    public String toUpdateIV(String id,Map<String,Object> map){
        map.put("user",userBiz.get(id));
        return "user_updateIV";
    }

    @RequestMapping("/updateIV")
    public String updateIV(User user){
        userBiz.edit(user);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove",params = "id")
    public String remove(String id){
        userBiz.remove(id);
        return "redirect:list";
    }

    @RequestMapping(value = "/removeAll",params = "checkId")
    public String removeAll(String[] checkId){
        System.out.println(checkId);
        for(int i=0;i<checkId.length;i++){
            userBiz.remove(checkId[i]);
        }
        return "redirect:list";
    }

    @RequestMapping("/to_excel")
    public String toExcel(Map<String,Object> map){
        return "user_excel";
    }
}

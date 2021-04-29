package com.hl.prms.controller;

import com.hl.prms.biz.*;
import com.hl.prms.entity.Message;
import com.hl.prms.entity.Place;
import com.hl.prms.entity.Reserve;
import com.hl.prms.entity.User;
import com.hl.prms.util.RandomValidateCode;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Date;

@Controller("globalController")
public class GlobalController {

    @Resource(name = "globalBiz")
    private GlobalBiz globalBiz;

    @Resource(name = "placeBiz")
    private PlaceBiz placeBiz;

    @Resource(name = "userBiz")
    private UserBiz userBiz;

    @Resource(name = "messageBiz")
    private MessageBiz messageBiz;

    @RequestMapping("/to_login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/index")
    public String toIndex(){
        return "index";
    }

    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam String username, @RequestParam String password,@RequestParam String code){
        if(!session.getAttribute("randomcode_key").equals(code)){
            return "redirect:to_login";
        }
        User user = globalBiz.login(username,password);
        if(user == null){
            return "redirect:to_login";
        }
        session.setAttribute("user",user);
        return "redirect:self";
    }

    @RequestMapping("/to_register")
    public String toRegister(){
        return "register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
        FileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        List<FileItem> fileItemList = servletFileUpload.parseRequest(request);
        User user = new User();
        boolean upload = true;
        for (FileItem fileItem : fileItemList) {
            if (fileItem.isFormField()) {
                //存放对应的属性
                if(fileItem.getFieldName().equals("userName")){
                    //输出对应接收到的属性
                    user.setUserName(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("passWord")){
                    user.setPassWord(fileItem.getString("UTF-8"));
                    System.out.println(fileItem.getString("UTF-8"));
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
                System.out.println(path);
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
        return "redirect:to_login";
    }

    @RequestMapping("/self")
    public String self(){
        return "self";
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("user",null);
        return "redirect:to_login";
    }

    @RequestMapping("/to_change_password")
    public String toChangePassword(){
        return "change_password";
    }

    @RequestMapping("/change_password")
    public String changePassword(HttpSession session, @RequestParam String old, @RequestParam String new1, @RequestParam String new2){
        User user = (User)session.getAttribute("user");
        if(user.getPassWord().equals(old)){
            if(new1.equals(new2)){
                user.setPassWord(new1);
                System.out.println(new1);
                globalBiz.changePassword(user);
                return "redirect:self";
            }
        }
        return "redirect:to_change_password";
    }

    @RequestMapping(value = "/checkUserName",produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String checkUserName(String userName){
        if(userBiz.getByUserName(userName)==null){
            return "该账号未注册，请您继续填以下内容！";
        }
        return "该账号已注册，请您重新输入！";
    }

    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

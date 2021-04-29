package com.hl.prms.controller;


import com.github.pagehelper.BasePageHelper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hl.prms.biz.PlaceBiz;
import com.hl.prms.entity.Place;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller("placeController")
@RequestMapping("/place")
public class PlaceController {

    @Resource(name = "placeBiz")
    private PlaceBiz placeBiz;

    @RequestMapping("/list")
    public String list(Map<String,Object> map,@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "5")int size){
        map.put("list",placeBiz.getAll(page,size));
        PageInfo pageInfo = new PageInfo(placeBiz.getAll(page,size));
        map.put("ps",pageInfo);
        return "place_list";
    }

    @RequestMapping("/showAll")
    public String showAll(Map<String,Object> map,@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "5")int size){
        map.put("list",placeBiz.getAll(page,size));
        PageInfo pageInfo = new PageInfo(placeBiz.getAll(page,size));
        map.put("ps",pageInfo);
        return "place_showAll";
    }

    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("place",new Place());
        return "place_add";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
        FileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        List<FileItem> fileItemList = servletFileUpload.parseRequest(request);
        Place place = new Place();
        for (FileItem fileItem : fileItemList) {
            System.out.println(fileItem);
            if (fileItem.isFormField()) {
                //存放对应的属性
                System.out.println("我是1");
                if(fileItem.getFieldName().equals("pname")){
                    //输出对应接收到的属性
                    place.setPname(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("plocation")){
                    place.setPlocation(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("parea")){
                    place.setParea(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("pintroduce")){
                    place.setPintroduce(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("ptype")){
                    place.setPtype(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("pprice")){
                    place.setPprice(fileItem.getString("UTF-8"));
                }else if(fileItem.getFieldName().equals("pnumber")){
                    place.setPnumber(Integer.parseInt(fileItem.getString("UTF-8")));
                }
            } else {
                System.out.println("我是2");
                //存放文件
                String fileName = fileItem.getName();
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
                    place.setPprofileImg(path);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        //执行完毕跳转到对应页面
        System.out.println(place);
        placeBiz.add(place);
        return "redirect:list";
    }

    @RequestMapping(value = "/to_update",params = "pid")
    public String toUpdate(String pid,Map<String,Object> map){
        map.put("place",placeBiz.get(pid));
        return "place_update";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
        FileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        List<FileItem> fileItemList = servletFileUpload.parseRequest(request);
        Place place = null;
        String img = null;
        boolean upload =true;
        for (FileItem fileItem : fileItemList) {
            if (fileItem.getFieldName().equals("pid")) {
                place = placeBiz.get(fileItem.getString("UTF-8"));
            }
        }
        for (FileItem fileItem : fileItemList) {
            System.out.println(fileItem);
            if (fileItem.isFormField()) {
                //存放对应的属性
                System.out.println("我是1");
                if (fileItem.getFieldName().equals("plocation")) {
                    place.setPlocation(fileItem.getString("UTF-8"));
                } else if (fileItem.getFieldName().equals("pnumber")) {
                    place.setPnumber(Integer.parseInt(fileItem.getString("UTF-8")));
                } else if (fileItem.getFieldName().equals("parea")) {
                    place.setParea(fileItem.getString("UTF-8"));
                } else if (fileItem.getFieldName().equals("pintroduce")) {
                    place.setPintroduce(fileItem.getString("UTF-8"));
                } else if (fileItem.getFieldName().equals("ptype")) {
                    place.setPtype(fileItem.getString("UTF-8"));
                } else if (fileItem.getFieldName().equals("pprice")) {
                    place.setPprice(fileItem.getString("UTF-8"));
                } else if(fileItem.getFieldName().equals("img")){
                    img =fileItem.getString("UTF-8");
                } else if (fileItem.getFieldName().equals("pstatus")) {
                    place.setPstatus(Integer.parseInt(fileItem.getString("UTF-8")));
                    System.out.println(fileItem.getString("UTF-8"));
                }
            } else {
                System.out.println("我是2");
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
                    place.setPprofileImg(path);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        //执行完毕跳转到对应页面
        if(upload == false){
            place.setPprofileImg(img);
        }
        System.out.println(place);
        placeBiz.edit(place);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove",params = "pid")
    public String remove(String pid){
        placeBiz.remove(pid);
        return "redirect:list";
    }

    @RequestMapping(value = "/removeAll",params = "checkId")
    public String removeAll(String[] checkId){
        System.out.println(checkId);
        for(int i=0;i<checkId.length;i++){
            placeBiz.remove(checkId[i]);
        }
        return "redirect:list";
    }

    @RequestMapping("/to_map")
    public String toMap(){
        return "place_mapInSchool";
    }

    @RequestMapping("/to_navigation")
    public String toNavigation(){
        return "place_navigationOutsideSchool";
    }
}

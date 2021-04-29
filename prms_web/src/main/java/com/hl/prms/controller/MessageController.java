package com.hl.prms.controller;


import com.github.pagehelper.PageInfo;
import com.hl.prms.biz.MessageBiz;
import com.hl.prms.entity.Message;
import com.hl.prms.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller("messageController")
@RequestMapping("/message")
public class MessageController {

    @Resource(name = "messageBiz")
    private MessageBiz messageBiz;

    @RequestMapping("/list")
    public String list(Map<String,Object> map, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20")int size){
        map.put("list",messageBiz.getAll(page,size));
        PageInfo pageInfo = new PageInfo(messageBiz.getAll(page,size));
        map.put("ps",pageInfo);
        for(Message message :messageBiz.getAll(page,size)){
            System.out.println(message);
        }
        return "message_list";
    }

    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("message",new Message());
        return "message_add";
    }

    @RequestMapping("/add")
    public String add(Message message,HttpSession session){
        User user = (User)session.getAttribute("user");
        message.setUid(user.getId());
        messageBiz.add(message);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove",params = "mid")
    public String remove(String mid){
        messageBiz.remove(mid);
        return "redirect:list";
    }


    @RequestMapping(value = "/update",params = "mid")
    public String update(String mid){
        messageBiz.edit(mid);
        return "redirect:read?status=0";
    }


    @RequestMapping(value = "/read",params = "status")
    public String listRead(String status,Map<String,Object> map, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20")int size){
        map.put("list",messageBiz.getStatus(status,page,size));
        map.put("status",status);
        PageInfo pageInfo = new PageInfo(messageBiz.getAll(page,size));
        map.put("ps",pageInfo);
        return "message_read";
    }

    @RequestMapping(value = "/removeAll",params = "checkId")
    public String removeAll(String[] checkId){
        System.out.println(checkId);
        for(int i=0;i<checkId.length;i++){
            messageBiz.remove(checkId[i]);
        }
        return "redirect:list";
    }


    @RequestMapping("/to_selfAdd")
    public String toSelfAdd(Map<String,Object> map){
        map.put("message",new Message());
        return "message_selfAdd";
    }

    @RequestMapping("/selfAdd")
    public String SelfAdd(Message message, HttpSession session){
        User user = (User)session.getAttribute("user");
        message.setUid(user.getId());
        messageBiz.add(message);
        return "redirect:selfList";
    }

    @RequestMapping("/selfList")
    public String selfList(Map<String,Object> map, HttpSession session){
        User user = (User)session.getAttribute("user");
        List<Message> messageList = messageBiz.getSelfList(String.valueOf(user.getId()));
        map.put("list",messageList);
        return "message_selfList";
    }
}

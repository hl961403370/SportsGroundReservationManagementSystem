package com.hl.prms.controller;

import com.alibaba.fastjson.JSON;
import com.hl.prms.biz.PlaceBiz;
import com.hl.prms.biz.ReserveBiz;
import com.hl.prms.biz.UserBiz;
import com.hl.prms.entity.Place;
import com.hl.prms.entity.Reserve;
import com.hl.prms.entity.User;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller("statisticController")
@RequestMapping("/statistic")
public class StatisticController {

    @Resource(name = "userBiz")
    private UserBiz userBiz;

    @Resource(name = "reserveBiz")
    private ReserveBiz reserveBiz;

    @Resource(name = "placeBiz")
    private PlaceBiz placeBiz;

    @RequestMapping(value = "/user")
    public String showUser(Map<String,Object> map){
        return "statistic_user";
    }

    @RequestMapping(value = "/getUser")
    @ResponseBody
    public String getUser(Map<String,Object> map){
        List<User> list = userBiz.getUserList();
        List<String> dateList = new ArrayList<>();
            List<Integer> numList = new ArrayList<>();
            for(User user:list){
                Date date1 = user.getCreateTime();
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
                String date2 = sf.format(date1);
                System.out.println(date2);
            boolean sj = false;
            for (int i = 0;i<dateList.size();i++){
                if(dateList.get(i).substring(0,10).equals(date2.substring(0,10))){
                    sj = true;//hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh爱你哦~
                    int j =numList.get(i);
                    numList.set(i,++j);
                }
            }
            if(sj == false){
                dateList.add(date2);
                numList.add(1);
            }
        }
        System.out.println("--------dateList--------");
        System.out.println(dateList);
        System.out.println("--------numList--------");
        System.out.println(numList);
        map.put("dateList",dateList);
        map.put("numList",numList);
        String json = JSON.toJSONString(map);
        return json;
    }

    @RequestMapping(value = "/reserve")
    public String showReserve(){
        return "statistic_reserve";
    }

    @RequestMapping(value = "/getReserve",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getReserve(Map<String,Object> map){
        List<Reserve> list = reserveBiz.getReserveList();
        List<String> dateList = new ArrayList<>();
        List<Integer> numList = new ArrayList<>();
        List<Map<String, Object>> seriesList = new ArrayList<>();
        //0：未付款,1：已付款，2：已取消，3：已完成
        Map<String, Object> seriesItemMap = new HashMap<String, Object>();
        seriesItemMap.put("name","未付款");
        seriesItemMap.put("value",0);
        seriesList.add(seriesItemMap);
        Map<String, Object> seriesItemMap1 = new HashMap<String, Object>();
        seriesItemMap1.put("name","已付款");
        seriesItemMap1.put("value",0);
        seriesList.add(seriesItemMap1);
        Map<String, Object> seriesItemMap2 = new HashMap<String, Object>();
        seriesItemMap2.put("name","已取消");
        seriesItemMap2.put("value",0);
        seriesList.add(seriesItemMap2);
        Map<String, Object> seriesItemMap3 = new HashMap<String, Object>();
        seriesItemMap3.put("name","已完成");
        seriesItemMap3.put("value",0);
        seriesList.add(seriesItemMap3);
        for(Reserve reserve:list){
            Date date1 = reserve.getCreateTime();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            String date2 = sf.format(date1);
            boolean sj = false;
            for (int i = 0;i<dateList.size();i++){
                if(dateList.get(i).substring(0,10).equals(date2.substring(0,10))){
                    sj = true;
                    int j =numList.get(i);
                    numList.set(i,++j);
                }
            }
            if(sj == false){
                dateList.add(date2);
                numList.add(1);
            }
            for (Map<String, Object> map1:seriesList){
                int num = reserve.getRstatus();
                if(map1.get("name").equals("未付款") && num == 0){
                    int z = (int)map1.get("value");
                    map1.put("value",++z);
                }else if(map1.get("name").equals("已付款") && num == 1){
                    int z = (int)map1.get("value");
                    map1.put("value",++z);
                }else if(map1.get("name").equals("已取消") && num == 2){
                    int z = (int)map1.get("value");
                    map1.put("value",++z);
                }else if(map1.get("name").equals("已完成") && num == 3){
                    int z = (int)map1.get("value");
                    map1.put("value",++z);
                }
            }
        }
        map.put("dateList",dateList);
        map.put("numList",numList);
        map.put("seriesList",seriesList);
        System.out.println(map);
        String json = JSON.toJSONString(map);
        return json;
    }

    @RequestMapping("/place")
    public String showPlace(){
        return "statistic_place";
    }

    @RequestMapping(value = "/getPlace",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getPlace(Map<String,Object> map){
        List<Reserve> list = reserveBiz.getReserveList();
        List<Place> placeList = placeBiz.getList();
        List<Map<String, Object>> seriesList = new ArrayList<>();
        //场地名称
        for (int i = 0;i<placeList.size();i++){
            Map<String, Object> seriesItemMap = new HashMap<String, Object>();
            seriesItemMap.put("name",placeList.get(i).getPname());
            seriesItemMap.put("value",0);
            seriesList.add(seriesItemMap);
        }
        for(Reserve reserve:list){
            for (Map<String, Object> map1:seriesList){
                int num = reserve.getPid();
                Place place = placeBiz.get(String.valueOf(num));
                String pname = place.getPname();
                if(map1.get("name").equals(pname)) {
                    int z = (int) map1.get("value");
                    map1.put("value", ++z);
                    continue;
                }
            }
        }
        map.put("seriesList",seriesList);
        String json = JSON.toJSONString(map);
        return json;
    }

    @RequestMapping("/money")
    public String showMoney(){
        return "statistic_money";
    }

    @RequestMapping(value = "/getMoney")
    @ResponseBody
    public String getMoney(Map<String,Object> map){
        List<Reserve> list = reserveBiz.getReserveList();
        List<String> dateList = new ArrayList<>();
        List<Double> numList = new ArrayList<>();
        for(Reserve reserve : list){
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH");
            String date1 = sf.format(date);
            String date2 = reserve.getRdate();
            boolean sj = false;
            for (int i = 0;i<dateList.size();i++){
                if(dateList.get(i).substring(0,10).equals(date2.substring(0,10))){
                    sj = true;
                    double j =numList.get(i);
                    if(reserve.getRstatus() == 3){
                        j+=reserve.getRmoney();
                    }
                    numList.set(i,j);
                }
            }
            if(sj == false){
                int rYear = Integer.parseInt(date2.substring(0,4));
                int rMonth = Integer.parseInt(date2.substring(5,7));
                int rDay = Integer.parseInt(date2.substring(8,10));
                int rHour = reserve.getRtime();
                int year = Integer.parseInt(date1.substring(0,4));
                int month = Integer.parseInt(date1.substring(5,7));
                int day = Integer.parseInt(date1.substring(8,10));
                int hour = Integer.parseInt(date1.substring(11,13));
                if(year>rYear){
                    dateList.add(date2);
                    numList.add(0.0);
                }else if (year==rYear){
                    if(month>rMonth){
                        dateList.add(date2);
                        numList.add(0.0);
                    }else if (month==rMonth) {
                        if (day > rDay) {
                            dateList.add(date2);
                            numList.add(0.0);
                        }else if (day == rDay){
                            if (hour >= rHour) {
                                dateList.add(date2);
                                numList.add(0.0);
                            }
                        }
                    }
                }
            }
        }
        System.out.println("--------dateList--------");
        System.out.println(dateList);
        System.out.println("--------numList--------");
        System.out.println(numList);
        map.put("dateList",dateList);
        map.put("numList",numList);
        String json = JSON.toJSONString(map);
        return json;
    }
}

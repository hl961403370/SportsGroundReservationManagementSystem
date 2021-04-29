package com.hl.prms.controller;

import com.github.pagehelper.PageInfo;
import com.hl.prms.biz.PlaceBiz;
import com.hl.prms.biz.ReserveBiz;
import com.hl.prms.entity.Place;
import com.hl.prms.entity.Reserve;
import com.hl.prms.entity.User;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller("reserveController")
@RequestMapping("/reserve")
public class ReserveController {

    @Resource(name = "reserveBiz")
    private ReserveBiz reserveBiz;
    @Resource(name = "placeBiz")
    private PlaceBiz placeBiz;

    @RequestMapping("/list")
    public String list(Map<String,Object> map, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10")int size){
        map.put("list",reserveBiz.getAll(page,size));
        PageInfo pageInfo = new PageInfo(reserveBiz.getAll(page,size));
        map.put("ps",pageInfo);
        return "reserve_list";
    }

    @RequestMapping("/interface")
    public String interface1(Map<String,Object> map, @RequestParam(defaultValue = "0") int num,@RequestParam(defaultValue = "0") String pid){
        //获取场地列表
        Place reservePlace= placeBiz.get(pid);
        map.put("reservePlace",reservePlace);
        map.put("num",num);
        //获取当前日期，根据传入的参数获取需要查询的目标日期（当前日期+num），获取当前小时数
        Date date = new Date(System.currentTimeMillis() + num * 24 * 60 * 60 * 1000);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf1 = new SimpleDateFormat("HH");
        String hourFormat = sdf1.format(date);
        String dateFormat = sdf.format(date);
        int hour = 6;
        if(num==0){
            hour = Math.max(Integer.parseInt(hourFormat),6);
        }
        map.put("hour",hour);
        //获取目标日期已有,预约情况
        List<Reserve> reserveList = reserveBiz.getByDate(dateFormat,hour,pid);
        System.out.println("----------");
        System.out.println(reserveList);
        System.out.println("----------");
        //创建一个与预约表格数量相等的二维数组，并将数值置为场地预约价格
        if(hour>21){
            map.put("reserveList",null);
        }else {
            int placeNum = reservePlace.getPnumber();
            int[][] reserveView = new int[22-hour][placeNum];
            for (int i = 0; i < reserveView.length; i++) {
                for (int j = 0; j < placeNum; j++) {
                    reserveView[i][j] = Integer.parseInt(reservePlace.getPprice());
                }
            }
            //循环遍历当天的预约信息，并将已预约的数值置为-1,将已有课的数值置为-2
            for (int i = 0; i < placeNum; i++) {
                for (Reserve reserve : reserveList) {
                    if(i+1==reserve.getRnumber()){
                        reserveView[reserve.getRtime()-hour-1][i]=-1;
                    }
                    if(i+1==reserve.getRnumber() && reserve.getRstatus()==4){
                        reserveView[reserve.getRtime()-hour-1][i]=-2;
                    }
                    if(i+1==reserve.getRnumber() && reserve.getRstatus()==2){
                        reserveView[reserve.getRtime()-hour-1][i]=Integer.parseInt(reservePlace.getPprice());
                    }
                }
            }
            //将二维数组传到前端页面生成相应的页面
            map.put("reserveList",reserveView);
        }
        return "reserve_interface";
    }

    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("reserve",new Reserve());
        return "reserve_add";
    }

    @RequestMapping("/add")
    public String add(Reserve reserve){
        reserve.setRmoney(Double.parseDouble(reserve.getPlace().getPprice()));
        if(reserve.getRstatus() == 1){
            reserve.setRmoney(Double.parseDouble(reserve.getPlace().getPprice())*0.9);
        }
        if(reserve.getRstatus() == 2){
            reserve.setRmoney(Double.parseDouble(reserve.getPlace().getPprice())*0.8);
        }
        reserve.setRstatus(0);
        reserveBiz.add(reserve);
        return "redirect:list";
    }

    @RequestMapping("/addNoJump")
    public void addNoJump(Reserve reserve){
        int[] month = new int[]{31,28,31,30,31,30,31,31,30,31,30,31};
        int rYear = Integer.parseInt(reserve.getRdate().substring(0,4));
        int rMonth = Integer.parseInt(reserve.getRdate().substring(5,7));
        int rDay = Integer.parseInt(reserve.getRdate().substring(8,10));
        if((rYear%4==0&&rYear%100!=00)||(rYear%400==0)){
            month[1]++;
        }
        if(rDay>month[rMonth-1]){
            rDay=rDay-month[rMonth-1];
            rMonth++;
            if(rMonth>12){
                rMonth=1;
                rYear++;
            }
        }
        String rdate = rYear +"-"+ rMonth +"-"+ rDay;
        if(rMonth<10){
            rdate = rYear +"-0"+ rMonth +"-"+ rDay;
        }
        if(rDay<10){
            rdate = rYear +"-"+ rMonth +"-0"+ rDay;
        }
        if(rMonth<10&&rDay<10){
            rdate = rYear +"-0"+ rMonth +"-0"+ rDay;
        }
        reserve.setRdate(rdate);
        reserveBiz.add(reserve);
    }

    @RequestMapping(value = "/to_update",params = "rid")
    public String toUpdate(String rid,Map<String,Object> map){
        map.put("reserve",reserveBiz.get(rid));
        return "reserve_update";
    }

    @RequestMapping("/update")
    public String update(Reserve reserve){
        reserveBiz.edit(reserve);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove",params = "rid")
    public String remove(String rid){
        reserveBiz.remove(rid);
        return "redirect:list";
    }

    @RequestMapping(value = "/removeAll",params = "checkId")
    public String removeAll(String[] checkId){
        System.out.println(checkId);
        for(int i=0;i<checkId.length;i++){
            reserveBiz.remove(checkId[i]);
        }
        return "redirect:list";
    }

    @RequestMapping("/listSelf")
    public String listSelf(Map<String,Object> map,String uid){
        List<Reserve> reserveList = reserveBiz.getAllById(uid);
        double sum = 0;
        for (Reserve reserve : reserveList){
            if(reserve.getRstatus() == 3){
                sum+=reserve.getRmoney();
            }
        }
        map.put("list",reserveList);
        map.put("sum",sum);
        return "reserve_listSelf";
    }

    @RequestMapping("/importExcel")
    public String importExcel(Map<String,Object> map, @RequestParam(value="myfile") MultipartFile file, HttpSession session) throws IOException, BiffException {
        Workbook rwb;
        try {
            rwb = Workbook.getWorkbook(file.getInputStream());//将MultipartFile类型转成字节流，强转成（File）会报错
            Sheet rs=rwb.getSheet(0);
            User user = (User) session.getAttribute("user");
            int clos=rs.getColumns();//得到所有的列
            int rows=rs.getRows();//得到所有的行
            for (int i = 1; i < rows; i++) {
                String rdate = rs.getCell(1, i).getContents();
                int rtime = Integer.parseInt(rs.getCell(2, i).getContents());
                int pid = Integer.parseInt(rs.getCell(3, i).getContents());
                int rnumber = Integer.parseInt(rs.getCell(4, i).getContents());
                Reserve reserve = new Reserve();
                reserve.setUid(user.getId());
                reserve.setRdate(rdate);
                reserve.setRtime(rtime);
                reserve.setPid(pid);
                reserve.setRnumber(rnumber);
                reserve.setRstatus(4);
                reserveBiz.add(reserve);
            }
        } catch (BiffException | IOException e) {
            e.printStackTrace();
        }
        return "user_excel";
    }

    @RequestMapping("/payment")
    public String payment(String rid){
        Reserve reserve = reserveBiz.get(rid);
        reserve.setRstatus(1);
        reserveBiz.edit(reserve);
        return "redirect:listSelf?uid="+reserve.getUid();
    }

    @RequestMapping("/cancel")
    public String cancel(String rid){
        Reserve reserve = reserveBiz.get(rid);
        reserve.setRstatus(2);
        reserveBiz.edit(reserve);
        return "redirect:listSelf?uid="+reserve.getUid();
    }

    //将未付款和已付款到期后进行状态转换
    @RequestMapping("/refresh")
    public String refresh(){
        List<Reserve> reserveList = reserveBiz.getReserveList();
        for (Reserve reserve :reserveList){
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH");
            String date2 = sf.format(date);
            int year = Integer.parseInt(date2.substring(0,4));
            int month = Integer.parseInt(date2.substring(5,7));
            int day = Integer.parseInt(date2.substring(8,10));
            int hour = Integer.parseInt(date2.substring(11,13));
            int rYear = Integer.parseInt(reserve.getRdate().substring(0,4));
            int rMonth = Integer.parseInt(reserve.getRdate().substring(5,7));
            int rDay = Integer.parseInt(reserve.getRdate().substring(8,10));
            int rHour = reserve.getRtime();
            if(reserve.getRstatus()==0){
                if(year>rYear){
                    reserve.setRstatus(2);
                    System.out.println("未付款->已取消");
                }else if(year==rYear){
                    if(month>rMonth){
                        reserve.setRstatus(2);
                        System.out.println("未付款->已取消");
                    }else if(month==rMonth){
                        if(day>rDay){
                            reserve.setRstatus(2);
                            System.out.println("未付款->已取消");
                        }else if(day==rDay){
                            if(hour>=rHour){
                                reserve.setRstatus(2);
                                System.out.println("未付款->已取消");
                            }
                        }
                    }
                }
            }else if(reserve.getRstatus()==1){
                if(year>rYear){
                    reserve.setRstatus(3);
                    System.out.println("已付款->已完成");
                }else if(year==rYear){
                    if(month>rMonth){
                        reserve.setRstatus(3);
                        System.out.println("已付款->已完成");
                    }else if(month==rMonth){
                        if(day>rDay){
                            reserve.setRstatus(3);
                            System.out.println("已付款->已完成");
                        }else if(day==rDay){
                            if(hour>=rHour){
                                reserve.setRstatus(3);
                                System.out.println("已付款->已完成");
                            }
                        }
                    }
                }
            }
            reserveBiz.edit(reserve);
        }
        return "redirect:list";
    }

}

package com.hl.prms.biz.impl;

import com.github.pagehelper.PageHelper;
import com.hl.prms.biz.ReserveBiz;
import com.hl.prms.dao.ReserveDao;
import com.hl.prms.entity.Reserve;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("reserveBiz")
public class ReserveBizImpl implements ReserveBiz
{
    @Resource(name = "reserveDao")
    private ReserveDao reserveDao;

    public void add(Reserve reserve) {
        reserve.setCreateTime(new Date());
        reserve.setLastEditTime(new Date());
        reserveDao.insert(reserve);
    }

    public void edit(Reserve reserve) {
        reserve.setLastEditTime(new Date());
        reserveDao.update(reserve);
    }

    public void remove(String rid) {
        reserveDao.delete(rid);
    }

    public Reserve get(String rid) {
        return reserveDao.select(rid);
    }

    public List<Reserve> getAll(int page,int size) {
        PageHelper.startPage(page,size);
        return reserveDao.selectAll();
    }

    public List<Reserve> getAllById(String uid) {
        return reserveDao.selectById(uid);
    }

    public List<Reserve> getReserveList() {
        return reserveDao.selectAll();
    }

    public List<Reserve> getByDate(String rdate,int hour,String pid) {
        return reserveDao.selectByDate(rdate,hour,pid);
    }
}

package com.hl.prms.biz.impl;

import com.github.pagehelper.PageHelper;
import com.hl.prms.biz.PlaceBiz;
import com.hl.prms.dao.PlaceDao;
import com.hl.prms.entity.Place;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("placeBiz")
public class PlaceBizImpl implements PlaceBiz {

    @Resource(name = "placeDao")
    private PlaceDao placeDao;

    public void add(Place place) {
        place.setCreateTime(new Date());
        place.setLastEditTime(new Date());
        placeDao.insert(place);
    }

    public void edit(Place place) {
        place.setLastEditTime(new Date());
        placeDao.update(place);
    }

    public void remove(String pid) {
        placeDao.delete(pid);
    }

    public Place get(String pid) {
        return placeDao.select(pid);
    }

    public List<Place> getAll(int page,int size) {
        PageHelper.startPage(page,size);
        return placeDao.selectAll();
    }

    public List<Place> getAllUsable() {
        return placeDao.selectAllUsable();
    }

    public List<Place> getList() {
        return placeDao.selectAll();
    }
}

package com.hl.prms.biz;

import com.hl.prms.entity.Place;
import com.hl.prms.entity.Reserve;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ReserveBiz {
    void add(Reserve reserve);
    void edit(Reserve reserve);
    void remove(String rid);
    Reserve get(String rid);
    List<Reserve> getAll(int page,int size);
    List<Reserve> getAllById(String uid);
    List<Reserve> getReserveList();
    List<Reserve> getByDate(String rdate,int hour,String pid);
}

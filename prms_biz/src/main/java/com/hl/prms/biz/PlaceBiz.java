package com.hl.prms.biz;

import com.hl.prms.entity.Place;

import java.util.List;

public interface PlaceBiz {
    void add(Place place);
    void edit(Place place);
    void remove(String pid);
    Place get(String pid);
    List<Place> getAll(int page,int size);
    List<Place> getAllUsable();
    List<Place> getList();
}

package com.hl.prms.dao;

import com.hl.prms.entity.Place;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("placeDao")
public interface PlaceDao {
    void insert(Place place);
    void update(Place place);
    void delete(String pid);
    Place select(String pid);
    List<Place> selectAll();
    List<Place> selectAllUsable();
}

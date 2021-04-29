package com.hl.prms.dao;

import com.hl.prms.entity.Reserve;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("reserveDao")
public interface ReserveDao {
    void insert(Reserve reserve);
    void update(Reserve reserve);
    void delete(String rid);
    Reserve select(String rid);
    List<Reserve> selectAll();
    List<Reserve> selectById(String uid);
    List<Reserve> selectByDate(@Param("rdate")String rdate, @Param("rtime")int hour,@Param("pid")String pid);
}

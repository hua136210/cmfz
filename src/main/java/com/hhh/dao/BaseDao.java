package com.hhh.dao;

import com.hhh.entity.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    void insert(T t);
    void update(T t);
    void delete(String id);
    T queryOne(String id);
    List<Album> queryChapter(String id);
    List<T> queryAll();
    List <T> queryByPage(@Param("start") Integer start,@Param("rows") Integer rows);
    Long queryTotals();
}

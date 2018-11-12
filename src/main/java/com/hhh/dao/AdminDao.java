package com.hhh.dao;

import com.hhh.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao extends BaseDao<Admin>{
    public Admin queryAll(@Param("name") String name, @Param("password") String password);

}

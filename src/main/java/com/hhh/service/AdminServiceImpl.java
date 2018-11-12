package com.hhh.service;

import com.hhh.dao.AdminDao;
import com.hhh.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDao adminDao;
    @Override
    public Admin logon(String name, String password) {
       Admin admin= adminDao.queryAll(name,password);
       if(admin!=null){
           return admin;
       }else {
           return null;
       }
    }

    @Override
    public void motifyPwd(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public Admin findOneById(String id) {
        return adminDao.queryOne(id);
    }
}

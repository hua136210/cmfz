package com.hhh.service;

import com.hhh.entity.Admin;

public interface AdminService {
    public Admin logon(String name,String password);
    public void motifyPwd(Admin admin);
    public Admin findOneById(String id);
}

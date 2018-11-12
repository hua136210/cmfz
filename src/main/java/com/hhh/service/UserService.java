package com.hhh.service;

import com.hhh.entity.User;

import java.util.List;

public interface UserService {
    List<User> findByPageUser(Integer page,Integer rows);
    long findTotals();
    void register(User user);
    void removeUser(String id);
}

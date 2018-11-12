package com.hhh.controller;

import com.hhh.entity.User;
import com.hhh.service.UserService;
import com.hhh.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("findAllUser")
    public @ResponseBody Map<String,Object> findUser(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<>();
        List<User> byPageUser = userService.findByPageUser(page, rows);
        long totals = userService.findTotals();
        results.put("total",totals);
        results.put("rows",byPageUser);
        return results;
    }

    @RequestMapping("regist")
    public String regist(User user){

        String mdPassword = MD5Util.getMd5(user.getPassword());
        user.setPassword(mdPassword);
        userService.register(user);

        return "index";
    }
   @RequestMapping("deleteUser")
    public @ResponseBody Map<String,Object> deleteUser(String id){
        Map<String,Object> results=new HashMap<>();
        try {
            userService.removeUser(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
}

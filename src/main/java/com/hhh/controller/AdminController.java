package com.hhh.controller;

import com.hhh.entity.Admin;
import com.hhh.service.AdminService;
import com.sun.org.apache.bcel.internal.classfile.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("login")
    public String login(String name,String password, HttpServletRequest request){
        Admin admin=adminService.logon(name,password);
        HttpSession session = request.getSession();
        session.setAttribute("admin",admin);
        String code = request.getParameter("code");
        //code.equalsIgnoreCase(session.getAttribute("code").toString())
        if(code.equalsIgnoreCase(session.getAttribute("code").toString())){
            if(admin!=null){
                return "redirect:/back/main/main.jsp";
            }else{
                return "redirect:/back/admin/login.jsp";
            }
        }else {
            return "redirect:/back/admin/login.jsp";
        }

    }
    @RequestMapping("updatePwd")
    public @ResponseBody  Map<String,Object> updatePwd(Admin admin){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            adminService.motifyPwd(admin);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("findOne")
    public @ResponseBody Admin findOne(String id){
        Admin admin = adminService.findOneById(id);

        return admin;
    }
    @RequestMapping("exitLogin")
    public String ExitLogin(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/back/admin/login.jsp";
    }
}

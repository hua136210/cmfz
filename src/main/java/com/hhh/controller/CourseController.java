package com.hhh.controller;

import com.hhh.entity.Course;
import com.hhh.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("findAllCourse")
    public @ResponseBody Map<String,Object> findAllCourse(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<>();
        List<Course> byPageCourse = courseService.findByPageCourse(page, rows);
        long totals = courseService.findTotals();
        results.put("total",totals);
        results.put("rows",byPageCourse);
        return results;
    }
    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> delete(String id){
        Map<String,Object> results=new HashMap<>();
        try {
            courseService.delete(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("update")
    public @ResponseBody Map<String,Object> update(Course course){
        Map<String,Object> results=new HashMap<>();
        try {
            course.setCreatTime(new Date());
            courseService.update(course);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("findOne")
    public @ResponseBody Map<String,Object> findOne(String id){
        Map<String,Object> results=new HashMap<>();
        try {
            courseService.findOne(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
}

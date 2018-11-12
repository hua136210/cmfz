package com.hhh.service;

import com.hhh.entity.Course;

import java.util.List;

public interface CourseService {
    List<Course> findByPageCourse(Integer page,Integer rows);
    long findTotals();
    void update(Course course);
    void delete(String id);
    Course findOne(String id);
}

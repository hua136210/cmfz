package com.hhh.service;

import com.hhh.dao.CourseDao;
import com.hhh.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CourseServiceImpl implements CourseService{
    @Autowired
    private CourseDao courseDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findByPageCourse(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return courseDao.queryByPage(start,rows);
    }

    @Override
    public long findTotals() {
        return courseDao.queryTotals();
    }

    @Override
    public void update(Course course) {
        courseDao.update(course);
    }

    @Override
    public void delete(String id) {
        courseDao.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Course findOne(String id) {
        return courseDao.queryOne(id);
    }
}

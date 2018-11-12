package com.hhh.service;

import com.hhh.dao.UserDao;
import com.hhh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> findByPageUser(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return userDao.queryByPage(start,rows);
    }

    @Override
    public long findTotals() {
        return userDao.queryTotals();
    }

    @Override
    public void register(User user) {
        user.setId(UUID.randomUUID().toString());
        System.out.println("------------------ssss");
        userDao.insert(user);
    }

    @Override
    public void removeUser(String id) {
        userDao.delete(id);
    }
}

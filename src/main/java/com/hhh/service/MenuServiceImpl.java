package com.hhh.service;

import com.hhh.dao.MenuDao;
import com.hhh.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class MenuServiceImpl implements MenuService{
    @Autowired
    private MenuDao menuDao;
    @Override
    public List<Menu> findAll() {
        return menuDao.queryAll();
    }
}

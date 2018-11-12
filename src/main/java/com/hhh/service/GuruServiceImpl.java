package com.hhh.service;

import com.hhh.dao.GuruDao;
import com.hhh.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService{
    @Autowired
    private GuruDao guruDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findGuruByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return guruDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public long findGuruTotals() {
        return guruDao.queryTotals();
    }

    @Override
    public void addGuru(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);
    }

    @Override
    public void removeGuru(String id) {
        guruDao.delete(id);
    }

    @Override
    public void motifyGuru(Guru guru) {
        guruDao.update(guru);
    }


}

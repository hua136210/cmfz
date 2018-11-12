package com.hhh.service;

import com.hhh.dao.BannerDao;
import com.hhh.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService{
    @Autowired
    private BannerDao bannerDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findByPage(Integer page, Integer rows) {
        int start = (page - 1) * rows;
        return bannerDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return bannerDao.queryTotals();
    }

    @Override
    public void removeB(String id) {
        bannerDao.delete(id);
    }

    @Override
    public void motifyB(Banner banner) {
        bannerDao.update(banner);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Banner findOneBanner(String id) {

        return bannerDao.queryOne(id);
    }

    @Override
    public void addBanner(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        bannerDao.insert(banner);
    }

}

package com.hhh.service;

import com.hhh.entity.Banner;

import java.util.List;

public interface BannerService {
    List<Banner> findByPage(Integer page,Integer rows);
    Long findTotals();
    void removeB(String id);
    void motifyB(Banner banner);
    Banner findOneBanner(String id);
    void addBanner(Banner banner);
}

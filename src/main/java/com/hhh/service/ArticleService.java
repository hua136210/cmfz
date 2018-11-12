package com.hhh.service;

import com.hhh.entity.Article;

import java.util.List;

public interface ArticleService {
    List<Article> findByPageArticle(Integer page,Integer rows);
    long findTotals();
    void removeArtcle(String id);
}

package com.hhh.service;

import com.hhh.dao.ArticleDao;
import com.hhh.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleDao articleDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Article> findByPageArticle(Integer page, Integer rows) {
        int start=(page-1)*rows;

        return articleDao.queryByPage(start,rows);
    }

    @Override
    public long findTotals() {
        return articleDao.queryTotals();
    }

    @Override
    public void removeArtcle(String id) {
        articleDao.delete(id);
    }
}

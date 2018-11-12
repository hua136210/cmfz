package com.hhh.controller;

import com.hhh.entity.Article;
import com.hhh.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @RequestMapping("findAllArticle")
    public @ResponseBody Map<String,Object> findAllArticle(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<>();
        List<Article> byPageArticle = articleService.findByPageArticle(page, rows);
        long totals = articleService.findTotals();
        results.put("totals",totals);
        results.put("rows",byPageArticle);
        return results;
    }
    @RequestMapping("deleteArticle")
    public @ResponseBody Map<String,Object> deleteArticle(String id){
        Map<String,Object> results=new HashMap<>();
        try {
            articleService.removeArtcle(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
}

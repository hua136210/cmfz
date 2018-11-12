package com.hhh.test;

import com.hhh.dao.ChapterDao;
import com.hhh.entity.*;
import com.hhh.service.AdminService;
import com.hhh.service.AlbumService;
import com.hhh.service.BannerService;
import com.hhh.service.MenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestService {
    @Autowired
    private AdminService adminService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private BannerService bannerService;
    @Autowired
    private AlbumService albumService;
   @Autowired
    private ChapterDao chapterDao;
    @Test
    public void testlogin(){
      Admin admin= adminService.logon("zhangsan","123456");
        System.out.println(admin);
    }

    @Test
    public void testMenu(){
        List<Menu> menu = menuService.findAll();
        for(Menu me:menu){
            System.out.println(me);
        }
    }

    @Test
    public void testBanner(){
        List<Banner> byPage = bannerService.findByPage(1, 3);
        for (Banner banner : byPage) {
            System.out.println(banner);
        }
        Long totals = bannerService.findTotals();
        System.out.println(totals);

    }
    @Test
    public void test06(){
        List<Album> allAlbum = albumService.findAllAlbum();
        for (Album album : allAlbum) {
            System.out.println(album);
        }
        }
    @Test
    public void testChapter(){
        List<Album> chapters = chapterDao.queryChapter("1");
        for (Album chapter : chapters) {
            System.out.println(chapter);
        }
    }
}

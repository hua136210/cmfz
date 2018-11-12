package com.hhh.controller;

import com.hhh.entity.Banner;
import com.hhh.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<String,Object>();
        //当前页数据rows
        List<Banner> banners=bannerService.findByPage(page,rows);
        //总记录数
        Long totals = bannerService.findTotals();
        results.put("total",totals);
        results.put("rows",banners);
        return results;
    }
    //删除
    @RequestMapping("delete")
    public@ResponseBody Map<String,Object> delete(String id){
        Map<String,Object> results=new HashMap<String, Object>();
       try {
            bannerService.removeB(id);
            results.put("success",true);
       }catch (Exception e){
            e.printStackTrace();
            results.put("results",false);
            results.put("message",e.getMessage());
       }
       return results;
    }
    //修改
    @RequestMapping("updateBanner")
    public @ResponseBody Map<String,Object> update(Banner banner, MultipartFile file, HttpServletRequest request){
        Map<String,Object> results=new HashMap<>();
        try {

            String realPath=request.getSession().getServletContext().getRealPath("/back/banner/Bimg");

            String fileName = file.getOriginalFilename();
            banner.setCretime(new Date());
            banner.setImgPath("/back/banner/Bimg/"+fileName);
            bannerService.motifyB(banner);
            file.transferTo(new File(realPath,fileName));
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    //查找一个
    @RequestMapping("findOneBanner")
    public @ResponseBody Banner findOneBanner(String id){
        Banner oneBanner = bannerService.findOneBanner(id);
        return oneBanner;
    }
    //添加
    @RequestMapping("addBanner")
    public @ResponseBody Map<String,Object> insert(Banner banner, MultipartFile file, HttpServletRequest request){
        Map<String,Object> results=new HashMap<String,Object>();
        String realPath=request.getSession().getServletContext().getRealPath("/back/banner/Bimg");
        System.out.println(realPath);
        String fileName = file.getOriginalFilename();
        try {

            if(file!=null) {
                banner.setCretime(new Date());
                banner.setImgPath("back/banner/Bimg/"+fileName);
                bannerService.addBanner(banner);
                file.transferTo(new File(realPath, fileName));
                results.put("success", true);
            }else{
                results.put("success",false);
                results.put("message","上传的图片不能为空");
            }

        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    //批量删除
    @RequestMapping("deleteRowsBanner")
    public @ResponseBody Map<String,Object> deleteRowsBanner(String[] id){
        Map<String,Object> results=new HashMap<String,Object>();
        try {
            for (String s:id){
                bannerService.removeB(s);
            }
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
}

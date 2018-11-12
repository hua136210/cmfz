package com.hhh.controller;

import com.hhh.entity.Guru;
import com.hhh.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("guru")
public class GuruController {
    @Autowired
    private GuruService guruService;
    @RequestMapping("findAllGuru")
    public @ResponseBody Map<String,Object> findAllGuru(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<String, Object>();

        List<Guru> guruByPage = guruService.findGuruByPage(page, rows);
        long guruTotals = guruService.findGuruTotals();
        results.put("total",guruTotals);
        results.put("rows",guruByPage);
        return results;
    }
    @RequestMapping("insertGuru")
    public @ResponseBody Map<String,Object> addGuru(Guru guru, MultipartFile file, HttpServletRequest request){
        Map<String,Object> results=new HashMap<String, Object>();
        String realPath = request.getSession().getServletContext().getRealPath("/back/guru/Gimg");
        String fileName = file.getOriginalFilename();
        try {
            if (file!=null) {
                guru.setHeadPic("/back/guru/Gimg/" + fileName);
                guruService.addGuru(guru);
                file.transferTo(new File(realPath, fileName));
                results.put("success", true);
            }else {
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
    @RequestMapping("deleteGuru")
    public @ResponseBody Map<String,Object> delete(String id){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            guruService.removeGuru(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("updateGuru")
    public @ResponseBody Map<String,Object> update(Guru guru){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            guruService.motifyGuru(guru);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
}

package com.hhh.controller;

import com.hhh.entity.Album;
import com.hhh.service.AlbumService;
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
@RequestMapping("album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    @RequestMapping("showAllAlbum")
    public @ResponseBody List<Album> findAllAlbum(){
        List<Album> allAlbum = albumService.findAllAlbum();

        return allAlbum;
}
    @RequestMapping("insertAlbum")
    public @ResponseBody Map<String,Object> insertAlbum(Album album, MultipartFile file, HttpServletRequest request){
        Map<String,Object> results=new HashMap<String, Object>();
        String realPath = request.getSession().getServletContext().getRealPath("/back/album/Aimg");
        String fileName = file.getOriginalFilename();
        try {
            if(file!=null) {
                album.setCoverImg("back/album/Aimg/"+fileName);
                album.setPublishDate(new Date());
                albumService.addAlbum(album);
                file.transferTo(new File(realPath,fileName));
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
}

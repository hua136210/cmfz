package com.hhh.controller;

import com.hhh.entity.Album;
import com.hhh.entity.Chapter;
import com.hhh.service.ChapterService;
import org.apache.commons.io.FileUtils;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.exceptions.CannotReadException;
import org.jaudiotagger.audio.exceptions.InvalidAudioFrameException;
import org.jaudiotagger.audio.exceptions.ReadOnlyFileException;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.TagException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;
    @RequestMapping("insertChapter")
    public @ResponseBody Map<String,Object> insertChapter(Chapter chapter, MultipartFile file, HttpServletRequest request){
        Map<String,Object> results=new HashMap<String, Object>();
        String realPath = request.getSession().getServletContext().getRealPath("/back/album/chapter");
        String fileName = file.getOriginalFilename();
        try {
            if (file!=null){
                chapter.setDownPath("/back/album/chapter/"+fileName);
                chapter.setUploadTime(new Date());
                chapter.setTitle(fileName);
                chapter.setSize(file.getSize()/1024/1024+"");
                chapter.setAlbum_id(chapter.getAlbum_id());
                file.transferTo(new File(realPath,fileName));
                realPath+="/"+file.getOriginalFilename();
                int length = getAudioLength(realPath);
                chapter.setDuration(length+"");
               // "D:\\ChiMingFaZhou\\cmfz\\src\\main\\webapp\\back\\album\\chapter\\"

                chapterService.addChapter(chapter);
                results.put("success", true);


            } else {
                results.put("success", false);
                results.put("message", "上传的内容不能为空");
            }
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    /*获取音频时长方法*/
    public static int getAudioLength(String audioPath) throws TagException, ReadOnlyFileException, CannotReadException, InvalidAudioFrameException, IOException {
        //读取要解析的问文件
        File file=new File(audioPath);
        int s=0;
        MP3File f = (MP3File)AudioFileIO.read(file);
        MP3AudioHeader audioHeader = (MP3AudioHeader)f.getAudioHeader();
        s =audioHeader.getTrackLength();
        return s;
    }
    @RequestMapping("findOneChapter")
    public @ResponseBody List<Album> findOneChapter(String id){
        List<Album> oneChapter = chapterService.findOneChapter(id);
        return oneChapter;
    }
    @RequestMapping("download")
    public @ResponseBody void DownLoad(String title, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println(title);
        String realPath = request.getSession().getServletContext().getRealPath("back/album/chapter");
        byte[] bs=FileUtils.readFileToByteArray(new File(realPath+"/"+title));
        //设置响应头
        response.setHeader("content-disposition","attachment;filename"+URLEncoder.encode(title,"UTF-8"));
        response.setContentType("audio/mpeg");
        //获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //使用IOUtils工具类向外打印
        os.write(bs);
        if (os!=null){ os.flush(); }
        if (os!=null){ os.close(); }
    }
}

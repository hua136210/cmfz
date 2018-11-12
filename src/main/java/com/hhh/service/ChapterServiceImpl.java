package com.hhh.service;

import com.hhh.dao.ChapterDao;
import com.hhh.entity.Album;
import com.hhh.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService{
    @Autowired
    private ChapterDao chapterDao;
    @Override
    public void addChapter(Chapter chapter) {
        chapter.setCid(UUID.randomUUID().toString());
        System.out.println(chapter);
        chapterDao.insert(chapter);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findOneChapter(String id) {

        return  chapterDao.queryChapter(id);
    }
}

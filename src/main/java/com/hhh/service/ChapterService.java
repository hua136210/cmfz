package com.hhh.service;

import com.hhh.entity.Album;
import com.hhh.entity.Chapter;

import java.util.List;

public interface ChapterService {
    void addChapter(Chapter chapter);
    List<Album> findOneChapter(String id);

}

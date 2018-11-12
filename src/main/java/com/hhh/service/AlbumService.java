package com.hhh.service;

import com.hhh.entity.Album;

import java.util.List;

public interface AlbumService {
    List<Album> findAllAlbum();
    void addAlbum(Album album);
}

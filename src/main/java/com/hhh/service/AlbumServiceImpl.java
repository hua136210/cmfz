package com.hhh.service;

import com.hhh.dao.AlbumDao;
import com.hhh.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService{
    @Autowired
    private AlbumDao albumDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAllAlbum() {
        List<Album> albums = albumDao.queryAll();
        return albums;
    }

    @Override
    public void addAlbum(Album album) {
        album.setId(UUID.randomUUID().toString());

        albumDao.insert(album);
    }
}

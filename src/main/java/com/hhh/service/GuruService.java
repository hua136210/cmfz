package com.hhh.service;

import com.hhh.entity.Guru;

import java.util.List;

public interface GuruService {
    List<Guru> findGuruByPage(Integer page,Integer rows);
    long findGuruTotals();
    void addGuru(Guru guru);
    void removeGuru(String id);
    void motifyGuru(Guru guru);
}

package com.example.demo.dao;

import com.example.demo.db.DBManager;
import com.example.demo.vo.EasyToStartVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EasyToStartDAO {

    //게시글 목록 불러오기
    public List<EasyToStartVO> getEasyToStartAll() {
        return DBManager.getEasyToStartAll();
    }
    //게시글 목록 불러오기
}
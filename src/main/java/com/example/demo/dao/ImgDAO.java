package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ImgVO;
@Repository
public class ImgDAO {
	
	//파일등록
	public int uploadFile(HashMap map) {
		return DBManager.uploadFile(map);
	}
	
}

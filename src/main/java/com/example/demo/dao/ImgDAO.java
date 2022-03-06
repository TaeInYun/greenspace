package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ImgVO;
@Repository
public class ImgDAO {
	
	//파일등록
	public int uploadFile(HashMap map) {
		return DBManager.uploadFile(map);
	}
	
	//커뮤니티 게시판이미지 리스트
	public List<ImgVO> listCommuImg(int no){
		return DBManager.listCommuImg(no);		
	}
	
	//커뮤니티 이미지 삭제
	public int deleteCommuImg(int no) {
		return DBManager.deleteCommuImg(no);
	}
}

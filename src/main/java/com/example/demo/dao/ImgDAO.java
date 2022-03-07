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

	// 이미지 레코드 삭제
	public int delete(int no) {
		return DBManager.deleteImg(no);
	}
	
	//이미지 정보
	public ImgVO findImgByNo(int no) {
		return DBManager.findImgByNo(no);
	}
	
	//커뮤니티 게시판이미지 리스트
	public List<ImgVO> listCommuImg(int no){
		return DBManager.listCommuImg(no);		
	}
	
	//인증 게시판이미지 리스트
	public List<ImgVO> listCerImg(int no){
		return DBManager.listCerImg(no);		
	}
	
	
}

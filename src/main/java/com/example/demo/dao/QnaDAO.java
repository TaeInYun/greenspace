package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProductVO;
import com.example.demo.vo.QnaVO;

@Repository
public class QnaDAO {

	public static int pageSIZE = 5;  
	public static int totalRecord;	 
	public static int totalPage;
	
	public List<QnaVO> findAll(HashMap map){
		totalRecord = DBManager.getTotalRecordQna(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findAllQna(map);
	}
	
	public List<QnaVO> findAllList(){
		return DBManager.findAllQnaList();
	}
	
	public QnaVO findAllDetail(int no) {
		return DBManager.findAllQnaDetail(no);
	}
		
	
	public List<QnaVO> findAllSearch(HashMap map){
		totalRecord = DBManager.getTotalRecordQna(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findAllQnaSearch(map);
	}
}

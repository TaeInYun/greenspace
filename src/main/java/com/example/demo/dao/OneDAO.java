package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.OneVO;
import com.example.demo.vo.ProQnaVO;
import com.example.demo.vo.QnaVO;

@Repository
public class OneDAO {

	public static int pageSIZE = 5;  
	public static int totalRecord;	 
	public static int totalPage;
	
	public List<OneVO> findAll(HashMap map){
		totalRecord = DBManager.getTotalRecordOne(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findAllOne(map);
	}
	
		//1대1리뷰 - 마이페이지
	public List<OneVO> findAllMy(HashMap map){
		return DBManager.findAllOneMy(map);
	}
	
	public OneVO findAllDetail(int no) {
		return DBManager.findAllOneDetail(no);
	}
		
	
	public List<OneVO> findAllSearch(HashMap map){
		totalRecord = DBManager.getTotalRecordOne(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findAllOneSearch(map);
	}
	
	public int insert(OneVO p) {
		return DBManager.insertOne(p);
	}
	
	public int update(OneVO p) {
		return DBManager.updateOne(p);
	}
	
	public int delete(int no) {
		return DBManager.deleteOne(no);
	}
	
	
}

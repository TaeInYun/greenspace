package com.example.demo.dao;

 
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
 
import com.example.demo.vo.ProductVO;

@Repository
public class ProductDAO {	 
	
	public static int pageSIZE = 5;  
	public static int totalRecord;	 
	public static int totalPage;	 
	
	//관리자 상품 리스트
	public List<ProductVO> findAll(HashMap map){		
		totalRecord = DBManager.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findAll(map);	
	}	
	
	public List<ProductVO> findAll_home(HashMap map){
		return DBManager.findAll_home(map);	
	}
	 
	public ProductVO findByNo(int no) {
		return DBManager.findByNo(no);
	}
	
	public int update(ProductVO b) {
		return DBManager.update(b);
	}

	public int delete(int no) {
		// TODO Auto-generated method stub
		return DBManager.delete(no);
	}	
	
	public void updateHit(int no) {
		DBManager.updateReviewHit(no);
	}
	
	public int insert(ProductVO p) {
		return DBManager.insert(p);
	}
 	
	public List<ProductVO> findOption(int no){
		return DBManager.findOption(no);	
	}
	
	public int findOptionView(int no) {
		return DBManager.findOptionView(no);
	}
  
	public List<ProductVO> findOptionName(int no){
		return DBManager.findOptionName(no);	
	}
 
 	public List<ProductVO> findOptionDetailName(HashMap map){
		return DBManager.findOptionDetailName(map);	
	}
  
	public List<ProductVO> findDBOption(){
		return DBManager.findDBOption();	
	}
	
	public List<ProductVO> findDBDetailOption(String pro_option_code){
		return DBManager.findDBDetailOption(pro_option_code);	
	}
	 
}

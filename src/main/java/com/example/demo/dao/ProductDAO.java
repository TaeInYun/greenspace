package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProductVO;

@Repository
public class ProductDAO {	 
	
	public List<ProductVO> findAll(){
		return DBManager.findAll();	
	}	 
	 
	public ProductVO findByNo(int no) {
		return DBManager.findByNo(no);
	}
	
	public int update(ProductVO b) {
		return DBManager.update(b);
	}

	public int delete() {
		// TODO Auto-generated method stub
		return DBManager.delete();
	}
	
	public void updateHit(int no) {
		DBManager.updateHit(no);
	}
}

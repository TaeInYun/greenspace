package com.example.demo.dao;
 
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.Pro_add_optionVO;
 

@Repository
public class Pro_add_optionDAO {
	public int insert(Pro_add_optionVO po) {
		return DBManager.insertPro_add_option(po);
	}
	
	public int delete(HashMap map) {
		return DBManager.deletePro_add_option(map);
	}	
	
	public List<Pro_add_optionVO> findOptionByProNo(int no) {
		return DBManager.findOptionByProNo(no);
	}
	
	public int findProAddPriceNo(int no) {
		return DBManager.findProAddPriceNo(no);
	}
	public int findProAddOptionNoForWishList(HashMap map) {
		return DBManager.findProAddOptionNoForWishList(map);
	}
	
}

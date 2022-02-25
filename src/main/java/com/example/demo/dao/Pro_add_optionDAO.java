package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.Pro_add_optionVO;
 

@Repository
public class Pro_add_optionDAO {
	public int insert(Pro_add_optionVO po) {
		return DBManager.insertPro_add_option(po);
	}
	
	public int delete(int no) {
		return DBManager.deletePro_add_option(no);
	}
	
	
	public List<Pro_add_optionVO> findOptionByNo(int no) {
		return DBManager.findOptionByNo(no);
	}
	
	
	
	
}

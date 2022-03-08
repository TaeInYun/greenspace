package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.PointVO;
 
@Repository
public class PointDAO {
	
	public int insertPoint(PointVO p) {
		return DBManager.insertPoint(p);
	}
	
	public int updateCerPoint(HashMap map) {
		return DBManager.updateCerPoint(map);
	}	
	
	public PointVO findPresentPoint(int no) {
		return DBManager.findPresentPoint(no);
	}
	
	public List<PointVO> findAllPointByNO(HashMap map){
		return DBManager.findAllPointByNO(map);
	}
	
	 
	
	
}

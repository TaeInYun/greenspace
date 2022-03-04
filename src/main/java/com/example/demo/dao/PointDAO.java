package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.PointVO;

@Repository
public class PointDAO {
	
	public int insertPoint(PointVO p) {
		return DBManager.insertPoint(p);
	}
}

package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProQnaVO;

@Repository
public class ProQnaDAO {

	public int insert(ProQnaVO p) {
		return DBManager.insertProQna(p);
	}
	
	public int update(ProQnaVO p) {
		return DBManager.updateProQna(p);
	}
	
	public int delete(int no) {
		return DBManager.deleteProQna(no);
	}
}

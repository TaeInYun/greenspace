package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MyWishVO;

@Repository
public class MyWishDAO {
	
	public List<MyWishVO> findByMember(){
		return DBManager.findByMember();
	}
}

package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CartVO;

@Repository
public class CartDAO {
	
	public int insert(CartVO c) {
		return DBManager.insertCart(c);
	}
}

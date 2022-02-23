package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CartVO;

@Repository
public class CartDAO {
	
	public int insert(CartVO c) {
		return DBManager.insertCart(c);
	}

	public int delete(int no) {
		return DBManager.deleteCart(no);
	}

	public int isCart(HashMap map) {
		return DBManager.isCart(map);
	}
	
	public int updateQty(HashMap map) {
		return DBManager.updateQty(map);
	}
}

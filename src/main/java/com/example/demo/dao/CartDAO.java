package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

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

	public int isCart(CartVO c) {
		return DBManager.isCart(c);
	}
	
	public int updateQty(CartVO c) {
		return DBManager.updateQty(c);
	}
	
	public CartVO findByCartNo(HashMap map) {
		return DBManager.findByCartNo(map);
	}
}
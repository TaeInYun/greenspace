package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.OrdersProductVO;

@Repository
public class OrdersProductDAO {
	
	public int insertOrderProduct(HashMap map) {
		return DBManager.insertOrdersProduct(map);
	}
}

package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.OrderListVO;

@Repository
public class OrderListDAO {

	public OrderListVO LoginByOrderId(String name,String ord_id) {
		return DBManager.LoginByOrderId(name,ord_id);
	}
}

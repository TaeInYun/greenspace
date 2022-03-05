package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AddressVO;
import com.example.demo.vo.ReceiverVO;

@Repository
public class ReceiverDAO {
	
	public AddressVO findByNo(int receiver_no) {
		return DBManager.findByReceiverNo(receiver_no);
	}
}

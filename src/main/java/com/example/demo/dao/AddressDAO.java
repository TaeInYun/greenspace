package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AddressVO;

@Repository
public class AddressDAO {
	
	public AddressVO getMainAddress(int member_no) {
		return DBManager.getMainAddress(member_no);
	}
}

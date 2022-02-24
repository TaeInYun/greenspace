package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AddressVO;

@Repository
public class AddressDAO {
		
	public AddressVO getMainAddress(int member_no) {
		return DBManager.getMainAddress(member_no);
	}
	
	public AddressVO allMainAddress(int member_no) {
		return DBManager.allMainAddress(member_no);
	}
	
	public AddressVO allSubAddress(int member_no) {
		return DBManager.allSubAddress(member_no);
	}
}

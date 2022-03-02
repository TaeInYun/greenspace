package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AddressVO;


@Repository
public class AddressDAO {
	
	public AddressVO getMainAddress(int member_no) {
		return DBManager.getMainAddress(member_no);
	}
	
	//전체주소 불러오기 (관리자) 
	public List<AddressVO> FindAll() {
		return DBManager.findAllAddress();
	}
	
	public AddressVO findAllDetail(int no) {
		return DBManager.findAllAddressDetail(no);
	}
	
	//메인주소출력 one
	public AddressVO allMainAddress(int member_no) {
		return DBManager.allMainAddress(member_no);
	}
	//메인주소출력 list
	public List<AddressVO> allSubAddress(int member_no) {
		return DBManager.allSubAddress(member_no);
	}
	
	public int insert(AddressVO a) {
		return DBManager.insertAddress(a);
	}
	
	public int update(AddressVO a) {
		return DBManager.updateAddress(a);
	}
	
	public int delete(int no) {
		return DBManager.deleteAddress(no);
	}
	
}

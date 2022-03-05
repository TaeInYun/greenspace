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

	//메인배송지로 변경
	public int updateMainBtn(int no) {
		return DBManager.updateMainBtnAddress(no);
	}
	
	//서브배송지로 변경
	public int updateSubBtn(AddressVO a) {
		return DBManager.updateSubBtnAddress(a);
	}
	
	//메인베송지로 변경하면 나머지 서브로 	
	public void updateBtn(int member_no) {
		 DBManager.updateBtnAddress(member_no);
	}
	
	public int delete(int no) {
		return DBManager.deleteAddress(no);
	}
	
}

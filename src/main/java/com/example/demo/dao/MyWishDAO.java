package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MyWishVO;

@Repository
public class MyWishDAO {
	
	public List<MyWishVO> findByMember(int member_no){
		return DBManager.findByMember(member_no);
	}
	
	public MyWishVO getProInfoForOrder(HashMap map){
		return DBManager.getProInfoForOrder(map);
	}

	public int cntOfCart(int member_no){
		return DBManager.cntOfCart(member_no);
	}

}

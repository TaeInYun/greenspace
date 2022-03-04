package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.WishListVO;

@Repository
public class WishListDAO {
	
	public List<WishListVO> findByMemberWish(int member_no){
		return DBManager.findByMemberWish(member_no);
	}
	
	public int cntOfWishList(int member_no) {
		return DBManager.cntOfWishList(member_no);
	}
	
	public int deleteWishList(int no) {
		return DBManager.deleteWishList(no);
	}

	public int insert(WishListVO w) {
		return DBManager.insertWishList(w);
	}
	
	public int isWishList(WishListVO w) {
		return DBManager.isWishList(w);
	}
}

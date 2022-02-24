package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.Pro_add_optionVO;
 

@Repository
public class Pro_add_optionDAO {
	public int insert(Pro_add_optionVO po) {
		return DBManager.insertPro_add_option(po);
	}
}

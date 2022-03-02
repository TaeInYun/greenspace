package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.QnaVO;

@Repository
public class QnaDAO {

	public List<QnaVO> findAll(int qnaColumn){
		return DBManager.findAllQna(qnaColumn);
	}
}

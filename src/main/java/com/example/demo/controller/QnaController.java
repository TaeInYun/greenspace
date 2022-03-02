package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.QnaDAO;

import lombok.Setter;

@Controller
@Setter
public class QnaController {

	private QnaDAO dao;
	
	public void setDao(QnaDAO dao) {
		this.dao= dao;
	}
	
	//-------------------내 Qna 리스트-------------------- 
	
	@RequestMapping("/mypage/listQna")
	public void listQna_mypage(HttpSession session,
			int qnaColumn) {
						
		
		session.setAttribute("q",dao.findAll(qnaColumn));	 
	}
	
}

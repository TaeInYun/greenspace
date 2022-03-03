package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void listQna_mypage(HttpSession session) {
						
		
		session.setAttribute("q",dao.findAll());	 
	}
	
	
	@RequestMapping("/mainpage/listSearchQna")
	public void listQna(Model model,HttpSession session,String keyword,
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM) {
						
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
				
		HashMap map = new HashMap();
		//map.put("qnaColumn", qnaColumn);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("list",dao.findAllSearch(map));
	}
	
}

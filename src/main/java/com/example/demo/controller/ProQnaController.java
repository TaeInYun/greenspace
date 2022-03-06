package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ProQnaDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.vo.ProQnaVO;

import lombok.Setter;

@Controller
@Setter
public class ProQnaController {

	@Autowired
	private ProQnaDAO dao;
	
	@Autowired
	private QnaDAO daoq;
	
	//------------1대1문의 작성
	@RequestMapping(value="/shop/insertProQna", method= RequestMethod.GET)
	public void insertForm(int pro_no,Model model) {
		model.addAttribute("pro_no", pro_no);
	}
	
	@RequestMapping(value="/shop/insertProQna", method= RequestMethod.POST)	
	public ModelAndView insertProQna(ProQnaVO p) {
		ModelAndView mav = new ModelAndView();
		
		dao.insert(p);
		
		return mav;
	}
	
	
	//------------1대1문의 수정
	
	@RequestMapping(value="/shop/updateProQna", method=RequestMethod.GET)
	public void updateFrom(int no, Model model) {
		model.addAttribute("q", daoq.findAllDetail(no));
	}
	
	@RequestMapping(value="/shop/updateProQna", method=RequestMethod.POST)
	public ModelAndView updateProQna(ProQnaVO p) {
		ModelAndView mav = new ModelAndView();
		
		
		dao.update(p);
		
		return mav;
	}
	
	//------------1대1문의 삭제
	
	@RequestMapping("/shop/deleteProQna")
	public ModelAndView delete(int no, Model model) {
		ModelAndView mav= new ModelAndView();
		
		//int no2;
		model.addAttribute("q", daoq.findAllDetail(no));
		
		dao.delete(no);
		
		return mav;
	}
}

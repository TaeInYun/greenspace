package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ChallengeDAO;
import com.example.demo.vo.ChallengeVO;



@Controller
public class ChallengeController {

	@Autowired
	private ChallengeDAO dao;
	
	//-------------------챌린지 항목 리스트-------------------- 
	@RequestMapping("/admin/listChg")
	public void listChg(Model model) {
		model.addAttribute("list",dao.findAll());	 
	}
	
	//------------------상품추가하기-------------------- 
	@RequestMapping(value = "/admin/insertChg", method = RequestMethod.GET)
	public void insertForm() {		 
	}	

	//-------------------챌린지 추가------------------ 
	@RequestMapping(value="/admin/insertChg",method = RequestMethod.POST )
	public ModelAndView insert_submit(ChallengeVO c) {
		ModelAndView mav= new ModelAndView("redirect:/admin/listChg");
		int re = dao.insert(c);
		if(re!=1) {
			mav.setViewName("error");
			mav.addObject("msg", "챌린지 등록에 실패하였습니다.");
		}
		return mav;
	}

	//-------------------챌린지 수정------------------ 
	
	@RequestMapping(value = "/admin/updateChg", method = RequestMethod.GET)
	public void updateForm(int no, Model model) {
		model.addAttribute("c", dao.findByNo(no));
	}
	
	
	
	@RequestMapping("/admin/updateChg")
	public ModelAndView update(int no,ChallengeVO c) {
		ModelAndView mav= new ModelAndView("redirect:/admin/listChg");
		int re = dao.update(c);
		if(re!=1) {
			mav.setViewName("error");
			mav.addObject("msg", "챌린지 수정에 실패하였습니다.");
		}
		return mav;
	}	
	
	
	//-------------------챌린지 삭제------------------ 
	/*
	@RequestMapping(value = "/admin/deleteChg", method = RequestMethod.GET)
	public void delete_form(int no, Model model) {
		System.out.println(no);
		model.addAttribute("c", dao.findByNo(no));
	}
	*/
	
	
	@RequestMapping("/admin/deleteChg")
	public ModelAndView delete_submit(int no) {
		ModelAndView mav= new ModelAndView("redirect:/admin/listChg");
		int re = dao.delete(no);
	
		if(re!=1) {
			mav.setViewName("error");
			mav.addObject("msg", "챌린지 삭제에 실패하였습니다.");
		}
		return mav;
	}	
	
}
	


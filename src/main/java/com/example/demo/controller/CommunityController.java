package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CerBoardDAO;
import com.example.demo.dao.ChallengeUserDAO;
import com.example.demo.dao.CommunityDAO;
import com.example.demo.vo.CerBoardVO;
import com.example.demo.vo.CommunityVO;
import com.example.demo.vo.MemberVO;

@Controller
public class CommunityController {

	@Autowired
	private CommunityDAO dao;
	

	// 인증 게시판 목록
	@RequestMapping("/board/listCommunity")
	public void listCommunity(Model model) {
		
		model.addAttribute("list", dao.findCommunity());
		
	}
	
	
	/*	//-------커뮤니티 게시판 등록------------
	@RequestMapping(value="/board/insertCommunity", method = RequestMethod.GET)
	public ModelAndView insertCommunity(Model model,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO m = (MemberVO)session.getAttribute("m");
			if(m!=null) {
			int member_no = m.getNo();
			}else {
				mav.setViewName("redirect:/login");
			}
			return mav;
	}
	
	//-------커뮤니티 게시판 등록------------
	@RequestMapping(value="/board/insertCommunity", method = RequestMethod.POST)
	public ModelAndView insertCommunity_submit(CommunityVO c,HttpServletRequest request) {
		
	}
	
	
	//------------------커뮤니티 수정하기--------------------
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.GET)
	public void updateForm(int no, Model model,HttpSession session) {
	
	}
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CerBoardVO c, HttpServletRequest request,Model model) {

	}*/
	
	
	
	//--------커뮤니티 상세----------------
	@RequestMapping("/board/detailCommunity")
	public void detail(Model model,int no,HttpSession session) {
		dao.updateHitCommu(no);	
		model.addAttribute("c", dao.getCommunity(no));
	}

	/*
	//------------------커뮤니티 게시판 삭제하기-------------------- 
	@RequestMapping(value = "/board/deleteCerBoard")
	public ModelAndView deleteSubmit(int no, HttpServletRequest request) {

	}*/
}


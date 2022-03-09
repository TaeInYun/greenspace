package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CommentsDAO;
import com.example.demo.dao.OneDAO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OneVO;

import lombok.Setter;

@Controller
@Setter
public class OneController {
	
	@Autowired
	private OneDAO dao;
	
	@Autowired
	private CommentsDAO CommentsDAO;
	
	
	public void setDao(OneDAO dao) {
		this.dao= dao;
	}
	
	
	// 전체목록 
	@RequestMapping("/admin/listOne")       //findAllSearch
	public void listOne(Model model,
			HttpSession session,
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM) {
										
		
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
				
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("list",dao.findAll(map));
		
		
	}
	
	// 마이페이지 1대1문의
		@RequestMapping("/mypage/listSearchOneMy")       //findAllSearch
		public void listOneMy(Model model,
				HttpSession session,
				String searchColumn
				) {
										
			int member_no = ((MemberVO)session.getAttribute("m")).getNo();	//회원이 로그인 했을때 회원 번호를 m에 넣어서 상태유지 하는것을 가지고옴 
			
			if( searchColumn == null ) {
				if(session.getAttribute("searchColumn") != null ) {
					searchColumn = (String)session.getAttribute("searchColumn");					
				}
			}
						
					
			HashMap map = new HashMap();
			map.put("searchColumn", searchColumn);
			map.put("member_no",member_no);
			
			
			model.addAttribute("list",dao.findAllMy(map));
			
			if(searchColumn != null) {
				session.setAttribute("searchColumn", searchColumn);			
			}
			
			
		}
	
	// 디테일
	@RequestMapping("/mypage/detailOne")
	public void detail(int no,Model model) {
		
		model.addAttribute("od",dao.findAllDetail(no));
		model.addAttribute("comments",CommentsDAO.findAllCommentByOne_no(no));
	}
	
	
	//----------------보드(검색기능)
	
	
		@RequestMapping("/board/listSearchOne")       
		public void listOne(Model model,
				HttpSession session,
				String keyword,
				String searchColumn,
				@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM) {
				
			System.out.println("검색어"+keyword);
			
			if( keyword == null ) {
				if(session.getAttribute("keyword") != null ) {
					searchColumn = (String)session.getAttribute("searchColumn");
					keyword = (String)session.getAttribute("keyword");
				}
			}
			
			System.out.println("검색어"+keyword);
			
			
			int start = (pageNUM-1)* dao.pageSIZE + 1;
			int end = start + dao.pageSIZE - 1;
					
			HashMap map = new HashMap();
			map.put("searchColumn", searchColumn);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			
			model.addAttribute("totalPage", dao.totalPage);
			model.addAttribute("list",dao.findAllSearch(map));
			
			//만약에 검색하였다면 
					//검색한 칼럼이름과 검색어를 세션에 저장하여 상태유지 합니다
					if(keyword != null) {
						session.setAttribute("searchColumn", searchColumn);
						session.setAttribute("keyword", keyword);
					}
		}
		
		
		//-------- 추가
		@RequestMapping(value="/board/insertOne", method= RequestMethod.GET)
		public void insertForm() {
			
		}
		
		@RequestMapping(value="/board/insertOne", method= RequestMethod.POST)	
		public ModelAndView insertProQna(OneVO o) {
			ModelAndView mav = new ModelAndView();
			
			dao.insert(o);
			
			return mav;
		}
		
		
		//----------- 수정
		
		@RequestMapping(value="/board/updateOne", method=RequestMethod.GET)
		public void updateFrom(int no, Model model) {
			model.addAttribute("o", dao.findAllDetail(no));
		}
		
		@RequestMapping(value="/board/updateOne", method=RequestMethod.POST)
		public ModelAndView updateProQna(OneVO o) {
			ModelAndView mav = new ModelAndView();
			
			
			dao.update(o);
			
			return mav;
		}
		
		//----------- 삭제
		@RequestMapping("/board/deleteOne")
		public ModelAndView delete(int no, Model model) {
			ModelAndView mav= new ModelAndView();
			
			//int no2;
			model.addAttribute("o", dao.findAllDetail(no));
			
			dao.delete(no);
			
			return mav;
		}
	
	
	
}

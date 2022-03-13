package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.CommentsDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class QnaController {

	@Autowired
	private QnaDAO dao;
	
	@Autowired
	private CommentsDAO commentsdao;
	
	
	public void setDao(QnaDAO dao) {
		this.dao= dao;
	}
	
	//-------------------내 Qna 리스트-------------------- 
	
	@RequestMapping("/mypage/listQna")   //findAll
	public void listQna_mypage(HttpSession session,
			Model model,
			String searchColumn,
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM) {
		
		
		
		int member_no = ((MemberVO)session.getAttribute("m")).getNo();	//회원이 로그인 했을때 회원 번호를 m에 넣어서 상태유지 하는것을 가지고옴 
		//model.addAttribute("a", dao.findAll(map));
		
		
		if( searchColumn == null ) {
			if(session.getAttribute("searchColumn") != null ) {
				searchColumn = (String)session.getAttribute("searchColumn");			
			}
		}
						
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
				
		System.out.println("칼럼"+searchColumn);
		
		HashMap map = new HashMap();	
		map.put("searchColumn", searchColumn);		
		map.put("start", start);
		//map.put("end", end);
		map.put("member_no",member_no);
		
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("q",dao.findAll(map));
		//session.setAttribute("q",dao.findAll(map));	
		
		model.addAttribute("totalPage", dao.totalPage);
        model.addAttribute("totalRecord", dao.totalRecord);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("pageSIZE", dao.pageSIZE);
		
				
		//만약에 검색하였다면 
		//검색한 칼럼이름과 검색어를 세션에 저장하여 상태유지 합니다
		if(searchColumn != null) {
			session.setAttribute("searchColumn", searchColumn);			
		}
		
	}
	
	//-------디테일
	
	@RequestMapping("/mypage/detailQna")
	public void detail(int no,Model model) {
		
		model.addAttribute("qd",dao.findAllDetail(no));
		model.addAttribute("comments",commentsdao.findAllCommentByPro_qna_no(no));
		
	}
	
	
	
	
	//----------------관리자 
	
	
	@RequestMapping("/admin/listSearchQna")       //findAllSearch
	public void listQna(Model model,
			HttpSession session,
			String keyword,
			String searchColumn,
			String qnaColumn,
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
		map.put("qnaColumn", qnaColumn);
		map.put("searchColumn", searchColumn);
		map.put("keyword", keyword);
		map.put("start", start);
		//map.put("end", end);
		
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("list",dao.findAllSearch(map));
		// 페이징 추가
		model.addAttribute("totalPage", dao.totalPage);
        model.addAttribute("totalRecord", dao.totalRecord);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("pageSIZE", dao.pageSIZE);
		
		
		//만약에 검색하였다면 
				//검색한 칼럼이름과 검색어를 세션에 저장하여 상태유지 합니다
				if(keyword != null) {
					session.setAttribute("searchColumn", searchColumn);
					session.setAttribute("keyword", keyword);
				}
	}
	
}

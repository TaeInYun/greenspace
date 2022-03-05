package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.ImgService;
import com.example.demo.dao.CommunityDAO;
import com.example.demo.vo.CommunityVO;
import com.example.demo.vo.MemberVO;

@Controller
public class CommunityController {

	@Autowired
	private CommunityDAO dao;
	
	@Autowired
	private ImgService imgService;
	

	// 자유게시판 목록
	@RequestMapping("/board/listCommunity")
	public void listCommunity(Model model) {
		
		model.addAttribute("list", dao.findCommunity());
		
	}
	
	//-------자유 게시판 등록------------
	@RequestMapping(value="/board/insertCommunity", method = RequestMethod.GET)
	public ModelAndView insertCerBoard(Model model,HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberVO m = (MemberVO)session.getAttribute("m");
			if(m!=null) {
			int member_no = m.getNo();
			
			
			}else {
				mav.setViewName("redirect:/login");
			}
			return mav;
	}
	
	/*
	@Transactional
	@RequestMapping(value="/board/insertCommunity", method = RequestMethod.POST)
	public ModelAndView insertCerBoard_submit(HttpServletRequest request,
			@ModelAttribute("c") CommunityVO c,MultipartHttpServletRequest mhsq)
					throws IllegalStateException,IOException{
		
		System.out.println("insertCommunity 동작함.");
		System.out.println(c);
		ModelAndView mav = new ModelAndView("redirect:/board/listCommunity");
		
		session = request.getSession();
		
		int cer_no = (Integer) session.getAttribute("no");
		c.setNo(cer_no);
		System.out.println(cer_no);
		System.out.println(cer_no);
		int re = dao.insert(c);
		
		
		String path = request.getRealPath("upload/commu");
		System.out.println("path:"+path);
		
		File file = new File(path);
		if(file !=null && !file.equals("")) {		
			file.delete();
		}
		
		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("uploadFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename();
                System.out.println("원래이름"+originalfileName); 
                String saveFileName = genId + "." + FilenameUtils.getExtension(originalfileName);
                System.out.println("저장이름"+saveFileName);
                // 저장되는 파일 이름
 
                String savePath = path + saveFileName; // 저장 될 파일 경로
                System.out.println("저장경로"+savePath);
                try {
                	mf.get(i).transferTo(new File(savePath)); // 파일 저장   	 		
				} catch (Exception e) {
					// TODO: handle exception
				}
                
                imgService.fileUpload(originalfileName, saveFileName);
            }
        }
	
		return mav;
	}*/
	
	
	
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


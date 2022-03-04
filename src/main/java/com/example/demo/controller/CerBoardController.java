package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import com.example.demo.vo.CerBoardVO;
import com.example.demo.vo.MemberVO;

@Controller
public class CerBoardController {

	@Autowired
	private CerBoardDAO dao;

	@Autowired
	private ChallengeUserDAO userdao;
	
	// 인증 게시판 목록
	@RequestMapping("/board/listCerBoard")
	public void listChg(Model model) {
		model.addAttribute("list", dao.findCerBoard());	
	}
	
	
	//-------인증 게시판 등록------------
	@RequestMapping(value="/board/insertCerBoard", method = RequestMethod.GET)
	public ModelAndView insertCerBoard(Model model,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO m = (MemberVO)session.getAttribute("m");

			if(m!=null) {
			int member_no = m.getNo();
			model.addAttribute("endlist", userdao.listChgUserByMemberNO(member_no));
			}else {
				mav.setViewName("redirect:/login");
			}
			return mav;
	}
	
	//-------인증 게시판 등록------------
	@RequestMapping(value="/board/insertCerBoard", method = RequestMethod.POST)
	public ModelAndView insertCerBoard_submit(CerBoardVO c,HttpServletRequest request) {
		
		
		ModelAndView mav = new ModelAndView("redirect:/board/listCerBoard");
		
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);
		
		c.setCer_thumbnail("");		
		MultipartFile uploadFile = c.getUploadFile();
		
		String cer_thumbnail = uploadFile.getOriginalFilename();
		if(cer_thumbnail != null && !cer_thumbnail.equals("")) {
			c.setCer_thumbnail(cer_thumbnail);
		}	
		
		int re = dao.insert(c);
		 
		if(re != 1 ) {
			mav.setViewName("error");
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
		}else {
			try {
				byte []data = uploadFile.getBytes();
				if(cer_thumbnail != null && !cer_thumbnail.equals("")) {
					FileOutputStream fos = new FileOutputStream(path + "/"+cer_thumbnail);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}	
		}		
		return mav;
	}
	
	
	//------------------인증게시판 수정하기--------------------
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.GET)
	public void updateForm(int no, Model model,HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		model.addAttribute("endlist", userdao.listChgUserByMemberNO(member_no));
		model.addAttribute("c", dao.getCerBoard(no));
		System.out.println(no);
	}
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CerBoardVO c, HttpServletRequest request,Model model) {

		ModelAndView mav = new ModelAndView("redirect:/board/detailCerBoard"+"?no="+c.getNo());
		String path = request.getRealPath("upload/cer");
		String oldFname = c.getCer_thumbnail();
		MultipartFile uploadFile = c.getUploadFile();
		String thumbnail = uploadFile.getOriginalFilename();
		byte []data;
		try {
			data = uploadFile.getBytes();
			if(thumbnail != null && !thumbnail.equals("")) {
				c.setCer_thumbnail(thumbnail);
				FileOutputStream fos = new FileOutputStream(path +"/"+thumbnail);
				fos.write(data);
				fos.close();
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		int re = dao.updateCerBoard(c);
		
		if(re ==1) {
			if(thumbnail !=null && !thumbnail.equals("")) {
				File file = new File(path + "/" + oldFname);
				file.delete();
				//model.addAttribute("c", dao.getCerBoard(no));
			}
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "게시물 수정에 실패하였습니다.");
		}
		return mav;
	}
	
	
	
	//인증게시판 상세
	@RequestMapping("/board/detailCerBoard")
	public void detail(Model model,int no,HttpSession session) {
		//MemberVO m = (MemberVO)session.getAttribute("m");
		dao.updateHitCer(no);	
		model.addAttribute("c", dao.getCerBoard(no));

	}

	
	//------------------인증 게시판 삭제하기-------------------- 
	@RequestMapping(value = "/board/deleteCerBoard")
	public ModelAndView deleteSubmit(int no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/board/listCerBoard");
		String oldFname = dao.getCerBoard(no).getCer_thumbnail();		

		int re = dao.deleteCerBoard(no);
		if(re == 1) {
			if(oldFname != null && !oldFname.equals("")) {
				String path = request.getRealPath("upload/cer");
				File file = new File(path + "/" + oldFname);
				file.delete();
				System.out.println("게시물 삭제성공");
			}
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "게시물 삭제에 실패하였습니다.");
		}
		
		return mav;
	}
	
	
	
	// My 인증 게시판 목록
	@RequestMapping("/mypage/myCerBoard")
	public void listMyChg(Model model,HttpSession session) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		model.addAttribute("list", dao.findAllByMember(member_no));	
	}
	
}


package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public void insertCerBoard(Model model,HttpSession session) {

		MemberVO m = (MemberVO)session.getAttribute("m");
		
			int member_no = m.getNo();
			System.out.println(member_no);

			model.addAttribute("endlist", userdao.listChgUserByMemberNO(member_no));

	}
	
	//-------인증 게시판 등록------------
	@RequestMapping(value="/board/insertCerBoard", method = RequestMethod.POST)
	public ModelAndView insertCerBoard_submit(CerBoardVO c,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("redirect:/Board/listCerBoard");
		
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
			mav.addObject("msg", "상품등록에 실패하였습니다.");
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
	
		
}


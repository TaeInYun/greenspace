package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CerBoardDAO;
import com.example.demo.dao.ChallengeUserDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.PointDAO;
import com.example.demo.vo.CerBoardVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.PointVO;

@Controller
public class CerBoardController {

	@Autowired
	private CerBoardDAO dao;

	@Autowired
	private ChallengeUserDAO userdao;
	
	@Autowired
	private PointDAO pointDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	

	
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
		public ModelAndView insertCerBoard_submit(CerBoardVO c,HttpServletRequest request,HttpSession session) {
			
			MemberVO m = (MemberVO)session.getAttribute("m");

			HashMap map = new HashMap();
			
			String cer_status=c.getCer_status();
			int member_no = c.getMember_no();
			int point_use = m.getPoint_use();
			System.out.println("point_use"+point_use);
			
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
				
				if(cer_status.equals("비공개")) {
					
				PointVO PointVO = new PointVO(0, null, "적립", 10, member_no, "CHG");
				pointDAO.insertPoint(PointVO);
				
				int point_save = PointVO.getPoint_amount();
				System.out.println("point_save"+point_save);
				
				//회원 포인트 수정
				map.put("member_no", member_no);
				map.put("point_save", point_save);
				memberDAO.insertBoardPoint(map);
				
				}else if(cer_status.equals("공개")){
					PointVO PointVO = new PointVO(0, null, "적립", 50, member_no, "PUB");
					pointDAO.insertPoint(PointVO);
					
					int point_save = PointVO.getPoint_amount();
					System.out.println("point_save"+point_save);
					//회원 포인트 수정
					map.put("member_no", member_no);
					map.put("point_save", point_save);
					memberDAO.insertBoardPoint(map);
			
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
		
	}
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CerBoardVO c, HttpServletRequest request,Model model,HttpSession session) {
	
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		int cer_no = c.getNo();
		
		String cer_status=c.getCer_status();
		//String point_date = c.getCer_date().toString()  ;
		//System.out.println(point_date);
		System.out.println(cer_status);
		System.out.println(member_no);
		System.out.println(cer_no);
			
		
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
			}
			/*
			HashMap map = new HashMap();
			
			if(cer_status.equals("비공개")) {	
				System.out.println("비공개일때");
				
				PointVO pointvo = new PointVO(0, "", "적립", 10, member_no, "CHG");
				int point_amount = pointvo.getPoint_amount();
				String point_type_code = pointvo.getPoint_type_code();
				
				System.out.println(point_amount);
				System.out.println(point_type_code);
				
				map.put("point_amount", point_amount);
				map.put("point_type_code", point_type_code);
				map.put("member_no", member_no);
				map.put("cer_no", c.getNo());
				
				int rr = pointDAO.updateCerPoint(map);
				System.out.println("포인트수정"+rr);
				
				
				
				//회원포인트 수정
				int point_save = pointVO.getPoint_amount() -50 ;
				System.out.println("수정 : point_save"+point_save);
				
				map1.put("member_no", member_no);
				map1.put("point_save", point_save);
				memberDAO.insertBoardPoint(map1);				
				
				 
				}else if(cer_status.equals("공개")) {
					
					System.out.println("공개일때");
					
					PointVO pointvo = new PointVO(0, "", "적립",50, member_no, "CHG");
				
					int point_amount = pointvo.getPoint_amount();
					String point_type_code = pointvo.getPoint_type_code();
					
					System.out.println(point_amount);
					System.out.println(point_type_code);
					
					map.put("point_amount", point_amount);
					map.put("point_type_code", point_type_code);
					map.put("member_no", member_no);
					map.put("cer_no", c.getNo());
					
					int rr = pointDAO.updateCerPoint(map);
					System.out.println("포인트수정"+rr);
					
					//회원포인트 수정
					int point_save = pointVO.getPoint_amount()-10;
					System.out.println("point_save"+point_save);
					
					map1.put("member_no", member_no);
					map1.put("point_save", point_save);
					memberDAO.insertBoardPoint(map1);

				}*/
			
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


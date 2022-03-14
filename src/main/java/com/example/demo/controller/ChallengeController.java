package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CerBoardDAO;
import com.example.demo.dao.ChallengeDAO;
import com.example.demo.dao.ChallengeListDAO;
import com.example.demo.dao.ChallengeUserDAO;
import com.example.demo.vo.ChallengeListVO;
import com.example.demo.vo.ChallengeUserVO;
import com.example.demo.vo.ChallengeVO;
import com.example.demo.vo.MemberVO;



@Controller
public class ChallengeController {

	@Autowired
	private ChallengeDAO dao;
	
	@Autowired
	private ChallengeListDAO listdao;
	
	@Autowired
	private ChallengeUserDAO userdao;
	
	@Autowired
	private CerBoardDAO cerdao;
	

	//-------------------관리자 챌린지 항목 리스트-------------------- 
	@RequestMapping("/admin/listChg")
	public void listChg(Model model) {
		model.addAttribute("chglist",dao.findAll());	
		model.addAttribute("todaylist",listdao.todayChgList());
		model.addAttribute("tomorrowlist",listdao.tomorrowChgList());	
		model.addAttribute("yesterdaylist",listdao.yesterdayChgList());	
	}
	
	//------------------관리자 챌린지 추가-------------------- 
	@RequestMapping(value = "/admin/insertChg", method = RequestMethod.GET)
	public void insertForm() {		 
	}	

	//-------------------관리자 챌린지 추가------------------ 
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

	//-------------------관리자 챌린지 수정------------------ 
	
	@RequestMapping(value = "/admin/updateChg", method = RequestMethod.GET)
	public void updateForm(int no, Model model) {
		model.addAttribute("c", dao.findByNo(no));
	}
	
	
	//----------------관리자 챌린지 수정 ----------------
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
	
	//-------------------관리자 챌린지 삭제------------------ 
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
	


	//-------------------메인 회원 챌린지 목록-------------------- 
	@RequestMapping(value={"/mainpage/member","/mypage/myChallenge"})
	public void memberChgList(Model model,HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("m");
		
		int member_no = m.getNo();		

		System.out.println(member_no);
		//도전챌린지목록
		model.addAttribute("chglist",listdao.memberChgList(member_no));
		//완료 챌린지목록
		model.addAttribute("endlist", userdao.listChgUserByMemberNO(member_no));		
		//나무수
		model.addAttribute("tree", userdao.getSaveTree(member_no));
		//오늘 인증글 있는지 체크
		model.addAttribute("cercnt", cerdao.checkTodayCer(member_no));
		
		
	}
	
	// 회원 버튼클릭 도전상태 변경
	@RequestMapping( value={"/mainpage/updateChgStatus","/mypage/updateChgStatus"})
	@ResponseBody
	public int changeChgStatus(ChallengeListVO c) {
		System.out.println("도전상태변경");
		int chg_no = c.getChg_no();
		String chg_status_code = c.getChg_status_code();
		int member_no = c.getMember_no();
		System.out.println(chg_no + chg_status_code + member_no);
		int re = listdao.updateChgStatus(c);
		if(re==1) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		
		return re;
	}	
	
	
	// 회원 버튼클릭 도전상태 변경
	@RequestMapping( value={"/mainpage/checkEndStatus","/mypage/checkEndStatus"})
	@ResponseBody
	public int checkEndStatus(int member_no) {

		
		int cnt = listdao.checkEndstatus(member_no);
		System.out.println(cnt);
		
		return cnt;
	}	
		

	
	//오늘 챌린지 완료 버튼 클릭시 도전상태가 'END'인것만 insert되게
	@RequestMapping(value={"/mainpage/insertEndChg","/mypage/insertEndChg"})
	@ResponseBody
	public int insertEndChg(int member_no) {
		int re=-1;
		re = userdao.insertEndChg(member_no);
		//re=1,2,3
		
		if(re == -1) {
			System.out.println("추가실패");
			
		}else {
			System.out.println("추가성공");
			listdao.updateChgStatusSTA(member_no);	
		}
		System.out.println(member_no);
		
		return re;
	}

}
	


package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.AddressVO;
import com.example.demo.vo.MemberVO;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.Setter;

@Controller
@Setter
public class AddressController {

	@Autowired
	private AddressDAO dao;
	
	//-----------------주소 전체리스트-------------------------
	@RequestMapping("/admin/listAddress")
	public void listAddress_admin(HttpSession session) {
		session.setAttribute("aa", dao.FindAll());
	}
	
	
	@RequestMapping("/mypage/mainAddress")
	public void listAddress_mypage( Model model,HttpSession session) {	
		
		int member_no = ((MemberVO)session.getAttribute("m")).getNo();	//회원이 로그인 했을때 회원 번호를 m에 넣어서 상태유지 하는것을 가지고옴 
		model.addAttribute("a", dao.allMainAddress(member_no));
		model.addAttribute("list", dao.allSubAddress(member_no));
	} 
	
	@RequestMapping("/mypage/detailAddress")
	public void detail(int no, Model model) {	
		
		model.addAttribute("a", dao.findAllDetail(no));
	}
	
	
	@RequestMapping(value = "/mypage/insertAddress" , method = RequestMethod.GET)
	public void insertForm() {
		// jsp 에서 m.no로 전달하면 되기 때문에 필요없음? addr_main 고민 
	}
	
	@RequestMapping(value = "/mypage/insertAddress" , method = RequestMethod.POST)
	public ModelAndView insertAddress(AddressVO a) {
		ModelAndView mav = new ModelAndView("redirect:/mypage/mainAddress");
		System.out.println("insert작동함");
		System.out.println("vo에 담긴 객체입니다."+a);
		
		dao.insert(a);
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage/insertAddressSub" , method = RequestMethod.GET)
	public void insertSubForm() {
		// jsp 에서 m.no로 전달하면 되기 때문에 필요없음? addr_main 고민 
	}
	
	@RequestMapping(value = "/mypage/insertAddressSub" , method = RequestMethod.POST)
	public ModelAndView insertAddressSub(AddressVO a) {
		ModelAndView mav = new ModelAndView("redirect:/admin/listAddress");
		System.out.println("insert작동함");
		System.out.println(a);
		
		dao.insert(a);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/mypage/updateAddress" , method = RequestMethod.GET)
	public void updateForm(int no, Model model) {
		model.addAttribute("a", dao.findAllDetail(no));  //detail no
	}
	
	@RequestMapping(value = "/mypage/updateAddress" , method = RequestMethod.POST)
	public ModelAndView updateAddress(AddressVO a) {
		
		ModelAndView mav = new ModelAndView("redirect:/mypage/mainAddress");
		
		System.out.println("update작동함");
		System.out.println(a);
		
		dao.update(a);
		return mav;
		
	}
	
	//public void updateMainBtnForm(int no, Model model,HttpSession session,AddressVO a) {
	
	@RequestMapping(value = "/mypage/updateMainBtnAddress" , method = RequestMethod.GET)
	public ModelAndView updateMainBtnForm(int no, Model model,HttpSession session,AddressVO a) {
		
		ModelAndView mav = new ModelAndView("redirect:/mypage/mainAddress");
		
		model.addAttribute("a", dao.findAllDetail(no));  //detail no  finaAllDetail주소상세 에 있는 정보를
		
		
		int member_no = ((MemberVO)session.getAttribute("m")).getNo();
		int no2 = a.getNo();
		
		System.out.println("main주소로 설정할 주소번호"+no2);
		System.out.println("main주소로 설정할 회원번호"+member_no);
		dao.updateBtn(member_no);
		dao.updateMainBtn(no2);
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage/deleteAddress" , method = RequestMethod.GET)
	public ModelAndView deleteForm(int no,Model model,HttpSession session, AddressVO a) {
		ModelAndView mav = new ModelAndView("redirect:/mypage/mainAddress");
		model.addAttribute("a", dao.findAllDetail(no));
		
		dao.delete(no);
		return mav;
	}
	
	//mypage/updateMainBtnAddress?no=121
	//update/updateMainBtnAddress
	
	//@RequestMapping(value = "/mypage/updateMainBtnAddress" , method = RequestMethod.POST)
	//public ModelAndView updateMainBtnAddress(AddressVO a,HttpSession session,Model model) {
		
		//ModelAndView mav = new ModelAndView("redirect:/mypage/mainAddress");  이거를 그냥 get에서 해도 될듯?
		//ModelAndView mav = new ModelAndView();
		
		/*
		System.out.println("updateMainBtnAddress post동작함");
		System.out.println(a);
		
		int member_no = ((MemberVO)session.getAttribute("m")).getNo();	//회원이 로그인 했을때 회원 번호를 m에 넣어서 상태유지 하는것을 가지고옴
		
		//model.addAttribute("a", dao.updateBtn(member_no));
		
		int no = a.getNo();
		System.out.println("main주소로 설정할 주소번호"+no);
		System.out.println("main주소로 설정할 회원번호"+member_no);
		dao.updateBtn(member_no);
		dao.updateMainBtn(no);
		*/
		//return mav;
		
		
	//}
   
	
}

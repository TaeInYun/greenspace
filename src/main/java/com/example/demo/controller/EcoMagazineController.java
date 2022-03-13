package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example.demo.dao.EcoMagazineDAO;

import lombok.Setter;

@Controller
@Setter
public class EcoMagazineController{
	
    @Autowired
    private EcoMagazineDAO dao;
	
	//@GetMapping("/ecoMagazine/ecoMagazineInfo")
	//public void listInfo() {
	//	
	//}
	
    //메인페이지
	 @GetMapping("/ecoMagazine/ecoMagazineInfo")
		public String findEcoMagazineAll(HttpSession session, Model model) {
			model.addAttribute("ecoMagazine", dao.findEcoMagazineAll());		
			return "/ecoMagazine/ecoMagazineInfo";
		}
	    
	    
	 //좋아요수   
	    @GetMapping("/ecoMagazine/like/{no}")
	    @ResponseBody
	    public int getLikeCount(@PathVariable int no) {
	    	dao.updateEcoMagazineLike(no);
	    	return dao.findEcoMagazineLike(no);
	    }

	
	    @RequestMapping("/ecoMagazine/detail")
	    public void detail(int no, Model model) {
	    	dao.updateEcoMagazineHit(no);
	        model.addAttribute("e", dao.findEcoMagazineByNo(no));
	        
	    }
	
	
}
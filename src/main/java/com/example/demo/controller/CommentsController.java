package com.example.demo.controller;

import java.util.HashMap;

import javax.swing.plaf.synth.SynthStyleFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CommentsDAO;


@Controller
public class CommentsController {
	
	
	@Autowired
	private CommentsDAO commentsdao; 
	
	@ResponseBody
	@RequestMapping(value = "/insertComments")
	public void  insertComments(String com_content, Integer member_no, Integer commu_no, Integer cer_no){		
		HashMap map = new HashMap();
		map.put("com_content", com_content);
		map.put("member_no", member_no);
		map.put("commu_no", commu_no);			
		map.put("cer_no", cer_no);			
	    int re = commentsdao.insertComments(map);
	}
	
	
	@RequestMapping(value = "/board/deleteComments", method = RequestMethod.GET)
	public void deleteComments(int no,Model model,int commu_no){
		model.addAttribute("no", no);
		model.addAttribute("commu_no", commu_no);
	}
	
	/*@RequestMapping(value = "/board/deleteComments", method = RequestMethod.POST)
	public ModelAndView deleteRComments(int no,Model model,int commu_no){
		ModelAndView mav= new ModelAndView("redirect:/board/detailCommunity"+"?no="+commu_no);
		
		HashMap map = new HashMap();
		map.put("no", no);
		map.put("commu_no", commu_no);
		int re = commentsdao.deleteComments(map);	
		System.out.println("re : "+re);
		if(re!=1) {
			mav.setViewName("error");
		} 
		return mav;
	}
	*/	 
}

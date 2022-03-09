package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
	public void  insertComments(String com_content, Integer member_no, Integer commu_no, 
			Integer cer_no, Integer ets_no, 
			Integer pro_qna_no,Integer one_no, Integer re_no ){		
		HashMap map = new HashMap();
		map.put("com_content", com_content);
		map.put("member_no", member_no);
		map.put("commu_no", commu_no);			
		map.put("cer_no", cer_no);			
		map.put("ets_no", ets_no);			
		map.put("pro_qna_no", pro_qna_no);			
		map.put("one_no", one_no);			
		map.put("re_no", re_no);			
	    int re = commentsdao.insertComments(map);
	}
	
 
	
	//---------삭제-------------
	@RequestMapping(value = "/board/deleteComments", method = RequestMethod.GET )
	public void deleteComments(int no, Model model, Integer member_no){		 
		model.addAttribute("no", no);
		model.addAttribute("member_no", member_no);		   
		 
	}
	
	@RequestMapping(value = "/board/deleteComments", method = RequestMethod.POST )
	public String  deleteRComments(int no, Model model, Integer member_no, HttpServletRequest request){		 
		HashMap map = new HashMap();
		map.put("no", no);		 
		map.put("member_no", member_no);  
		int re = commentsdao.deleteComments(map);		
		if(re==1) {
			String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
			return "redirect:"+ referer; // 이전 페이지로 리다이렉트
		}
		return null;
	}
	//---------삭제-------------
	
	 
	//---------수정-------------
	@RequestMapping(value = "/board/updateComments", method = RequestMethod.GET )
	public void updateComments(int no, Model model, Integer member_no, String com_content){		 
		model.addAttribute("no", no);
		model.addAttribute("member_no", member_no);		 
		model.addAttribute("com_content", com_content);		 
	}
	 
	@RequestMapping(value = "/board/updateComments", method = RequestMethod.POST )
	public String updatePostComments(int no, Model model, Integer member_no, String com_content,HttpServletRequest request){ 
		ModelAndView mav = new ModelAndView("");
		HashMap map = new HashMap();
		map.put("no", no);		 
		map.put("member_no", member_no);  
		map.put("com_content", com_content);  
		int re = commentsdao.updateComments(map);	
		if(re==1) {
			String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
			return "redirect:"+ referer; // 이전 페이지로 리다이렉트
		}
		return null;		 
	}
	  
}

package com.example.demo.controller;

import com.example.demo.dao.EasyToStartDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.EasyToStartVO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@Setter
public class EasyToStartController {

    @Autowired
    private EasyToStartDAO dao;

    @GetMapping(value =  "/easyToStart/easyToStartList")
    public void easyToStartForm(HttpSession session, Model model, @RequestParam(value="pageNUM", defaultValue = "1") int pageNUM) {
        MemberVO m = (MemberVO)session.getAttribute("m");
    	
    	
    	if(m != null) {
    		//회원의 이미지를 불러오고 
    		
    		
    		
    	}else {
    		//회원이 아닐경우 빈하트로 보여주세요!
    		
    		
    	}
    	
    	
    	//현재 페이지에 보여줄 시작번호를 계산한다 
    	int start = (pageNUM -1) * dao.pageSIZE; 
    	
    	//DAO에서 게시물 검색에 필요한 정보를 MAP에 저장
    	HashMap map = new HashMap();
    	map.put("start", start);
    	map.put("totalRecord", dao.totalRecord);
    	map.put("totalPage", dao.totalPage);
    	
    	model.addAttribute("easyToStart", dao.findAll(map));
    	model.addAttribute("totalPage", dao.totalPage);
        model.addAttribute("totalRecord", dao.totalRecord);
        model.addAttribute("pageSIZE", dao.pageSIZE);
    	model.addAttribute("start", start);
    	
    	
    	
    	
    	
    	
    }
    
    @RequestMapping("/easyToStart/testETS")
	public String findAllETS(HttpSession session, Model model) {
		model.addAttribute("easyToStart", dao.ETS());		
		return "/easyToStart/testETS";
	}
    
    
    
    @GetMapping("/easyToStart/like/{no}")
    @ResponseBody
    public int getLikeCount(@PathVariable int no) {
    	dao.updateLikeETS(no);
    	return dao.findLikeETS(no);
    }
    
    
    @RequestMapping("/easyToStart/detail")
    public void detail(int no, Model model) {
    	dao.updateHitETS(no);
        model.addAttribute("n", dao.findByNoETS(no));
    }
    
    
}

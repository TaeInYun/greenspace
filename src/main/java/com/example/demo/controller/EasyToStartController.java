package com.example.demo.controller;

import com.example.demo.dao.CommentsDAO;
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
    @Autowired
    private CommentsDAO commmentsdao;
    
    
    @GetMapping("/easyToStart/easyToStartList")
	public String findAllETS(HttpSession session, Model model) {
		model.addAttribute("easyToStart", dao.ETS());		
		return "/easyToStart/easyToStartList";
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
        model.addAttribute("comments", commmentsdao.findAllCommentByEts_no(no));
    }
    
    
}

package com.example.demo.controller;

import com.example.demo.dao.EasyToStartDAO;
import com.example.demo.dao.MemberDAO;
import lombok.Setter;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Setter
public class EasyToStartController {

    @Autowired
    private EasyToStartDAO dao;

    @GetMapping(value =  "/easyToStart/easyToStartList")
    public void easyToStartForm(HttpSession session, Model model, @RequestParam(value="pageNUM", defaultValue = "1") int pageNUM) {
        
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
}

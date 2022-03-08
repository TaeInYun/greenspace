package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.PointDAO;
 

import lombok.Setter;

@Controller
@Setter
public class PointController {
	
	@Autowired
	private PointDAO dao;
	
	@Autowired
	private MemberDAO memberdao;
	 
	@RequestMapping("mypage/myPointList")
	public void findPresentPoint(Model model,int no,String filter ) {		 
		 model.addAttribute("findPresentPoint", dao.findPresentPoint(no));	
		 HashMap map = new HashMap();
		 map.put("filter", filter);
		 map.put("no", no);
		 model.addAttribute("findAllPointByNO", dao.findAllPointByNO(map)); 
	}
	
	
		
		 
}

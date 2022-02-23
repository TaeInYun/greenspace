package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Pro_add_optionDAO;
import com.example.demo.dao.ProductDAO;
 
import com.example.demo.vo.Pro_add_optionVO;
import com.example.demo.vo.ProductVO;

import lombok.Setter;

@Controller
@Setter
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	 
	@RequestMapping("/test")
	public void shopHeader() {
		
	}	
	
	@RequestMapping("/shop/listProduct_home")
	public void listProduct(HttpSession session, Model model, String cat_code, String keyword) {
	 
		
		
		if( keyword == null ) {
			if(session.getAttribute("keyword") != null ) {				 
				keyword = (String)session.getAttribute("keyword");
			}
		}
		
		
		System.out.println("검색어:"+keyword+"");
		System.out.println("cat_code:"+cat_code);
		
		HashMap map= new HashMap();
 
		map.put("keyword", keyword);
		map.put("cat_code", cat_code);
		model.addAttribute("list", dao.findAll_home(map));
	}
	
	//-------------------상품리스트-------------------- 
	@RequestMapping("/admin/listProduct")
	public void listProduct_admin(Model model) {
		model.addAttribute("list",dao.findAll());	 
	}
	
	//------------------상품추가하기-------------------- 
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.GET)
	public void insertForm() {		 
	}		
	
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.POST)
	public ModelAndView insertSubmit(ProductVO p, HttpServletRequest request, String cat_code,Pro_add_optionVO po ) {
		ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");
		
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);
		
		p.setPRO_THUMBNAIL("");		
		MultipartFile uploadFile = p.getUploadFile();
		
		
		String PRO_THUMBNAIL = uploadFile.getOriginalFilename();
		if(PRO_THUMBNAIL != null && !PRO_THUMBNAIL.equals("")) {
			p.setPRO_THUMBNAIL(PRO_THUMBNAIL);
		}	
		
		int re = dao.insert(p);
		//int re2 = dao2.insert(po);
		 
		if(re != 1 ) {
			mav.setViewName("error");
			mav.addObject("msg", "상품등록에 실패하였습니다.");
		}else {
			try {
				byte []data = uploadFile.getBytes();
				if(PRO_THUMBNAIL != null && !PRO_THUMBNAIL.equals("")) {
					FileOutputStream fos = new FileOutputStream(path + "/"+PRO_THUMBNAIL);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}	
		}		
		return mav;
	}
	
	
	
	//------------------상품자세히--------------------
	@RequestMapping("/shop/detailProduct")
	public void detail(int no, Model model, HttpSession session) {	
		dao.updateHit(no);		
	 	dao.findOption(no);
	 	
		model.addAttribute("p", dao.findByNo(no));	  	
	 	model.addAttribute("cnt", dao.findOptionView(no));
		model.addAttribute("op", dao.findOption(no));	
		//model.addAttribute("name", dao.findOptionName(no));	
		
	}
	 
	@ResponseBody
	@RequestMapping(value ="test.action")
	public void test(String userName,HttpServletRequest request){
		 System.out.print(request.getParameter("userName"));
		 System.out.print(userName);
	}
	
	
 

	@ResponseBody
	@RequestMapping("/findOptionName")
	public List<ProductVO> list(int no) {	
		return dao.findOptionName(no);
	}
	 
	@ResponseBody
	@RequestMapping("/findOptionDetailName")
	public List<ProductVO> list(ProductVO p){
		HashMap map = new HashMap();
		map.put("pro_option_name", p.getPro_option_name());		 
		map.put("no", p.getNo());
		
		return dao.findOptionDetailName(map);
	}
	
	
	
	
	
	
	//------------------상품수정하기--------------------
	
	@RequestMapping(value = "/admin/updateProduct", method = RequestMethod.GET)
	public void updateForm(int no, Model model) {
		model.addAttribute("p", dao.findByNo(no));
	}
	
	@RequestMapping(value = "/admin/updateProduct", method = RequestMethod.POST)
	public ModelAndView updateSubmit(ProductVO p, HttpServletRequest request) {
		
		String path = request.getRealPath("upload");
		ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");
		String oldFname = p.getPRO_THUMBNAIL();
		MultipartFile uploadFile = p.getUploadFile();
		String PRO_THUMBNAIL = uploadFile.getOriginalFilename();
		if(PRO_THUMBNAIL != null && !PRO_THUMBNAIL.equals("")) {
			p.setPRO_THUMBNAIL(PRO_THUMBNAIL);
		}
		int re = dao.update(p);
		if(re == 1) {
			
			if(PRO_THUMBNAIL != null && !PRO_THUMBNAIL.equals("")) {
				try {
					byte []data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + PRO_THUMBNAIL);
					fos.write(data);
					fos.close();
					
				 
					if(oldFname != null && !oldFname.equals("")) {
						File file = new File(path + "/" +oldFname);
						file.delete();
					}
				}catch (Exception e) {
					// TODO: handle exception
				}
			}
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "수정에 실패하였습니다.");
		}
		
		
		return mav;
	}
	
	//------------------상품삭제하기-------------------- 
	@RequestMapping(value = "/admin/deleteProduct", method = RequestMethod.GET)
	public void deleteForm(int no, Model model) {
		model.addAttribute("no", no);
	}
	
	@RequestMapping(value = "/admin/deleteProduct", method = RequestMethod.POST)
	public ModelAndView deleteSubmit(int no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");
		String oldFname = dao.findByNo(no).getPRO_THUMBNAIL();		
		 
		int re = dao.delete(no);
		if(re == 1) {
			if(oldFname != null && !oldFname.equals("")) {
				String path = request.getRealPath("upload");
				File file = new File(path + "/" + oldFname);
				file.delete();
			}
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "게시물 삭제에 실패하였습니다.");
		}
		
		return mav;
	}
	
	
	
}

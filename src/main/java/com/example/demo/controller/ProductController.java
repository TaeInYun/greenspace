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
	
	@Autowired
	private Pro_add_optionDAO prodao;
   
	//-------------------shop main----------------
	@RequestMapping("/shop/listProduct_home")
	public void findAll_home(HttpSession session, Model model, String cat_code, String keyword,String filter,String filterASC) {
	  	 
		HashMap map= new HashMap();
		map.put("keyword", keyword);
		map.put("cat_code", cat_code);
		map.put("filter", filter);
		map.put("filterASC", filterASC);
		
		model.addAttribute("list", dao.findAll_home(map));		
		
	}
	
	//-------------------admin 상품리스트-------------------- 
	@RequestMapping("/admin/listProduct")
	public void listProduct_admin(Model model,
			HttpSession session,
			String orderColumn,
			String keyword,
			String searchColumn,
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM) {
		
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
		
		HashMap map= new HashMap();
	 
		map.put("orderColumn", orderColumn);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("list",dao.findAll(map));
	}
	
	 
	//------------------상품자세히--------------------
		@RequestMapping("/shop/detailProduct")
		public void detail(int no, Model model) {	
			dao.updateHit(no);				 	
			model.addAttribute("p", dao.findByNo(no));	  	
		 	model.addAttribute("cnt", dao.findOptionView(no));
		}
		
		
	//------------------상품자세히_관리자--------------------
		@RequestMapping("/admin/detailProduct")
		public void detailProduct_admin(int no, Model model) {	
			model.addAttribute("p", dao.findByNo(no));	  	
		 	model.addAttribute("cnt", dao.findOptionView(no));
			model.addAttribute("findOptionByProNo", prodao.findOptionByProNo(no));
			
		}
	
	
	//------------------관리자 상품추가하기-------------------- 
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.GET)
	public void insertForm() {		 
	}		
	
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.POST)
	public ModelAndView insertSubmit(ProductVO p, HttpServletRequest request, String cat_code,Pro_add_optionVO po ) {
		//ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");
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
	
	
	//-----------------옵션-------------------
		@RequestMapping(value = "/admin/insertProductOption", method = RequestMethod.GET)
		public void insertOptionForm(int no, Model model) {		
			model.addAttribute("p", dao.findByNo(no));
			model.addAttribute("findDBOption", dao.findDBOption()); //p.no에 따른 이미 DB에 있는 옵션
			model.addAttribute("cnt", dao.findOptionView(no));
			model.addAttribute("findOptionByProNo", prodao.findOptionByProNo(no));
			
			 
		}		
		
		@RequestMapping(value = "/admin/insertProductOption", method = RequestMethod.POST)
		public ModelAndView insertOptionSubmit(  Model model, Pro_add_optionVO po) {
			ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");	
			int re= prodao.insert(po);
			if(re!=1) {
				 model.addAttribute("msg","옵션 삽입에 실패하였습니다");
				 mav.setViewName("error");
			}			
			return mav;
		}
		
		
	//--상품에 대한 옵션 추가 ajax	
		@ResponseBody
		@RequestMapping("/findDBDetailOption")
		public List<ProductVO> findOptionDetailName(String pro_option_code) {		 
			return dao.findDBDetailOption(pro_option_code);	  	
		}
		
	 
	//--구매시의 옵션 추가 ajax	
		@ResponseBody
		@RequestMapping("/findOptionName")
		public List<ProductVO> findOptionName(int no) {		 
			return dao.findOptionName(no);	  	
		}
		
	//--구매시의 옵션 추가 ajax		
		@ResponseBody
		@RequestMapping("/findOptionDetailName")
		public List<ProductVO> findOptionDetailName(int no,String pro_option_name ) {		 
			
			HashMap map= new HashMap();
			map.put("pro_option_name", pro_option_name);
			map.put("no", no);
			return dao.findOptionDetailName(map);	  	
		}
		
 
		
		@RequestMapping(value = "/admin/deleteProductOption", method = RequestMethod.GET)
		public void deleteProductOptionget(int no, Model model ) {
			model.addAttribute("no", no);
		}

		@RequestMapping(value = "/admin/deleteProductOption", method = RequestMethod.POST)
		public ModelAndView deleteProductOption(int no, Model model,Pro_add_optionVO po) {
			ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");
			model.addAttribute("no", no);
			int re= prodao.delete(no);
			
			if(re!=1) {
				mav.setViewName("error");
			} 
			return mav;
		}
		
}

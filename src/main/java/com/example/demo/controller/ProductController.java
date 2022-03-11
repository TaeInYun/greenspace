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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.CartDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.Pro_add_optionDAO;
import com.example.demo.dao.ProductDAO;
import com.example.demo.dao.ReviewDAO;
import com.example.demo.vo.AddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MyWishVO;
import com.example.demo.vo.Pro_add_optionVO;
import com.example.demo.vo.ProductVO;

import lombok.Setter;

@Controller
@Setter
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private Pro_add_optionDAO prodao;
	@Autowired
	private AddressDAO addrDao;
	@Autowired
	private MemberDAO dao_member;
	
	
 
	@RequestMapping("/header")
	public void header() {
	}
	@RequestMapping("main/nonmember")
	public void Index() {
	}
   
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
		 	model.addAttribute("option", dao.findOptionName(no));
		 	model.addAttribute("op", dao.findOption(no));
		 	model.addAttribute("review",reviewDAO.findReviewByProno(no));
		}
		
		
	//------------------상품자세히_관리자--------------------
		@RequestMapping("/admin/detailProduct")
		public void detailProduct_admin(int no, Model model) {	
			model.addAttribute("p", dao.findByNo(no));	  	
		 	model.addAttribute("cnt", dao.findOptionView(no));
		 	model.addAttribute("review",reviewDAO.findReviewByProno(no));
			model.addAttribute("findOptionByProNo", prodao.findOptionByProNo(no));	

		 	model.addAttribute("option", dao.findOptionName(no));


		}
	
	
	//------------------관리자 상품추가하기-------------------- 
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.GET)
	public void insertForm() {		 
	}	
	
	
 
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.POST)
	public ModelAndView insertSubmit(ProductVO p, HttpServletRequest request) {
		 
		ModelAndView mav = new ModelAndView("redirect:/admin/listProduct");

		 
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);

		p.setPRO_THUMBNAIL("");		
	//	p.setPRO_THUMBNAIL2("");		
	 
		
		MultipartFile uploadFile = p.getUploadFile();
		//MultipartFile uploadFile1 = p.getUploadFile1();
 	
/*
		String PRO_THUMBNAIL2 = uploadFile2.getOriginalFilename();
		if(PRO_THUMBNAIL2 != null && !PRO_THUMBNAIL2.equals("")) {
			p.setPRO_THUMBNAIL2(PRO_THUMBNAIL2);
		}	
*/
		String PRO_THUMBNAIL = uploadFile.getOriginalFilename();
		if(PRO_THUMBNAIL!= null && !PRO_THUMBNAIL.equals("")) {
			p.setPRO_THUMBNAIL(PRO_THUMBNAIL);
		}
		
		int re = dao.insert(p);
	 

		if(re != 1 ) {
			 
			mav.setViewName("error");
			mav.addObject("msg", "상품등록에 실패하였습니다.");
		}else {
			try {
				/*
				byte []data = uploadFile1.getBytes();
				if(PRO_THUMBNAIL1 != null && !PRO_THUMBNAIL1.equals("")) {
					FileOutputStream fos = new FileOutputStream(path + "/"+PRO_THUMBNAIL1);
					fos.write(data);
					fos.close();
 		  
				}
				*/
				byte []data = uploadFile.getBytes();
				if(PRO_THUMBNAIL != null && !PRO_THUMBNAIL.equals("")) {
					FileOutputStream fos2 = new FileOutputStream(path + "/"+PRO_THUMBNAIL);
					fos2.write(data);
					fos2.close();
 		  
				}
			}catch (Exception e) {
				System.out.print("예외발생"+ e.getMessage());
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
		ModelAndView mav = new ModelAndView("redirect:/admin/detailProduct"+"?no="+p.getNo());
		
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
	public ModelAndView deleteSubmit(int no, HttpServletRequest request, ProductVO p) {
		ModelAndView mav = new ModelAndView("redirect:/admin/listProduct" );
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
		public ModelAndView insertOptionSubmit(Model model,  Pro_add_optionVO po) {
			 
			ModelAndView mav = new ModelAndView("redirect:/admin/insertProductOption"+"?no="+po.getPro_no());	
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
		public ProductVO findOptionName(int no) {		 
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
		public void deleteProductOptionget(int no, Model model,int pro_no ) {			 
			 model.addAttribute("no", no);
			 model.addAttribute("pro_no", pro_no);
		}

		
		@RequestMapping(value = "/admin/deleteProductOption", method = RequestMethod.POST)
		public ModelAndView deleteProductOption( int no, Model model,int pro_no) {
			//admin/insertProductOption?no=31
			
			ModelAndView mav = new ModelAndView("redirect:/admin/insertProductOption"+"?no="+pro_no);			
			
			HashMap map= new HashMap();
			map.put("pro_no", pro_no);
			map.put("no", no);
			
			int re= prodao.delete(map);
			 
			if(re!=1) {
				mav.setViewName("error");
			} 
			return mav;
		}
		
		@RequestMapping(value = "/shop/direct_order_form", method = RequestMethod.POST)
		@ResponseBody
		public String directOrderForm(HttpSession session,
				@RequestBody List<MyWishVO> data
		) {
			MemberVO m = (MemberVO)session.getAttribute("m");
			
			int member_no = m.getNo();
			List<String> receiverInfo = new ArrayList<String>();
			List<String> orderInfo= new ArrayList<String>();
			
			int rownum = 0;
			int totalPrice = 0;
			int totalDiscount=0;
			int deliveryPrice=2500;
			int totalSalePrice = 0;
			
			for(MyWishVO mw : data) {
				rownum += 1;
				mw.setRownum(rownum);
				totalPrice += mw.getPrice();
				totalSalePrice += mw.getSaleprice();
			}
			
			totalDiscount = totalPrice - totalSalePrice;
			
			if(totalSalePrice >= 50000) {
				deliveryPrice = 0;
			}
			
			MemberVO mb = dao_member.getMemberInfo(m.getNo());
			AddressVO addr = addrDao.getMainAddress(member_no);
			
			receiverInfo.add(addr.getNo() + "");
			receiverInfo.add(addr.getAddr_receiver());
			receiverInfo.add(addr.getAddr_phone());
			receiverInfo.add(addr.getAddr_postal());
			receiverInfo.add(addr.getAddr_road());
			receiverInfo.add(addr.getAddr_detail());
			receiverInfo.add(addr.getAddr_msg());
			
			orderInfo.add(totalPrice + "");
			orderInfo.add(totalDiscount + "");
			orderInfo.add(deliveryPrice + "");
			orderInfo.add(totalSalePrice + "");
			
			session.setAttribute("rownum", rownum);
			session.setAttribute("list", data);
			session.setAttribute("point", mb.getPoint_use());
			session.setAttribute("receiverInfo", receiverInfo);
			session.setAttribute("orderInfo", orderInfo);

			/*
			List<MyWishVO> list = new ArrayList<MyWishVO>();
			
			for(String pro_no : proInfo) { 
				int no = (Integer.parseInt(pro_no)); 
				rownum += 1;
				map.put("no", no);
				MyWishVO mw = dao_mywish.getProInfoForOrder(map);
				mw.setNo(no);
				mw.setRownum(rownum);
				list.add(mw);
			}
			MemberVO mb = dao_member.getMemberInfo(m.getNo());


			
			*/
			
			return "";
		}		
}

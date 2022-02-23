package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ReviewDAO;
import com.example.demo.vo.ProductVO;
import com.example.demo.vo.ReviewVO;

import lombok.Setter;

@Controller
@Setter
public class ReviewController {

	@Autowired
	private ReviewDAO dao;
	
	
	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}
	
	
	//-------------------리뷰전체리스트-------------------- 
		@RequestMapping("/admin/listReview")
		public void listProduct_admin(HttpSession session) {
			session.setAttribute("r2",dao.findAll());	 
		}
		
		
	//-------------------리뷰상세-------------------- 
		@RequestMapping("/shop/detailReview")
		public void detail(int no, Model model) {	
			dao.updateHit(no);
			model.addAttribute("r", dao.findAllDetail(no));
		}
		
		
	//-------------------리뷰상품순서리스트-------------------- 
		
		@RequestMapping("/shop/listReview_rate")
		public void rate(int pro_no, Model model) {	
			model.addAttribute("r", dao.findAllRate(pro_no));
		}	
		
	
	//-------------------리뷰작성하기-------------------- 
		
		@RequestMapping(value = "/admin/insertReview" , method = RequestMethod.GET)
		public void insertForm() {
			
		}
		
		@RequestMapping(value = "/admin/insertReview" , method = RequestMethod.POST)	
		public ModelAndView insertReview(ReviewVO r, HttpServletRequest request,HttpSession session) {
			//List<ReviewVO> list= (List<ReviewVO>)session.getAttribute("list");
			
			ModelAndView mav = new ModelAndView("redirect:/admin/listReview");
			String path = request.getRealPath("upload/review");
			String oldFname = r.getRe_thumbnail();
			MultipartFile uploadFile = r.getUploadFile();
			String thumbnail = uploadFile.getOriginalFilename();
			byte []data;
			try {
				data = uploadFile.getBytes();
				if(thumbnail != null && !thumbnail.equals("")) {
					r.setRe_thumbnail(thumbnail);
					FileOutputStream fos = new FileOutputStream(path +"/"+thumbnail);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			int re=dao.update(r);
			if(re ==1) {
				if(thumbnail !=null && !thumbnail.equals("")) {
					File file = new File(path + "/" + oldFname);
					file.delete();
				}
			}else {
				mav.setViewName("error");
				mav.addObject("msg", "상품수정에 실패하였습니다.");
			}
			return mav;

		}
		
		//-------------------리뷰수정하기--------------------
		
		@RequestMapping(value ="/updateReview", method =RequestMethod.GET)
		public void updateForm(int no, Model model){
			model.addAttribute("r", dao.findAllDetail(no));
		}
		
		@RequestMapping(value ="/updateReview", method =RequestMethod.POST)	
		public ModelAndView updateSubmit(ReviewVO r, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("redirect:/admin/listReview");
			String path = request.getRealPath("upload/review");
			String oldFname = r.getRe_thumbnail();
			MultipartFile uploadFile = r.getUploadFile();
			String thumbnail = uploadFile.getOriginalFilename();
			byte []data;
			try {
				data = uploadFile.getBytes();
				if(thumbnail != null && !thumbnail.equals("")) {
					r.setRe_thumbnail(thumbnail);
					FileOutputStream fos = new FileOutputStream(path +"/"+thumbnail);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			int re=dao.update(r);
			if(re ==1) {
				if(thumbnail !=null && !thumbnail.equals("")) {
					File file = new File(path + "/" + oldFname);
					file.delete();
				}
			}else {
				mav.setViewName("error");
				mav.addObject("msg", "상품수정에 실패하였습니다.");
			}
			return mav;
		}
		
		
		
		//-------------------리뷰삭제하기--------------------
		
		
		public ModelAndView delete(HttpServletRequest request, int no) {
			String oldFname = dao.findAllRate(no).getRe_thumbnail();
			
			ModelAndView mav = new ModelAndView("redirect:/listReview");
			int re = dao.delete(no);
			if(re == 1) {
				String path = request.getRealPath("upload/review");
				File file = new File(path + "/" + oldFname);
				file.delete();
			}else { 
				mav.setViewName("error");
				mav.addObject("msg", "리뷰삭제에 실패하였습니다.");
			}
			
			return mav;
		}
		
		
		
}

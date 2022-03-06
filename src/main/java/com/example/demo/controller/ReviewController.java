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
import com.example.demo.vo.MemberVO;
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
			List<ReviewVO> list = (List<ReviewVO>)dao.findAllRate(pro_no);
			System.out.println(list);
			model.addAttribute("list", list);
		}	
		
		
		
		
	//-------------------리뷰작성하기-------------------- 
		
		@RequestMapping(value = "/shop/insertReview" , method = RequestMethod.GET)
		public void insertForm(int pro_no, Model model) {
			model.addAttribute("pro_no", pro_no);
		}
		
		@RequestMapping(value = "/shop/insertReview" , method = RequestMethod.POST)	
		public ModelAndView insertReview(ReviewVO r, HttpServletRequest request,HttpSession session) {
			//List<ReviewVO> list= (List<ReviewVO>)session.getAttribute("list");
			
			System.out.println("insertReview 동작함.");
			System.out.println(r);
			ModelAndView mav = new ModelAndView("redirect:/admin/listReview");
			String path = request.getRealPath("upload/review");
			System.out.println("path:"+path);
			//String oldFname = r.getRe_thumbnail();
			MultipartFile uploadFile = r.getUploadFile();
			String thumbnail = uploadFile.getOriginalFilename();
			System.out.println("thumbnail:"+thumbnail);
			byte []data;
			try {
				data = uploadFile.getBytes();
				if(thumbnail != null && !thumbnail.equals("")) {
					System.out.println("업로드 파일있어요!");
					r.setRe_thumbnail(thumbnail);
					FileOutputStream fos = new FileOutputStream(path +"/"+thumbnail);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생:"+e.getMessage());
			}
			
			r.setRe_thumbnail(thumbnail);
			dao.insert(r);
			
			return mav;

		}
		
		//-------------------리뷰수정하기--------------------
		
		@RequestMapping(value ="/shop/updateReview", method =RequestMethod.GET)
		public void updateForm(int no, Model model){
			//model.addAttribute("pro_no", pro_no);
			//model.addAttribute("no", no);
			model.addAttribute("r", dao.findAllDetail(no));		
		}
		
		@RequestMapping(value ="/shop/updateReview", method =RequestMethod.POST)	
		public ModelAndView updateSubmit(ReviewVO r, HttpServletRequest request) {
			
			System.out.println("updateReview 동작함.");
			System.out.println(r);
			
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
		
		//findAllRate()
		
		@RequestMapping(value = "/shop/deleteReview" , method = RequestMethod.GET)
		public ModelAndView delete(HttpServletRequest request, int no) {
			String oldFname = dao.findAllDetail(no).getRe_thumbnail();
			
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

package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CommunityDAO;
import com.example.demo.dao.ImgDAO;
import com.example.demo.vo.CommunityVO;
import com.example.demo.vo.ImgVO;
import com.example.demo.vo.MemberVO;

@Controller
public class CommunityController {

	@Autowired
	private CommunityDAO dao;
	
	@Autowired
	private ImgDAO imgdao;
	

	// 자유게시판 목록
	@RequestMapping("/board/listCommunity")
	public void listCommunity(Model model) {
		
		model.addAttribute("list", dao.findCommunity());
		
	}
	
	//-------자유 게시판 등록------------
	@RequestMapping(value="/board/insertCommunity", method = RequestMethod.GET)
	public ModelAndView insertCerBoard(Model model,HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberVO m = (MemberVO)session.getAttribute("m");
			if(m!=null) {
			int member_no = m.getNo();
			
			}else {
				mav.setViewName("redirect:/login");
			}
			return mav;
	}
	
	
	@RequestMapping(value="/board/insertCommunity", method = RequestMethod.POST)
	public ModelAndView insertCerBoard_submit(HttpServletRequest request,CommunityVO c, MultipartHttpServletRequest mhsq)
	throws IllegalStateException,IOException{

		ModelAndView mav = new ModelAndView("redirect:/board/listCommunity");

		int re = dao.insert(c);
		
		// !! 해당 테이블mapper에 insert문 시퀀스 부분 수정 필요(communityMapper참고)
		int commu_no = c.getNo();
		System.out.println("게시물번호"+commu_no);
		
		//해당 테이블 업로드 경로 설정
		String path = request.getRealPath("upload/commu");
		System.out.println("path:"+path);
		
		//위 경로 폴더없음 폴더만들어주라
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		
		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("uploadFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename();
             // 저장되는 파일 이름 
                String saveFileName = genId + "." + FilenameUtils.getExtension(originalfileName);

                long fileSize = mf.get(i).getSize(); // 파일 사이즈
               
                String savePath = path +"/"+saveFileName; // 저장 될 파일 경로
                //System.out.println("저장경로"+savePath);
                mf.get(i).transferTo(new File(path +"/"+saveFileName)); // 파일 저장

                
                //img테이블 저장
        		HashMap<String, Object> map = new HashMap<>();     	    
        		map.put("originalfileName", originalfileName);
        	    map.put("saveFileName", saveFileName);
        	    map.put("commu_no", commu_no);

        	    imgdao.uploadFile(map);
                
			}
        }
	
		return mav;
	}
	
	
/*
	
	//------------------커뮤니티 수정하기--------------------
	@RequestMapping(value = "/board/updateCommunity", method = RequestMethod.GET)
	public void updateForm(int no, Model model,HttpSession session) {
		model.addAttribute("c", dao.getCommunity(no));	
		model.addAttribute("imglist", imgdao.listCommuImg(no));
	}
	
	
	@RequestMapping(value = "/board/updateCommunity", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CommunityVO c, HttpServletRequest request,Model model) {

		ModelAndView mav = new ModelAndView("redirect:/board/listCommunity");
		String path = request.getRealPath("upload/commu");
		
		//이미지테이블에 해당 게시물 이미지 잇나 체크
		List<ImgVO> list = imgdao.listCommuImg(no);
	
		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("uploadFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename();
             // 저장되는 파일 이름 
                String saveFileName = genId + "." + FilenameUtils.getExtension(originalfileName);

                long fileSize = mf.get(i).getSize(); // 파일 사이즈
               
                String savePath = path +"/"+saveFileName; // 저장 될 파일 경로
                //System.out.println("저장경로"+savePath);
                mf.get(i).transferTo(new File(path +"/"+saveFileName)); // 파일 저장

                
                //img테이블 저장
        		HashMap<String, Object> map = new HashMap<>();     	    
        		map.put("originalfileName", originalfileName);
        	    map.put("saveFileName", saveFileName);
        	    map.put("commu_no", commu_no);

        	    imgdao.uploadFile(map);
                
			}
        }
		
		
	}
	
	*/
	
	//--------커뮤니티 상세----------------
	@RequestMapping("/board/detailCommunity")
	public void detail(Model model,int no,HttpSession session) {
		//조회수 업
		dao.updateHitCommu(no);
		//해당 게시물 정보
		model.addAttribute("c", dao.getCommunity(no));
		//해당 게시물 이미지 보이기
		model.addAttribute("imglist", imgdao.listCommuImg(no));
	}


	//------------------커뮤니티 게시판 삭제하기-------------------- 
	@RequestMapping(value = "/board/deleteCommunity")
	public ModelAndView delete(HttpServletRequest request, int no) {

		//이미지테이블에 해당 게시물 이미지 잇나 체크
		List<ImgVO> list = imgdao.listCommuImg(no);
		
		ModelAndView mav = new ModelAndView("redirect:/board/listCommunity");
		String path = request.getRealPath("upload/commu");
			
			//이미지가 있다면 파일 삭제
			if(!list.isEmpty()) {
			
				for( ImgVO i:list) {
					
					String oldFname = i.getSave_img_name();
					System.out.println(oldFname);
					
					File file = new File(path + "/" + oldFname);
					
						file.delete();
						System.out.println("파일삭제성공");
		
				}
				//해당 게시물 번호 이미지테이블 레코드 삭제
				imgdao.deleteCommuImg(no);
				System.out.println("이미지레코드삭제성공");
			}
			
			//게시판 삭제	
			int re = dao.deleteCommunity(no);
			
			if(re==1) {
			System.out.println("게시물 삭제 성공");
		}else { 
			mav.setViewName("error");
			mav.addObject("msg", "게시물 삭제에 실패하였습니다.");
		}
			
			return mav;
	}
	
	
}


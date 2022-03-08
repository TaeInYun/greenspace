package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 public void listCommunity(HttpSession session,  Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언
             @RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
) {

		//현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
		int start = (pageNUM-1)* dao.pageSIZE;
		
		int end = start + dao.pageSIZE - 1;
		//Dao가 게시물 목록을 검색할 때 필요한
		//정보(현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("totalRecord", dao.totalRecord);
		map.put("totalPage", dao.totalPage);
		System.out.println(map);
		
		//dao를 통해 검색한 결과를 model에 저장
		//이대 findAll메소드에서 전체레코드수를 구하고
		//그 값을 갖고 전체페이지수도 계산
		model.addAttribute("list", dao.findAllCommunity(map));
		//dao에 계산된 전체페이지수를 model에 상태유지합니다.
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("totalRecord", dao.totalRecord);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("pageSIZE", dao.pageSIZE);

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
	throws Exception {

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
        List<MultipartFile> files = mhsq.getFiles("files");
        if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {
        	files = mhsq.getFiles("files");
        	System.out.println("files.size() == 1 "+files);
        } else {
        	for (MultipartFile mf : files) {
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mf.getOriginalFilename();
             // 저장되는 파일 이름 
                String saveFileName = genId + "." + FilenameUtils.getExtension(originalfileName);
             
                long fileSize = mf.getSize(); // 파일 사이즈
               
                String savePath = path +"/"+saveFileName; // 저장 될 파일 경로
                //System.out.println("저장경로"+savePath);
                mf.transferTo(new File(path +"/"+saveFileName)); // 파일 저장
                
                //img테이블 저장
        		HashMap<String, Object> map = new HashMap<>();     	    
        		map.put("originalfileName", originalfileName);
        	    map.put("saveFileName", saveFileName);
        	    map.put("commu_no", commu_no);
        	    imgdao.uploadFile(map);
			}
        }//파일저장 if end
	
		return mav;
	}
	
	


	//------------------커뮤니티 수정하기--------------------
	@RequestMapping(value = "/board/updateCommunity", method = RequestMethod.GET)
	public void updateForm(int no, Model model,HttpSession session) {
		model.addAttribute("c", dao.getCommunity(no));	
		model.addAttribute("imglist", imgdao.listCommuImg(no));

	}

	
	@RequestMapping(value = "/board/updateCommunity", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CommunityVO c, HttpServletRequest request,Model model,MultipartHttpServletRequest mhsq)
	throws Exception {
		
		ModelAndView mav = new ModelAndView("redirect:/board/listCommunity");
		String path = request.getRealPath("upload/commu");
		int commu_no = c.getNo();
		
		
		//이미지테이블에 이미지정보 리스트
		List<ImgVO> list = imgdao.listCommuImg(commu_no);
	

     	//전달되어온 파일 정보
		 List<MultipartFile> multipartList = c.getFiles();
		 System.out.println("업로드한파일수"+multipartList.size());
	    
		 String multipartOrigName=null;
		 
		 // 전달되어온 파일 하나씩 검사
		 for (MultipartFile multipartFile : multipartList) { 
             // 파일의 원본명 얻어오기
            multipartOrigName = multipartFile.getOriginalFilename();
             System.out.println("저장되어있는이름"+multipartOrigName);
		 }
		 
		 if(multipartOrigName != null && !multipartOrigName.equals("")) {
			 System.out.println("파일수정했어요");
			
			 //기존에 있는 이미지 삭제 
					for( ImgVO i:list) {
						String oldimgname = i.getSave_img_name();
						System.out.println(oldimgname);
						
						File file = new File(path + "/" + oldimgname);
						
							file.delete();
							System.out.println("파일삭제성공");
							
							//해당 게시물 번호 이미지테이블 레코드 삭제
							imgdao.delete(i.getNo());
							System.out.println("이미지레코드삭제성공");
					}
					
			 //새로운 이미지 추가
					 List<MultipartFile> files = mhsq.getFiles("files");
				        if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {
				        	files = mhsq.getFiles("files");
				        	System.out.println("files.size() == 1 "+files);
				        } else {
				        	for (MultipartFile mf : files) {
				                // 파일 중복명 처리
				                String genId = UUID.randomUUID().toString();
				                // 본래 파일명
				                String originalfileName = mf.getOriginalFilename();
				             // 저장되는 파일 이름 
				                String saveFileName = genId + "." + FilenameUtils.getExtension(originalfileName);
				             
				                long fileSize = mf.getSize(); // 파일 사이즈
				               
				                String savePath = path +"/"+saveFileName; // 저장 될 파일 경로
				                //System.out.println("저장경로"+savePath);
				                mf.transferTo(new File(path +"/"+saveFileName)); // 파일 저장
				                
				                //img테이블 저장
				        		HashMap<String, Object> map = new HashMap<>();     	    
				        		map.put("originalfileName", originalfileName);
				        	    map.put("saveFileName", saveFileName);
				        	    map.put("commu_no", commu_no);
				        	    imgdao.uploadFile(map);
							}
				  }//레코드 추가 if end
					
			
		 }else {
			 System.out.println("파일수정하지않아요");
		 }
		 //게시판 수정메소드
		 int re = dao.updateCommunity(c);
		 System.out.println("게시물 수정 성공");
		 
		return mav;       
}
	
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
			if(!CollectionUtils.isEmpty(list)) {
			
				for( ImgVO i:list) {
					
					String oldFname = i.getSave_img_name();
					System.out.println(oldFname);
					
					File file = new File(path + "/" + oldFname);
					
						file.delete();
						System.out.println("파일삭제성공");
						
						//해당 게시물 번호 이미지테이블 레코드 삭제
						imgdao.delete(i.getNo());
						System.out.println("이미지레코드삭제성공");
				}
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
	
	// My 커뮤니티 게시판 목록
	@RequestMapping("/mypage/myCommunity")
	public void listMyCommu(HttpSession session,  Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언
            @RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			) {
		
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		
		//현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
		int start = (pageNUM-1)* dao.pageSIZE;
		
		int end = start + dao.pageSIZE - 1;
		//Dao가 게시물 목록을 검색할 때 필요한
		//정보(현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("totalRecord", dao.totalRecord);
		map.put("totalPage", dao.totalPage);
		map.put("member_no", member_no);
		
		System.out.println(map);
		//dao를 통해 검색한 결과를 model에 저장
		//이대 findAll메소드에서 전체레코드수를 구하고
		//그 값을 갖고 전체페이지수도 계산
		model.addAttribute("list", dao.findCommuByMember(map));	
		//dao에 계산된 전체페이지수를 model에 상태유지합니다.
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("totalRecord", dao.totalRecord);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("pageSIZE", dao.pageSIZE);


	}

	
}
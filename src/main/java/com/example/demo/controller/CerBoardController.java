package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CerBoardDAO;
import com.example.demo.dao.ChallengeUserDAO;
import com.example.demo.dao.ImgDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.PointDAO;
import com.example.demo.vo.CerBoardVO;
import com.example.demo.vo.ImgVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.PointVO;

@Controller
public class CerBoardController {

	@Autowired
	private CerBoardDAO dao;

	@Autowired
	private ChallengeUserDAO userdao;
	
	@Autowired
	private PointDAO pointDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ImgDAO imgdao;
	
	
	// 인증 게시판 목록
	@RequestMapping("/board/listCerBoard")
	 public void listChg(HttpSession session,  Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언
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
		model.addAttribute("list", dao.findCerBoard(map));
		//dao에 계산된 전체페이지수를 model에 상태유지합니다.
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("totalRecord", dao.totalRecord);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("pageSIZE", dao.pageSIZE);

	}
	
	
	//-------인증 게시판 등록------------
	@RequestMapping(value="/board/insertCerBoard", method = RequestMethod.GET)
	public ModelAndView insertCerBoard(Model model,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO m = (MemberVO)session.getAttribute("m");

			if(m!=null) {
			int member_no = m.getNo();
			model.addAttribute("endlist", userdao.listChgUserByMemberNO(member_no));
			}else {
				mav.setViewName("redirect:/login");
			}
			return mav;
	}
	
	
	
	//-------인증 게시판 등록------------
		@RequestMapping(value="/board/insertCerBoard", method = RequestMethod.POST)
		public ModelAndView insertCerBoard_submit(CerBoardVO c,HttpServletRequest request,HttpSession session,
		MultipartHttpServletRequest mhsq) {
			ModelAndView mav = new ModelAndView("redirect:/board/listCerBoard");			
		
			MemberVO m = (MemberVO)session.getAttribute("m");
			HashMap map = new HashMap(); // 회원 포인트 업데이트 담을 map
		
			String cer_status=c.getCer_status();
			int member_no = c.getMember_no();
			int point_use = m.getPoint_use();
			
			
			String path = request.getRealPath("upload/cer");
			System.out.println("path:"+path);
			
			//위 경로 폴더없음 폴더만들어주라
			File file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			
			//썸네일
			c.setCer_thumbnail("");		
			MultipartFile uploadFile = c.getUploadFile();
			
			String cer_thumbnail = uploadFile.getOriginalFilename();
			if(cer_thumbnail != null && !cer_thumbnail.equals("")) {
				c.setCer_thumbnail(cer_thumbnail);
			}	
			
			int re = dao.insert(c);
			// !! 해당 테이블mapper에 insert문 시퀀스 부분 수정 필요
			//insert 한 후에 불러와야 게시물번호찍힘
			int cer_no = c.getNo();
			System.out.println("게시물번호"+cer_no);
			
			//이미지
			if(re != 1 ) {
				mav.setViewName("error");
				mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			}else {
				try {
					//썸네일
					byte []data = uploadFile.getBytes();
					if(cer_thumbnail != null && !cer_thumbnail.equals("")) {
						FileOutputStream fos = new FileOutputStream(path + "/"+cer_thumbnail);
						fos.write(data);
						fos.close();
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
			        		HashMap<String, Object> map1 = new HashMap<>();     	    
			        		map1.put("originalfileName", originalfileName);
			        	    map1.put("saveFileName", saveFileName);
			        	    map1.put("cer_no", cer_no);
			        	    imgdao.uploadFile(map1);
						}
			        }//파일저장 if end
					
					
					
				}catch (Exception e) {
					// TODO: handle exception
				}
				
				if(cer_status.equals("비공개")) {
					
				PointVO PointVO = new PointVO(0, null, "적립", 10, member_no, "CHG");
				pointDAO.insertPoint(PointVO);
				
				int point_save = PointVO.getPoint_amount();
				System.out.println("point_save"+point_save);
				
				
				//회원 포인트 수정
				map.put("member_no", member_no);
				map.put("point_save", point_save);
				memberDAO.insertBoardPoint(map);
				
				}else if(cer_status.equals("공개")){
					PointVO PointVO = new PointVO(0, null, "적립", 50, member_no, "PUB");
					pointDAO.insertPoint(PointVO);
					
					int point_save = PointVO.getPoint_amount();
					System.out.println("point_save"+point_save);
					//회원 포인트 수정
					map.put("member_no", member_no);
					map.put("point_save", point_save);
					memberDAO.insertBoardPoint(map);
			
				}
			}		
			return mav;
		}

	
	//------------------인증게시판 수정하기--------------------
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.GET)
	public void updateForm(int no, Model model,HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		
		model.addAttribute("endlist", userdao.listChgUserByMemberNO(member_no));
		model.addAttribute("c", dao.getCerBoard(no));
		model.addAttribute("imglist", imgdao.listCerImg(no));
		
	}
	
	
	@RequestMapping(value = "/board/updateCerBoard", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CerBoardVO c, HttpServletRequest request,Model model,HttpSession session,
			MultipartHttpServletRequest mhsq) throws Exception{

		ModelAndView mav = new ModelAndView("redirect:/board/detailCerBoard"+"?no="+c.getNo());
			
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		String cer_status=c.getCer_status();

		int cer_no = c.getNo();
		
		//이미지테이블에 이미지정보 리스트
		List<ImgVO> list = imgdao.listCerImg(cer_no);
		String path = request.getRealPath("upload/cer");
		
		//전달되어온 파일 정보
		 List<MultipartFile> multipartList = c.getFiles();
		String multipartOrigName=null;
		 
		 // 전달되어온 파일 하나씩 검사
		 for (MultipartFile multipartFile : multipartList) { 
            // 파일의 원본명 얻어오기
           multipartOrigName = multipartFile.getOriginalFilename();
            System.out.println("저장되어있는이름"+multipartOrigName);
		 }
	
		//썸넬 변경시 이름 변경
		String oldFname = c.getCer_thumbnail();
		MultipartFile uploadFile = c.getUploadFile();
		String thumbnail = uploadFile.getOriginalFilename();
		System.out.println("새로운 썸넬이름"+thumbnail);	
		
		byte []data;
		try {
			data = uploadFile.getBytes();
			if(thumbnail != null && !thumbnail.equals("")) {
			
				c.setCer_thumbnail(thumbnail);
				System.out.println("섬넬 설정");
				FileOutputStream fos = new FileOutputStream(path +"/"+thumbnail);
				fos.write(data);
				fos.close();
				
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		//이미지 변경
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
							System.out.println("이미지레코드 삭제성공");
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
				        	    map.put("cer_no", cer_no);
				        	    imgdao.uploadFile(map);
				        	    System.out.println("이미지 레코드 추가 성공");
							}
				  }//레코드 추가 if end
					
		 }else {
			 System.out.println("파일수정하지않아요");
		 }
		
		 int re = dao.updateCerBoard(c);
		 
		 if(re==1) {
			 
			 System.out.println("업데이트 성공");
			/*
			HashMap map = new HashMap();
			
			if(cer_status.equals("비공개")) {	
				System.out.println("비공개일때");
				
				PointVO pointvo = new PointVO(0, "", "적립", 10, member_no, "CHG");
				int point_amount = pointvo.getPoint_amount();
				String point_type_code = pointvo.getPoint_type_code();
				
				System.out.println(point_amount);
				System.out.println(point_type_code);
				
				map.put("point_amount", point_amount);
				map.put("point_type_code", point_type_code);
				map.put("member_no", member_no);
				map.put("cer_no", c.getNo());
				
				int rr = pointDAO.updateCerPoint(map);
				System.out.println("포인트수정"+rr);
				
				
				
				//회원포인트 수정
				int point_save = pointVO.getPoint_amount() -50 ;
				System.out.println("수정 : point_save"+point_save);
				
				map1.put("member_no", member_no);
				map1.put("point_save", point_save);
				memberDAO.insertBoardPoint(map1);				
				
				 
				}else if(cer_status.equals("공개")) {
					
					System.out.println("공개일때");
					
					PointVO pointvo = new PointVO(0, "", "적립",50, member_no, "CHG");
				
					int point_amount = pointvo.getPoint_amount();
					String point_type_code = pointvo.getPoint_type_code();
					
					System.out.println(point_amount);
					System.out.println(point_type_code);
					
					map.put("point_amount", point_amount);
					map.put("point_type_code", point_type_code);
					map.put("member_no", member_no);
					map.put("cer_no", c.getNo());
					
					int rr = pointDAO.updateCerPoint(map);
					System.out.println("포인트수정"+rr);
					
					//회원포인트 수정
					int point_save = pointVO.getPoint_amount()-10;
					System.out.println("point_save"+point_save);
					
					map1.put("member_no", member_no);
					map1.put("point_save", point_save);
					memberDAO.insertBoardPoint(map1);
				}*/
		 }else {
			 System.out.println("업데이트 실패");
		}
		return mav;
	}
	
	
	
	//인증게시판 상세
	@RequestMapping("/board/detailCerBoard")
	public void detail(Model model,int no,HttpSession session) {
		//MemberVO m = (MemberVO)session.getAttribute("m");
		dao.updateHitCer(no);	
		model.addAttribute("c", dao.getCerBoard(no));
		//해당 게시물 이미지 보이기
		model.addAttribute("imglist", imgdao.listCerImg(no));

	}

	
	//------------------인증 게시판 삭제하기-------------------- 
	@RequestMapping(value = "/board/deleteCerBoard")
	public ModelAndView deleteSubmit(int no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/board/listCerBoard");
		
		String path = request.getRealPath("upload/cer");
		
		//이미지테이블에 해당 게시물 이미지 잇나 체크
		List<ImgVO> list = imgdao.listCerImg(no);
		

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
		
		//썸네일
		String oldFname = dao.getCerBoard(no).getCer_thumbnail();		

		int re = dao.deleteCerBoard(no);
		if(re == 1) {
			//썸넬삭제
			if(oldFname != null && !oldFname.equals("")) {
				File file = new File(path + "/" + oldFname);
				file.delete();
				System.out.println("썸넬 삭제성공");
			}
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "게시물 삭제에 실패하였습니다.");
		}
		
		return mav;
	}
	
	
	
	// My 인증 게시판 목록
	@RequestMapping("/mypage/myCerBoard")
	public void listMyCer(HttpSession session,  Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언
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
		model.addAttribute("list", dao.findAllByMember(map));	
		//dao에 계산된 전체페이지수를 model에 상태유지합니다.
		model.addAttribute("totalPage", dao.totalPage);
		model.addAttribute("totalRecord", dao.totalRecord);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("pageSIZE", dao.pageSIZE);

	}
	
}

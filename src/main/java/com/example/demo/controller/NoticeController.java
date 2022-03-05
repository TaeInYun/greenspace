package com.example.demo.controller;


import com.example.demo.dao.NoticeDAO;
import com.example.demo.vo.NoticeVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
@Setter
public class NoticeController {

    @Autowired
    public NoticeDAO dao;

    //  @RequestMapping(value = "/notice/listNotice",method = RequestMethod.GET)
    //  public String getList(Model model){
    //      model.addAttribute("noticeList", dao.getList());
    //      return "/notice/listNotice";
    //  }


    @RequestMapping("/notice/listNotice")
    public void list(HttpSession session,  Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언
                     @RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
    ) {

        //현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
        int start = (pageNUM-1)* dao.pageSIZE + 1;
        int end = start + dao.pageSIZE - 1;

        //Dao가 게시물 목록을 검색할 때 필요한
        //정보(현재페이지에 보여줄 시작레코드,마지막레코드)
        //들을 map에 저장한다.
        HashMap map = new HashMap();
        map.put("start", start);
        map.put("end", end);
        map.put("totalRecord", dao.totalRecord);
        map.put("totalPage", dao.totalPage);

        //dao를 통해 검색한 결과를 model에 저장
        //이대 findAll메소드에서 전체레코드수를 구하고
        //그 값을 갖고 전체페이지수도 계산
        model.addAttribute("list", dao.findAll(map));
        //dao에 계산된 전체페이지수를 model에 상태유지합니다.
        model.addAttribute("totalPage", dao.totalPage);
        model.addAttribute("totalRecord", dao.totalRecord);
    }

    @RequestMapping("/notice/detail")
    public void detail(int no, Model model) {
        dao.updateHit(no);
        model.addAttribute("n", dao.findByNo(no));

    }

    @GetMapping(value = "/notice/insertNotice")
    public void insertNotice(){
    }

    @PostMapping(value = "/notice/insertNotice")
    public void insertNotice(HttpServletResponse response, @ModelAttribute NoticeVO notice, ModelAndView mav){
        int re = dao.insertNotice(notice);

        if(re != 1) {
            mav.setViewName("error");
            mav.addObject("msg", "공지사항 등록에 실패하였습니다.");
        }else {
            try{
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('게시물 등록이 완료되었습니다');");
                out.println("history.go(-2);");
                out.println("</script>");
                out.close();
            }catch (Exception e){
                System.out.println("예외발생" + e.getMessage());
            }

        }
    }
}

//    @PostMapping(value = "/notice/insertNotice")
//    public void insertNotice(@RequestParam String content, @RequestParam String title){
//        NoticeVO notice = new NoticeVO();
//        notice.setNotice_title(title);
//        notice.setNotice_content(content);
//        System.out.println(notice);
//
//    }

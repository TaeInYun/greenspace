package com.example.demo.controller;

import com.example.demo.dao.EasyToStartDAO;
import com.example.demo.dao.MemberDAO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Setter
public class EasyToStartController {

    @Autowired
    private EasyToStartDAO dao;

    @RequestMapping(value = "/easyToStart/easyToStartList", method = RequestMethod.GET)
    public String easyToStartForm(Model model) {
        model.addAttribute("getList", dao.getEasyToStartAll());
        return "/easyToStart/easyToStartList";
    }
}

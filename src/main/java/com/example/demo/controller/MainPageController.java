package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;

@Controller
@Setter
public class MainPageController {

	@RequestMapping("mainpage/nomember")
	@ResponseBody
	public void main() {
		
	}
}

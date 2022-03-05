package com.example.demo;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ImgDAO;
import com.example.demo.dao.MemberDAO;

import lombok.Setter;

@Service
@Setter
public class ImgService {
	
	@Autowired
	private ImgDAO dao;
	
	public void fileUpload(String originalfileName, String saveFileName) {
	    HashMap<String, Object> map = new HashMap<>();
	    map.put("originalfileName", originalfileName);
	    map.put("saveFileName", saveFileName);
	    
	     
	    dao.uploadFile(map);
	}
	
}

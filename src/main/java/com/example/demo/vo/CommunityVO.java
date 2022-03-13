package com.example.demo.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommunityVO {
	private int num;	
	private int no;
	private String commu_title;
	private String commu_content;
	private Date commu_date;
	private int commu_hit;
	private int member_no;
	private String nickname;
	private int levels;
	private String o_img_name;
	
	//private MultipartFile uploadFile;
	private List<MultipartFile> files;

}

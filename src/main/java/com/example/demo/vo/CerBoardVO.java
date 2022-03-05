package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CerBoardVO {
	private int num;
	private int no;
	private String cer_status;
	private String cer_content;
	private Date cer_date;
	private int cer_like;
	private int cer_hit;
	private int member_no;
	private int chg_user_no;
	private String nickname;
	private int levels;
	private String img_name;
	private String chg_title1;
	private String chg_title2;
	private String chg_title3;
	
	private String cer_thumbnail;
	private MultipartFile uploadFile;
	
}

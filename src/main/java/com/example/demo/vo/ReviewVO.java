package com.example.demo.vo;

import java.util.Date;

import org.apache.ibatis.javassist.bytecode.analysis.MultiArrayType;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int no;
	private String re_title;
	private String re_content;
	private Date re_date;
	private int pro_no;			//상품번호
	private int member_no;
	private int re_hit;
	private int re_like;
	private int order_no;
	private Double re_rate;			//평점
	private String re_thumbnail;	//썸네일이미지		
	private MultipartFile uploadFile;
}

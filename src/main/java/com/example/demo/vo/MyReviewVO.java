package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MyReviewVO {	//주문하는 상품 후기
	private String pro_img;	//상품이미지
	private String name;	//상품이름
	private String option_name; //상품옵션명
	private String option_detail; //옵션디테일
	private Date day;	//구매일
	private Double rate;	//별잠
	private String content;	//후기내용
	private String re_img;	//후기이미지
	private int cnt_comment;	//댓글수
	private int cnt_like;	//좋아요수 
	private String re_type;	//후기종류
}

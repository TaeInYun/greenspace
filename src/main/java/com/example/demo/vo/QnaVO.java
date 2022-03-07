package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVO {

	private int no;	//번호
	private String img_name; //상품사진
	private String pro_name; //상품명
	private String title;   //제목
	private String content;  //내용
	private String qna_type;  //문의유형
	private Date day;     //작성일
	private String status;  //처리상태
	private String ord_id;  //주문번호
	private String nickname;  //작성자(닉네임)
	private MultipartFile uploadFile;
	private int member_no;   //회원번호
	private int pro_no;
}

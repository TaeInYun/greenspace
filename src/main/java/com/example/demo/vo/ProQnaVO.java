package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProQnaVO {
	
	private int no;
	private String pro_qna_title;
	private String pro_qna_content;
	private String pro_qna_pwd;
	private Date pro_qna_date;
	private int pro_no;
	private int member_no;
	private String pro_qna_type_code;
	private String qna_status_code;
}

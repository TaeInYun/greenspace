package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OneVO {

	private int no;
	private String one_title;
	private String one_content;
	private String one_pwd;
	private Date one_date;
	private int ord_no;
	private int member_no;
	private String one_type_code;    //EXC교환 REF환불 CAN취소 ETC기타
	private String qna_status_code;  //WA
	private String one_type_name;  // 추가
	private String qna_type_name; //추가 답변대기 교환 
}

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
	private String one_type_code;
	private String qna_status_code;
}

package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChallengeUserVO {
	private int no;
	private Date chg_user_date;
	private int chg_no;
	private String chg_status_code;
	private String chg_title;
	private String chg_content;
	private int member_no;
	private int tree_num;
	
}

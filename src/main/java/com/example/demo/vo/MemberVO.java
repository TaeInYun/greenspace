package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVO {

	private int no;
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private String account_number;
	private String account_bank;
	private int point_use;
	private int point_save;
	private int levels;
	private int mem_type;
}

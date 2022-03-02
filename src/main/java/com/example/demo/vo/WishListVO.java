package com.example.demo.vo;

import lombok.Data;

@Data
public class WishListVO {
	private int no;
	private int pro_no;
	private int member_no;
	private int cnt;
	private int pro_add_option_no;
	
	private String pro_brand;
	private String pro_name;
	private String pro_option;
	private String pro_thumbnail;
	private String option_detail;
	private int price;
	private int saleprice;
	private int pro_add_price;
	private int stock;
}

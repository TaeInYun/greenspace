package com.example.demo.vo;

import lombok.Data;

@Data
public class CartVO {
	private int no;
	private String cart_option;
	private String cart_option_detail;
	private String cart_name;
	private int cart_price;
	private int cart_saleprice;
	int cart_qty;
	int pro_no;
	int member_no;
}

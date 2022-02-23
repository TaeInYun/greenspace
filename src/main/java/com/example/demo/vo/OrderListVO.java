package com.example.demo.vo;

import java.util.Date;

import lombok.Data;
@Data
public class OrderListVO {
	//주문정보
	private String id;
	private String status;
	private Date day;
	private int delivery_price;
	private String delivery_number;
	
	//배송자정보
	private String addr_road;
	private String addr_detail;
	private String addr_name;
	private String addr_phone;
	private String addr_msg;
	
	//주문자정보
	private String phone;
	private String name;
	private int point;
	private String payment;
	
	//상품정보
	private String pro_name;
	private String option_name;
	private String option_detail;
	private String pro_qty;
	private int pro_price;
	private int pro_saleprice; 
	private int pro_discount; 
	private String pro_thumbnail;
}

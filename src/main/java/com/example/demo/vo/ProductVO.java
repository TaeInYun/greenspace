package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {	
	private int no;
	private String pro_name;
	private String pro_brand;
	private int pro_price;
	private int pro_saleprice;
	private int pro_stock;
	private int pro_delivery;
	private Date pro_date;
	private int pro_hit;
	private String pro_content;
	private String cat_code;
	private String cat_name;
 
	
	private String PRO_THUMBNAIL;
	 
	 
	private String pro_option_code;
	private String pro_option_name;
	private String pro_option_detail_name;
	private String pro_option_detail_code;
	
	
	private int pro_add_price;
	private int sum;
	 
	
	
	private MultipartFile uploadFile;
	 
	
}

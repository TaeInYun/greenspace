package com.example.demo.vo;

import lombok.Data;

@Data
public class OrderBillVO {
	private String ord_id;
	private int ord_price;
	private String apply_num;
	private String addr_postal;
	private String addr_road;
	private String addr_detail;
	private String addr_phone;
}

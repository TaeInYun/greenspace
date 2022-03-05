package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersVO {
	private int cnt;
	private int no;
	private String ord_id;
	private String ord_date;
	private int ord_use_point;
	private int ord_price;
	private int member_no;
	private String payment_code;
	private int address_no;
	private int receiver_no;
	private String ord_status_code;
	private String apply_num;
	private String imp_uid;
	private int total;
}

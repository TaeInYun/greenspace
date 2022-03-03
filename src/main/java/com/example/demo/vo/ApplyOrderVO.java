package com.example.demo.vo;

import java.util.List;

import lombok.Data;

@Data
public class ApplyOrderVO {
	private String ord_id;
	private int ord_use_point;
	private int ord_price;
	private String payment_code;
	private String ord_status_code;
	private String apply_num;
	private int address_no;
	private int receiver_no;
	private int point_save;
	private String imp_uid;
	private List<String> arr_cartNo;
}

package com.example.demo.vo;

import java.util.List;

import lombok.Data;

@Data
public class ApplyOrderVO {
	private OrdersVO orders;
	private List<String> arr_cartNo;
}

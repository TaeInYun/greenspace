package com.example.demo.vo;

import java.util.List;

import lombok.Data;

@Data
public class PagingOrderListVO {
	private List<OrderListVO> ord;
	private String period;
	private int totalPage;
}

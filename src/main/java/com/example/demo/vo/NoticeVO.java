package com.example.demo.vo;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {
    private int no;
    private String notice_title;
    private String notice_content;
    private Date notice_date;
    private int notice_hit;
}

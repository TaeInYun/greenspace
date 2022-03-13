package com.example.demo.vo;

import lombok.Data;

import java.util.Date;

@Data
public class EcoMagazineVO {
    private int no;
    private String eco_title;
    private int eco_like;
    private String eco_content;
    private Date eco_date;
    private int eco_hit;
    private String cat_code;
    private String eco_thumbnail;
}

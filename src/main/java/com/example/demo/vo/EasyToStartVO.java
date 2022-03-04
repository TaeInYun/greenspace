package com.example.demo.vo;

import lombok.Data;

@Data
public class EasyToStartVO {

    private int no;                 //게시글 번호
    private String ets_title;        //제목
    private int ets_like;            //좋아요 수
    private String ets_content;      //내용
    private Data ets_date;           //날짜
    private int ets_hit;             //조회수
    private String cat_code;        //카테고리 코드
    private String ets_thumbnail;    //썸네일 이미지

}

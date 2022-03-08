package com.example.demo.dao;

import com.example.demo.db.DBManager;
import com.example.demo.vo.EasyToStartVO;
import com.example.demo.vo.NoticeVO;

import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class EasyToStartDAO {

	public static int pageSIZE = 10;    //한 화면에 보여줄 레코드의 수
    public static int totalRecord;      //전체 레코드 수
    public static int totalPage;        //전체 페이지

 
    public List<EasyToStartVO> findAll(HashMap map){
        totalRecord = DBManager.getTotalRecordETS();
        totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
        return DBManager.findAllETS(map);
    }

    public EasyToStartVO findByNoETS(int no) {
        return DBManager.findByNoETS(no);
    }

    public void updateHitETS(int no) {
        DBManager.updateHitETS(no);
    }
    
    public void updateLikeETS(int no) {
        DBManager.updateLikeETS(no);
    }

    public int findLikeETS(int no) {
        return DBManager.findLikeETS(no);
    }

   
    public EasyToStartVO ETS() {
        return DBManager.ETS();
    }

}
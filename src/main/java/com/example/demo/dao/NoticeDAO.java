package com.example.demo.dao;

import com.example.demo.db.DBManager;
import com.example.demo.vo.NoticeVO;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class NoticeDAO {
    public static int pageSIZE = 10;    //한 화면에 보여줄 레코드의 수
    public static int totalRecord;      //전체 레코드 수
    public static int totalPage;        //전체 페이지


    //리스트 목록에 필요한 데이터 가져오기
    public List<NoticeVO> getList(){
        return  DBManager.getList();
    }

    //페이지로 나누기
    public List<NoticeVO> findAll(HashMap map){
        totalRecord = DBManager.getTotalRecord();
        totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
        return DBManager.findAllNotice(map);
    }

    public NoticeVO findByNo(int no) {
        return DBManager.findByNoNotice(no);
    }

    public int update(NoticeVO b) {
        return DBManager.updateNotice(b);
    }

    public int delete(HashMap map) {
        // TODO Auto-generated method stub
        return DBManager.deleteNotice(map);
    }

    public void updateHit(int no) {
        DBManager.updateHitNotice(no);
    }

    public int insertNotice(NoticeVO n){
        return DBManager.insertNotice(n);
    }
    
    public int deleteNotice(NoticeVO no) {
    	return DBManager.deleteNotice(no);
    }
}
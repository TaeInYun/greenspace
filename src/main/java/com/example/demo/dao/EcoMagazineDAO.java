package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.EasyToStartVO;
import com.example.demo.vo.EcoMagazineVO;

import lombok.Setter;

@Repository
public class EcoMagazineDAO {
	
    public List<EcoMagazineVO> findEcoMagazineAll() {
        return DBManager.findEcoMagazineAll();
    }

    public EcoMagazineVO findEcoMagazineByNo(int no) {
        return DBManager.findEcoMagazineByNo(no);
    }

    public void updateEcoMagazineHit(int no) {
        DBManager.updateEcoMagazineHit(no);
    }
    
    public void updateEcoMagazineLike(int no) {
        DBManager.updateEcoMagazineLike(no);
    }

    public int findEcoMagazineLike(int no) {
        return DBManager.findEcoMagazineLike(no);
    }

   


	
	
	
	
	
	
}

package com.example.demo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.ChallengeDAO;
import com.example.demo.dao.ChallengeListDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.ChallengeListVO;
import com.example.demo.vo.ChallengeVO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Service
@Setter
public class ChallengeService {

	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private ChallengeDAO chgdao;
	
	@Autowired
	private ChallengeListDAO listdao;
	
	// 챌린지리스트 추가하기
	public void insertChglist() {
		
		List<ChallengeVO> RandomChg = chgdao.selectChgRandom();
		List<MemberVO> listMember = mdao.findAllMember();
		
		HashMap map = new HashMap();

		for(MemberVO m : listMember) {
			int member_no = m.getNo();
			
			for(ChallengeVO c : RandomChg) {
				int chg_no = c.getNo();
				
				map.put("chg_no", chg_no);
				map.put("member_no", member_no);
				listdao.insertChglist(map);
				
				//System.out.println("멤버번호"+member_no +"챌린지번호"+ chg_no);
				System.out.println(map);
				
			}
		}
		System.out.println("챌린지 리스트 등록완료");
	}
}

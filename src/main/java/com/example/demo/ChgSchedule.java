package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.Setter;

@Component
@EnableScheduling
@Setter
public class ChgSchedule {
	
	@Autowired
	private ChallengeService challengeService;
	
	////@Scheduled(cron=“초 분 시간 일 월 요일 연도")
	@Scheduled(cron = "0 3 22 * * ?")
	public void insertChglist() {
		challengeService.insertChglist();
	}

}

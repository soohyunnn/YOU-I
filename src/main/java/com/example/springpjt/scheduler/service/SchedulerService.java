package com.example.springpjt.scheduler.service;

import java.util.List;

import com.example.springpjt.scheduler.model.dto.SchedulerVO;

public interface SchedulerService {
	
	//일정 추가
	public boolean calwrite(SchedulerVO schedulerVO) throws Exception;
	
	//일정 가져오기
	public List<SchedulerVO> getCalendarList(SchedulerVO schedulerVO) throws Exception;
	
	//디테일한 일정 가져오기
	public SchedulerVO calDetail(int seq) throws Exception;
	
	//일정 수정
	public boolean calUpdate(SchedulerVO schedulerVO)throws Exception;
	
	//일정 삭제
	public boolean calDelete(int seq) throws Exception;
	
}

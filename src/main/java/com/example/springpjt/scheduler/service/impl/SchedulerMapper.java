package com.example.springpjt.scheduler.service.impl;

import java.util.List;

import com.example.springpjt.scheduler.model.dto.SchedulerVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("schedulerMapper")
public interface SchedulerMapper {

	//일정 추가
	public boolean calwrite(SchedulerVO schedulerVO);
	
	//일정 가져오기
	public List<SchedulerVO> getCalendarList(SchedulerVO schedulerVO);
	
	//디테일한 일정 가져오기
	public SchedulerVO calDetail(int seq);
	
	//일정 수정
	public boolean calUpdate(SchedulerVO schedulerVO);
	
	//일정 삭제
	public boolean calDelete(int seq) throws Exception;

}

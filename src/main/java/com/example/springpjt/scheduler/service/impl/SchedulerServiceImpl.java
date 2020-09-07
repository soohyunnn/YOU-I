package com.example.springpjt.scheduler.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.springpjt.scheduler.model.dto.SchedulerVO;
import com.example.springpjt.scheduler.service.SchedulerService;

@Service
public class SchedulerServiceImpl implements SchedulerService {

	@Inject
	private SchedulerMapper schedulerDao;

	//일정 추가
	@Override
	public boolean calwrite(SchedulerVO schedulerVO) throws Exception {
	
		return schedulerDao.calwrite(schedulerVO);
		
	}
	
	//일정 가져오기
	@Override
	public List<SchedulerVO> getCalendarList(SchedulerVO schedulerVO) throws Exception {
		List<SchedulerVO> schedulerList = new ArrayList<SchedulerVO>();
		try {
			schedulerList = schedulerDao.getCalendarList(schedulerVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return schedulerList;
	}

	
	//디테일한 일정 가져오기
	@Override
	public SchedulerVO calDetail(int seq) throws Exception {
		
		return schedulerDao.calDetail(seq);
	}
	
	//일정 수정
	@Override
	public boolean calUpdate(SchedulerVO schedulerVO) throws Exception {

		return schedulerDao.calUpdate(schedulerVO);
	}

	
	//일정 삭제
	@Override
	public boolean calDelete(int seq) throws Exception {
		
		return schedulerDao.calDelete(seq);
	}
	
	
}

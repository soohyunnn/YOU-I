package com.example.springpjt.scheduler.web;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.springpjt.member.model.dto.MemberVO;
import com.example.springpjt.scheduler.model.dto.SchedulerVO;
import com.example.springpjt.scheduler.service.SchedulerService;

@Controller
@RequestMapping("/scheduler/")
public class SchedulerController {
	
	
	//로그 준비(접속이 잘되는지 확인)
	private static final Logger logger = LoggerFactory.getLogger(SchedulerController.class);
	
	@Inject
	private SchedulerService schedulerService;
	
	@RequestMapping(value="calendar.do", method = {RequestMethod.GET ,RequestMethod.POST})
	public String calendar(HttpSession session, Model model, String year, String month, HttpServletResponse response)throws Exception{
		logger.info("SchedulerController calendar");
		System.out.println("calendar()");
		Calendar cal = Calendar.getInstance();
		if((year == null)||year.equals("")&&(month==null)||month.equals("")){
			year = String.valueOf(cal.get(Calendar.YEAR));
			month = String.valueOf(cal.get(Calendar.MONTH)+1);
		}
		
		System.out.println("year:"+year+", month:"+month);
		
		if(month.length()<2){
			month="0"+month;
		}
		
		//아이디가져오기(아이디를 세션에 저장해야한다),아이디 저장이 안되있으면 메인페이지로 이동(controller자체에서 javascript사용 방법)
		MemberVO vo = (MemberVO)session.getAttribute("login");
		if(vo == null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); location.href='//localhost:8080/';</script>");		
			out.flush();

		}
		
		//db처리
		SchedulerVO svo = new SchedulerVO(vo.getUserId(),"","",year+month);
		List<SchedulerVO> list = schedulerService.getCalendarList(svo);
		model.addAttribute("list", list);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return "scheduler/calendar.tiles";
	}
	
	//일정 추가 페이지로 이동
	@RequestMapping(value="calwrite.do", method={RequestMethod.GET ,RequestMethod.POST})
	public String calwrite(Model model, String year,String month,String day) throws Exception{
		logger.info("SchedulerController calwrite");
		System.out.println("calwrite()");
		System.out.println("year:"+year+", month:"+month+", day:"+day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "scheduler/calwrite.tiles";
	}
	
	//일정 추가
	@RequestMapping(value="calwriteAf.do", method={RequestMethod.GET ,RequestMethod.POST})
	public String calwriteAf(Model model, SchedulerVO vo, String year, String month, String day, String hour, String min) throws Exception{
		logger.info("SchedulerController calwriteAf");
		System.out.println("calwriteAf()");
		//vo : id,title,content가저장됨
		
		if(month.length()<2){		//받아온 month이 길이가 2보다 작으면 즉 '2'와 같이 1자리 수이면 앞에 0을 붙여준다
			month = "0"+month;
		}
		if(hour.length()<2){
			hour = "0"+hour;
		}
		if(min.length()<2){
			min = "0"+min;
		}
		String date = year+month+day+hour+min;
		vo.setRdate(date);
		
		boolean isS = schedulerService.calwrite(vo);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("http://localhost:8080/scheduler/calendar.do");
		
		return "redirect:/scheduler/calendar.do";
	}
	
	//디테일한 일정 가져오기
	@RequestMapping(value="caldetail.do", method={RequestMethod.GET ,RequestMethod.POST})
	public String caldatail(Model model, int seq) throws Exception{
		logger.info("SchedulerController caldatail");
		System.out.println("caldatail()");
		
		SchedulerVO vo = schedulerService.calDetail(seq);
		
		model.addAttribute("vo", vo);
		
		return "scheduler/caldetail.tiles";
	}
	
	//일정 수정
	@RequestMapping(value="calupdate.do", method={RequestMethod.GET ,RequestMethod.POST})
	public String calupdate(Model model, int seq) throws Exception{
		logger.info("SchedulerController calupdate");
		System.out.println("calupdate()");
		
		SchedulerVO vo = schedulerService.calDetail(seq);
		
		model.addAttribute("vo", vo);
		return "scheduler/calupdate.tiles";
		
	}
	
	//일정 수정 실행
	@RequestMapping(value = "calupdateAf.do", method={RequestMethod.GET ,RequestMethod.POST})
	public String calupdateAf(Model model, SchedulerVO schedulerVO, String year, String month, String day, String hour, String min) throws Exception{
		logger.info("SchedulerController calupdate");
		System.out.println("calupdateAf()");
		
		if(month.length()<2){
			month = "0"+month;
		}
		if(day.length()<2){
			day = "0"+day;
		}
		if(hour.length()<2){
			hour="0"+hour;
		}
		if(min.length()<2){
			min = "0"+min;
		}
		
		String date = year+month+day+hour+min;
		schedulerVO.setRdate(date);
		
		boolean isS = schedulerService.calUpdate(schedulerVO);
		
		model.addAttribute("vo", schedulerVO);
		return "scheduler/caldetail.tiles";
		
	}
	
	//일정 삭제
	@RequestMapping(value="caldel.do", method={RequestMethod.GET ,RequestMethod.POST})
	public ModelAndView caldel(Model model, int seq) throws Exception{
		logger.info("SchedulerController caldel");
		System.out.println("caldel()");
		
		boolean isS = schedulerService.calDelete(seq);
		ModelAndView mv = new ModelAndView("redirect:calendar.do");
		
		return mv;
	}

	
}

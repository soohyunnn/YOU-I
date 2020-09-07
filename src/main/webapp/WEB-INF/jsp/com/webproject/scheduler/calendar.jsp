<%@page import="com.example.springpjt.scheduler.model.dto.SchedulerVO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.springpjt.member.model.dto.MemberVO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
header.masthead {
	display: none;
}
</style>
<body>

	<%!//들어온 값이 null이라면 true로 반환
	public boolean nvl(String msg) {
		return msg == null || msg.trim().equals("") ? true : false;
	}

	//callist: 날짜를 클릭하면, 그날의 일정이 모두 보이게하는 callist.jsp로 이동시키는 함수
	public String callist(int year, int month, int day) {
		String s = "";
		s += String.format("<a href='%s?year=%d&month=%d&day=%d'>", "callist.do", year, month, day);
		s += String.format("%2d", day);
		s += "</a>";

		return s;

	}

	//pen이미지를 클릭하면,일정을 작성할 수 있도록 하는 함수
	public String showPen(int year, int month, int day) {
		String s = "";
		String url = "calwrite.do";
		String image = "<img src='../resources/calendar/img/pen.gif'>";
		s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", url, year, month, day, image);

		return s;
	}

	//1->01
	public String two(String msg) {
		return msg.trim().length() < 2 ? "0" + msg : msg.trim(); //1~9 ->01
	}

	//일정표시 -> 약속 15자이상으로 되면 ...으로 표시하는 함수
	public String dot3(String msg) {
		String s = "";
		if (msg.length() >= 15) {
			s = msg.substring(0, 15);
			s += "...";
		} else {
			s = msg.trim();
		}
		return s;
	}

	//각 날짜별로 테이블을 생성하는 함수
	public String makeTable(int year, int month, int day, List<SchedulerVO> list) {
		String s = "";
		String dates = (year + "") + two(month + "") + two(day + ""); //20170811

		s = "<table>";
		s += "<col width='200'>";

		for (SchedulerVO vo : list) {
			if (vo.getRdate().substring(0, 8).equals(dates)) {
				s += "<tr bgcolor='pink'>";
				s += "<td>";
				s += "<a href='caldetail.do?seq=" + vo.getSeq() + "'>";
				s += "<font style='font-size:8;color:black'>";
				s += dot3(vo.getTitle());
				s += "</font>";
				s += "</a>";
				s += "</td>";
				s += "</tr>";
			}
		}
		s += "</table>";
		return s;
	}%>


	<div class="panel-body" style="padding: 70px 30px 2px 3px;">
		<h1 class="page-header" align="center">
			<span style="color: #ff52a0;">너와 나의</span> 일정
		</h1>
	</div>
	<%
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);

		String syear = (String) request.getAttribute("year");
		String smonth = (String) request.getAttribute("month");

		int year = cal.get(Calendar.YEAR);	//올해의 년을 year에 저장
		if (!nvl(syear)) {
			year = Integer.parseInt(syear);
		}
		int month = cal.get(Calendar.MONTH) + 1; //0~11		//이번달의 수를 month에 저장
		if (!nvl(smonth)) {
			month = Integer.parseInt(smonth);
		}

		if (month < 1) {
			month = 12;
			year--;
		}
		if (month > 12) {
			month = 1;
			year++;
		}

		cal.set(year, month - 1, 1);

		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //요일 1~7

		String wdate = (year - 1) + "" + month;

		String pp = String.format(
				"<a href='%s?year=%d&month=%d'><img src='../resources/calendar/img/left.gif'></a>", "calendar.do",
				year - 1, month);

		String p = String.format("<a href='%s?year=%d&month=%d'><img src='../resources/calendar/img/prec.gif'></a>",
				"calendar.do", year, month - 1);

		String n = String.format("<a href='%s?year=%d&month=%d'><img src='../resources/calendar/img/next.gif'></a>",
				"calendar.do", year, month + 1);

		String nn = String.format(
				"<a href='%s?year=%d&month=%d'><img src='../resources/calendar/img/last.gif'></a>", "calendar.do",
				year + 1, month);

		MemberVO vo = (MemberVO) session.getAttribute("login");

		if (vo.getUserId() == null) {
			out.println("<script>alert('로그인 후 사용 가능합니다.');</script>");

		}

		System.out.println("list 전");

		List<SchedulerVO> list = (List<SchedulerVO>) request.getAttribute("list");		//Controller에서 가져온 list목록을 list에 저장
	%>
	<%
		String date = year + two(month + "");
	%>

	<div align="center">
		<table border="1">
			<col width="200">
			<col width="200">
			<col width="200">
			<col width="200">
			<col width="200">
			<col width="200">
			<col width="200">
			<tr height="50">
				<td colspan="7" align="center"><%=pp%><%=p%>
					<h2>
						<font color="black" style="font-size: 30"> <%=String.format("%d년&nbsp;&nbsp;%d월", year, month)%></font>
					</h2> <%=n%><%=nn%></td>
			</tr>
			<tr height="60">
				<td align="center">일</td>
				<td align="center">월</td>
				<td align="center">화</td>
				<td align="center">수</td>
				<td align="center">목</td>
				<td align="center">금</td>
				<td align="center">토</td>
			</tr>
			<tr height="150" align="left" valign="top">
				<%
					for (int i = 1; i < dayOfWeek; i++) {
				%>
				<td>&nbsp;</td>
				<%
					}

					int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	//해당 월의 마지막 날짜를 lastDay에 저장
					for (int i = 1; i <= lastDay; i++) {						//1일부터 마지막 날짜까지 for문 돌림
				%>
				<td><%=callist(year, month, i)%>&nbsp;<%=showPen(year, month, 1)%>
					<%=makeTable(year, month, i, list)%></td>	<!-- Controller에서 model에서 가져온 list를 makeTable에 전달 -->
				<%
					if ((i + dayOfWeek - 1) % 7 == 0) {
				%>
			</tr>
			<tr height="150" align="left" valign="top">
				<%
					}
					}
					for (int i = 0; i < (7 - (dayOfWeek + lastDay - 1) % 7) % 7; i++) {
				%>
				<td>&nbsp;</td>
				<%
}
%>
			</tr>
		</table>
	</div>
</body>

<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.example.springpjt.scheduler.model.dto.SchedulerVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
header.masthead {
	display: none;
}
</style>
<body>

	<%!public String toDates(String mdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh : mm : ss.S");
		System.out.println("toDates()");

		String s = StringUtils.substring(mdate, 0, 4) + "-" //yyyy
				+ StringUtils.substring(mdate, 4, 6) + "-" //MM
				+ StringUtils.substring(mdate, 6, 8) + " " //dd
				+ StringUtils.substring(mdate, 8, 10) + ":" //hh
				+ StringUtils.substring(mdate, 10, 12) + ":00.0"; //mm

		System.out.println(s);
		Timestamp d = Timestamp.valueOf(s);

		return sdf.format(d);
	}

	public String toOne(String msg) { //08->8
		return msg.charAt(0) == '0' ? msg.charAt(1) + "" : msg.trim();
	}%>
	<%
		SchedulerVO vo = (SchedulerVO) request.getAttribute("vo");
	%>
	<div class="panel-body" style="padding: 70px 30px 2px 3px;">
		<h2 class="page-header" align="center">
			<span style="color: #ff52a0;">너와 나의</span> 일정
		</h2>
	</div>
	<table border="1" align="center">
		<col width="200">
		<col width="500">
		<tr>
			<td>아이디</td>
			<td><%=vo.getId()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=vo.getTitle()%></td>
		</tr>
		<tr>
			<td>일정</td>
			<td><%=toDates(vo.getRdate())%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="20" cols="60" readonly="readonly"><%=vo.getContent()%>
		</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="수정"
				onclick="location.href='calupdate.do?seq=<%=vo.getSeq()%>'">
				<input type="button" value="삭제"
				onclick="location.href='caldel.do?seq=<%=vo.getSeq()%>'"></td>
		</tr>
	</table>
</body>

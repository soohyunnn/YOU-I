<%@page import="java.util.Calendar"%>
<%@page import="com.example.springpjt.member.model.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calwrite.jsp</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<style>
header.masthead {
	display: none;
}
</style>
<body>
	<div class="panel-body" style="padding: 70px 30px 2px 3px;">
		<h2 class="page-header" align="center">
			<span style="color: #ff52a0;">너와 나의</span> 일정
		</h2>
	</div>
	<%
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");

		MemberVO vo = (MemberVO) session.getAttribute("login");

		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONTH) + 1;
		int tday = cal.get(Calendar.DATE);
		int thour = cal.get(Calendar.HOUR_OF_DAY);
		int tmin = cal.get(Calendar.MINUTE);
	%>
	<form action="calwriteAf.do" method="post">
		<table border="1" align="center">
			<col width="200">
			<col width="500">
			<tr>
				<td>아이디</td>
				<td><%=vo.getUserId()%> <input type="hidden" name="id"
					value="<%=vo.getUserId()%>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" size="60" name="title"></td>
			</tr>
			<tr>
				<td>일정</td>
				<td><select name="year">
						<%
							for (int i = tyear - 5; i < tyear + 6; i++) {
						%>
						<option <%=year.equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>년 <select name="month">
						<%
							for (int i = 1; i <= 12; i++) {
						%>
						<option <%=month.equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>월 <select name="day">
						<%
							for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
						%>
						<option <%=day.equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>일 <select name="hour">
						<%
							for (int i = 0; i < 24; i++) {
						%>
						<option <%=(thour + "").equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>시 <select name="min">
						<%
							for (int i = 0; i < 60; i++) {
						%>
						<option <%=(tmin + "").equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>분</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글쓰기">
				</td>
			</tr>
		</table>
	</form>
	<%
		String url = String.format("%s?year=%s&month=%s", "calendar.do", year, month);
	%>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("select[name='month']").change(
							function() {
								var lastday = (new Date(
										$("select[nema='year']").val() + "", $(
												"select[name='month']").val()
												+ "", 0)).getDate();

								//적용
								var str = "";
								for (i = 1; i <= lastday; i++) {
									str += "<option value='"+ i + "'>" + 1
											+ "</option>";
								}
								$("select[name='day']").html(str);
							});
				});
	</script>











</body>
</html>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.example.springpjt.scheduler.model.dto.SchedulerVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
header.masthead {
	display: none;
}
</style>
<body>

	<%!public String toDates(String mdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");

		String s = StringUtils.substring(mdate, 0, 4) + "-" //yyyy
				+ StringUtils.substring(mdate, 4, 6) + "-" //MM
				+ StringUtils.substring(mdate, 6, 8) + " " //dd
				+ StringUtils.substring(mdate, 8, 10) + ":" //hh
				+ StringUtils.substring(mdate, 10, 12) + ":00"; //mm

		Timestamp d = Timestamp.valueOf(s);

		return sdf.format(d);
	}

	public String toOne(String msg) {
		return msg.charAt(0) == '0' ? msg.charAt(1) + "" : msg.trim();
	}%>
	<%
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);

		SchedulerVO vo = (SchedulerVO) request.getAttribute("vo");

		String year = StringUtils.substring(vo.getRdate(), 0, 4);
		String month = toOne(StringUtils.substring(vo.getRdate(), 4, 6));
		String day = toOne(StringUtils.substring(vo.getRdate(), 6, 8));
		String hour = toOne(StringUtils.substring(vo.getRdate(), 8, 10));
		String min = toOne(StringUtils.substring(vo.getRdate(), 10, 12));
	%>

	<form action="calupdateAf.do" method="post" id="calupdate">
		<table border="1" align="center">
			<col width="200">
			<col width="500">
			<tr>
				<td>아이디<input type="hidden" name="seq"
					value="<%=vo.getSeq()%>">
				</td>
				<td><input type="text" name="id" value="<%=vo.getId()%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" size="60" name="title"
					value="<%=vo.getTitle()%>"></td>
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
						<option <%=(hour + "").equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>시 <select name="min">
						<%
							for (int i = 0; i < 60; i++) {
						%>
						<option <%=(min + "").equals(i + "") ? "selected='selected'" : ""%>
							value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>분</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="60" name="content"><%=vo.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="수정"
					onclick="document.getElementById('calupdate').submit();"></td>
			</tr>
		</table>
	</form>
</body>













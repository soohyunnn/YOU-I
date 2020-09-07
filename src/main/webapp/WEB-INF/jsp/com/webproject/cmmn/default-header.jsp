<%@page import="com.example.springpjt.member.model.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userSessionName = (String)session.getAttribute("userName");
	MemberVO vo = new MemberVO();
	
	if(session.getAttribute("login") != null) {
		vo = (MemberVO)session.getAttribute("login");
	}
%>
<script>
function list(){
	$.ajax({
		url : "/board/list.do",
		dataType : "html",
		type: "post",
		success : function(){
			location.href ="${pageContext.request.contextPath}/board/list.do";
		},
		error : function(){
			alert("에러가 발생하여 페이지 이동 실패");
		}
	});
}

function introduce(){
	$.ajax({
		url : "/introduce/introduce.do",
		dataType : "html",
		type: "post",
		success : function(){
			location.href ="${pageContext.request.contextPath}/introduce/introduce.do";
		},
		error : function(){
			alert("에러가 발생하여 페이지 이동 실패");
		}
	});
}

function main(){
	$.ajax({
		url : "/main.do",
		dataType : "html",
		type: "post",
		success : function(){
			location.href ="${pageContext.request.contextPath}/";
		},
		error : function(){
			alert("에러가 발생하여 페이지 이동 실패");
		}
	});
}

function logout(){
	$.ajax({
		url : "",
		dataType : "html",
		type: "post",
		success : function(){
			alert("로그아웃되었습니다!");
			location.href ="${pageContext.request.contextPath}/";
		},
		error : function(){
			alert("에러가 발생하여 페이지 이동 실패");
		}
	});
}

</script>
<form action="" name="izone-sign-in" method="post" id="loginFrm"
	style="margin-bottom: 0;">
	<header class="top_header">
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-light fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand" onclick="main()"> <img class="img-fluid"
					src="../resources/images/mark1.jpg" alt=""
					style="width: 130px; height: 50px;" />
				</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive">
					메뉴 <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav text-uppercase ml-auto">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							onclick="main()">HOME</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							onclick="introduce()">INTRODUCE</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="<c:url value="/scheduler/calendar.do" />">SCHEDULER</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							onclick="list()">BOARD</a></li>
						<% if(userSessionName == null) { %>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							data-toggle="modal" data-target="#log-in">LOGIN</a></li>
						<% } else { %>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="logout.do" onclick="return confirm('진짜로 로그아웃 하는거에요?')">LOGOUT</a>
						</li>
						<% } %>
					</ul>
				</div>
			</div>
		</nav>
		<br>
		<br>
		<br>
	</header>
</form>
<!-- Header -->
<header class="masthead">
	<div class="container">
		<div class="intro-text">
			<% if(userSessionName == null) { %>
			<button class="btn btn-chu btn-xl text-uppercase js-scroll-trigger"
				data-toggle="modal" data-target="#log-in">CHU~♥</button>
			<% } else { %>
			<a class="btn btn-chu btn-xl text-uppercase js-scroll-trigger"
				href="#"><%=userSessionName %>님 안녕~♥</a>
			<% } %>
		</div>
	</div>
</header>
<%@ include file="../users/login_modal.jsp"%>

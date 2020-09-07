<%@page import="com.example.springpjt.member.model.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userSessionName = (String)session.getAttribute("userName");
	MemberVO vo = (MemberVO)session.getAttribute("login");
%>
<script>
function insert(){
	
	obj.push({
		writer:$("#writer").val(),
		title : $('#title').val() ,
		content : $('#content').val()
	})
	
	
	$.ajax({
		url : "/insert.do",
		dataType : "json",
		type: "post",
		data : json_data,
		success : function(){
			location.href ="${pageContext.request.contextPath}/list.do";
		},
		error : function(){
			alert("에러가 발생하여 페이지 이동 실패");
		}
	});
}

function fileInput(obj, txtId){
	document.getElementById(txtId).value = obj.value;
}

function insertBoardAction(){
	$("#boardRegistform").ajaxForm({
		url : "${pageContext.request.contextPath}/board/insert.do",
		enctype : "multipart/form-data",
		beforeSend : function(){
			//전송 전에 해주어야 할 행동을 선언
		},
		success : function(data){
			//전송 성공 시 할 행동을 선언
			if(data.resultMap.result === "SUCCESS"){
				alert("정상적으로 등록되었습니다.");
				location.href="/board/view.do?bno="+data.resultMap.boardVO.bno;
			}
		},
		error : function(){
			//전송 오류 시 할 행동을 선언
			alert("에러가 발생하여 페이지 이동 실패");
		},
		complete : function(){
			//전송이 성공되거나, 실패되거나 해서
			//ajaxForm이 완료되었을 때 할 행동을 선언
		}
	});
	$("#boardRegistform").submit();
	
}
</script>




<style>
header.masthead {
	display: none;
}
</style>

<br />
<br />

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header text-white"
					style="background-color: #ff52a0;">게시글 등록</div>
				<div class="card-body">
					<form id="boardRegistform" action="" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label>작성자</label> <input type="text" class="form-control"
								name='writer' value='<%=vo.getUserName() %>'>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								name='title'>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" name='content'></textarea>
						</div>
						<div class="form-group">
							<label>파일</label> 
							<input type="text" class="form-control"
								id="boardFileTxt" name='boardFileTxt' readonly="readonly"
								style="width: 300px !important"
								onclick="document.getElementById('boardFile').click();">
							<a class="btn" href="javascript:void(0);"
								style="background-color: #ff52a0; color: white; border: 0px solid #f78f24; opacity: 0.8"
								onclick="document.getElementById('boardFile').click();">파일첨부</a>
							<input type="file" id="boardFile" name="boardFile"
								class="file_input_hidden"
								onchange="javascript:fileInput(this, 'boardFileTxt')" />
						</div>
						<div align="right">
							<input type="button" onclick="javascript:insertBoardAction();"
								value="등록" class="btn"
								style="background-color: aqua; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">&nbsp;
							<a class="btn" href="/board/list.do"
								style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
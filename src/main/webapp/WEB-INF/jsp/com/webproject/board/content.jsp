<%@page import="com.example.springpjt.member.model.dto.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	MemberVO vo = (MemberVO)session.getAttribute("login");	
%>
<%!
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh : mm : ss.S");
	System.out.println("toDates()");
	
	String s = StringUtils.substring(mdate, 0, 4) + "-" 		//yyyy
			+StringUtils.substring(mdate, 4, 6) + "-"  	 	//MM
			+StringUtils.substring(mdate, 6, 8) + " "			//dd
			+StringUtils.substring(mdate, 8, 10) + ":"		//hh
			+StringUtils.substring(mdate, 10, 12) + ":00.0";	//mm
			
			System.out.println(s);
	Timestamp d =Timestamp.valueOf(s);
			
	return sdf.format(d);
}
%>
<style>
header.masthead {
	display: none;
}

/* Popup container - can be anything you want */
.popup {
	position: relative;
	display: inline-block;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* The actual popup */
.popuptext {
	visibility: hidden;
	width: 460px;
	background-color: #fff;
	color: #000;
	text-align: left;
	border-radius: 6px;
	padding: 8px 0;
	position: fixed;
	z-index: 1;
	bottom: 35%;
	left: 25%;
	border: 1px solid;
}

/* Popup arrow */

/* Toggle this class - hide and show the popup */
.show {
	visibility: visible;
	-webkit-animation: fadeIn 1s;
	animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@
-webkit-keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>
<script>
$(document).ready(function() {
	$('#commentUpdate-btn').click(function(e) {
		
		var commentUpdateData = {
				content :$('#updatecontent').val()        	
	        };
		
		console.log(commentUpdateData);
		
	
        //수정 데이터 저장
        $.ajax({
            type: "post",
            url: "commentUpdate.do",
            data: commentUpdateData,
            success: function () {          	
            		alert("수정에 성공하였습니다");
            		 
            }
        });

	});
});

function myFunction(idx,name){
	  //댓글 인덱스를 팝업창 input hidden에 등록
	  if(idx == null || idx == undefined){
		  idx = "";
	  }
	  if(name == null || name == undefined){
		  name = "";
	  }
	  
	  document.getElementById("commentIndex").value = idx;
	  document.getElementById("commentWriter").value = name;
	  var popup = document.getElementById("myPopup");
	  popup.classList.toggle("show");
}
</script>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header text-white"
					style="background-color: #ff52a0;">${data.bno}번게시물 내용</div>
				<div class="card-body">
					<div class="form-group">
						<label>작성자</label> <input type="text" class="form-control"
							name='writer' value="${data.writer}" readonly>
					</div>
					<div class="form-group">
						<label>제목</label> <input type="text" class="form-control"
							name='title' value="${data.title}" readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="5" name='content' readonly>${data.content}</textarea>
					</div>
					<!--  
					<div class="form-group">
						<img src="${fileData.uploadPath}${fileData.saveFileNm}"
							style="width: 100%; height: 200px">
					</div>
					-->
					<a class="btn" href="/board/list.do"
						style="background-color: #ff52a0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">목록</a>&nbsp;&nbsp;
					<a class="btn" href="/board/updatepage.do?bno=${data.bno}"
						style="background-color: orange; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">수정</a>&nbsp;&nbsp;
					<a class="btn" href="/board/delete.do?bno=${data.bno}"
						onclick="return confirm('정말로 삭제하시겠습니까?')"
						style="background-color: red; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">삭제</a>&nbsp;&nbsp;
				</div>

				<!-- 댓글 등록 폼 -->
				<form role="form" action="/board/commentWrite.do?bno=${data.bno}"
					method="post">
					<div class="card-body">
						<div class="form-group">
							<label>댓글 작성자</label> <input type="text" class="form-control"
								name='writer' value='<%=vo.getUserName() %>'>
						</div>
						<label>댓글 내용</label> <input type="text" class="form-control"
							name='content'>
					</div>
					<div style="padding-left: 30px">
						<input type="submit" value="등록" class="commentWriteBtn"
							style="background-color: #ff52a0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
					</div>
				</form>

				<!-- 댓글 보이는 폼 -->
				<form role="form" action="/board/commentWrite.do?bno=${data.bno}"
					method="post">
					<div id="reply">
						<ol class="commentList">
							<c:forEach items="${commentList}" var="commentList">
								<li>
									<p>
										작성자 : ${commentList.writer}<br /> 작성 날짜 :
										${commentList.regDate} <br /> 내용 : ${commentList.content}<br />
										========================================================================================================<br />
									</p>
									<div>
										<a class="btn" href="javascript:void(0);"
											style="background-color: orange; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8"
											onClick="myFunction('${commentList.cno}','${commentList.writer}');">수정</a>&nbsp;&nbsp;
										<a class="btn"
											href="/board/commentDeleteView.do?cno=${commentList.cno}&bno=${data.bno}"
											onclick="return confirm('정말로 삭제하시겠습니까?')"
											style="background-color: red; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">삭제</a>&nbsp;&nbsp;
									</div>
								</li>
							</c:forEach>
						</ol>
					</div>
				</form>

				<!-- 댓글 수정 폼 -->
				<div class="popuptext" id="myPopup">
					<form role="form" action="commentUpdate.do" method="post"
						id="commentUpdate">
						<div class="card-body">
							<c:forEach items="${commentList}" var="commentList">
								<div class="card-body">

									<!-- 게시글 번호 -->
									<input type="hidden" class="form-control" name='bno'
										value='${data.bno }' readonly>
									<!-- 댓글 번호 -->
									<input type="hidden" class="form-control" id="commentIndex"
										name='cno' readonly>

									<div>
										<label>댓글 작성자</label> <input type="text" class="form-control"
											id="commentWriter" name='writer' readonly>
									</div>
									<div>
										<label>댓글 내용</label> <input type="text" class="form-control"
											name='content' id="updatecontent">
									</div>
									<div style="padding-top: 10px" align="right">
										<input class="btn" type="submit" value="수정" id=""
											style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8" />
									</div>
								</div>
							</c:forEach>

						</div>
					</form>
				</div>
				<!-- popup end -->
			</div>
		</div>
	</div>
</div>


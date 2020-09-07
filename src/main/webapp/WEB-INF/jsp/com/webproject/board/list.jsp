<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
header.masthead {
	display: none;
}
</style>
<script>
//글쓰기 이벤트
function write(){
	$.ajax({
		url : "/board/write.do",
		dataType : "html",
		type: "post",
		success : function(){
			location.href ="${pageContext.request.contextPath}//board/write.do";
		},
		error : function(){
			alert("에러가 발생하여 페이지 이동 실패");
		}
	});
}

	//이전 버튼 이벤트
	
	function fn_prev(page, range, rangeSize) {	//현재 목록의 페이지 번호,각 페이지의 시작 번호,페이지당 게시글 갯수 =10으로 초기화
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/board/list.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) { 	//현재 목록의 페이지 번호,각 페이지의 시작 번호,페이지당 게시글 갯수 =10으로 초기화,게시글 검색 시 검색 타입 목록,검색 단어
		var url = "${pageContext.request.contextPath}/board/list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {	//현재 목록의 페이지 번호,각 페이지의 시작 번호,페이지당 게시글 갯수 =10으로 초기화
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/board/list.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>
<!-- Begin Page Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="panel-body">
				<h2 class="page-header">
					<span style="color: #ff52a0;">너와 나의</span> 자유 게시판 <a
						class="btn float-right"
						href="http://localhost:8080/board/write.do"
						style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">글쓰기</a>
				</h2>
				<table class="table table-bordered table-hover">
					<tr
						style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
						<th>#번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>

					<!-- 게시글리스트가 들어갈 행 -->
					<c:choose>
						<c:when test="${fn:length(list) >0 }">
							<c:forEach var="list" items="${list}">
								<tr style="color: #ff52a0;">
									<td>${list.bno}</td>
									<td>${list.writer}</td>
									<td><a href="/board/view.do?bno=${list.bno}"
										style="color: orange;"> ${list.title} </a></td>
									<td>${list.getRegdate()}</td>
									<td>${list.getViewcnt()}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>

			<div class="col-lg-2"></div>
			<!-- pagination{s} -->
			<div id="paginationBox" style="padding-left: 140px">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link"
							style="background: #ff007b99" href="#"
							onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
						</li>
					</c:if>
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li
							class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
							<a class="page-link" style="background: #ff007b99" href="#"
							onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
								${idx} </a>
						</li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							style="background: #ff007b99"
							onClick="fn_next('${pagination.range}', 
						'${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
					</c:if>
				</ul>
			</div>
			<!--pagination{e}  -->

			<!-- search{s} -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType">
						<option value="title">제목</option>
						<option value="Content">본문</option>
						<option value="reg_id">작성자</option>
					</select>
				</div>
				<div class="w300" style="padding-right: 10px">
					<input type="text" class="form-control form-control-sm"
						name="keyword" id="keyword">
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch"
						id="btnSearch">검색</button>
				</div>
			</div>
			<!-- search{e} -->
		</div>
	</div>
</div>

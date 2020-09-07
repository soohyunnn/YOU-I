<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
header.masthead {
	display: none;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header text-white"
					style="background-color: #ff52a0;">${data.bno}번게시물 수정</div>
				<div class="card-body">
					<form role="form" action="/board/update.do?bno=${data.bno}"
						method="post">
						<input type="hidden" name="boardNo" value="${data.bno}">
						<div class="form-group">
							<label>작성자</label> <input type="text" class="form-control"
								name='writer' value="${data.writer}" readonly>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								name='title' value="${data.title}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" name='content'>${data.content}</textarea>
						</div>
						<input class="btn" type="submit" value="수정"
							style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8" />
						<a class="btn" href="/board/list.do"
							style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">목록</a>&nbsp;&nbsp;
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

package com.example.springpjt.board.model.dto;

import java.sql.Date;

//비즈니스 로직,DB연동 작업
public class BoardVO {			//데이터 저장 클래스
	private int bno;			//게시글 번호
	private String title;		//게시글 제목
	private String content; 	//게시글 내용
	private String writer; 		//게시글 작성자
	private Date regDate; 		//게시글 작성일자 util.Date
	private int viewCnt; 		//게시글 조회수
	private int startIndex;
	private int cntPerPage;
	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regDate;
	}
	public void setRegdate(Date regdate) {
		this.regDate = regdate;
	}
	public int getViewcnt() {
		return viewCnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewCnt = viewcnt;
	}
	
	//toString()
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regDate + ", viewcnt=" + viewCnt + "]";
	}
}

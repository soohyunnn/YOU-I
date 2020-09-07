package com.example.springpjt.board.service;

import java.util.List;

import com.example.springpjt.board.model.dto.CommentVO;

public interface CommentService {

	//댓글 조회
	public List<CommentVO> readComment(int bno) throws Exception;
	
	//댓글 작성
	public void writeComment(CommentVO commentVO) throws Exception;

	//댓글 수정
	public void updateComment(CommentVO commentVO) throws Exception;
	
	//댓글 삭제
	public void deleteComment(int cno) throws Exception;

}

package com.example.springpjt.board.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.springpjt.board.model.dto.CommentVO;
import com.example.springpjt.board.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentMapper commentMapper;
	
	//댓글 조회
	@Override
	public List<CommentVO> readComment(int bno) throws Exception {
		
		return commentMapper.readComment(bno);
	}
	
	//댓글 작성
	@Override
	public void writeComment(CommentVO commentVO) throws Exception {
		commentMapper.writeComment(commentVO);
		
	}

	//댓글 수정
	@Override
	public void updateComment(CommentVO commentVO) throws Exception {
		commentMapper.updateComment(commentVO);
		
	}

	//댓글 삭제
	@Override
	public void deleteComment(int cno) throws Exception {
		commentMapper.deleteComment(cno);
		
	}

}

package com.example.springpjt.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.springpjt.board.model.dto.BoardVO;
import com.example.springpjt.board.utils.Pagination;
import com.example.springpjt.cmmn.service.FileVO;

public interface BoardService {
	//01.게시글 작성
	public HashMap<String, Object> create(MultipartHttpServletRequest multiPartHttpServletRequest) throws Exception;
	
	//02.게시글 상세보기
	public BoardVO read(int bno) throws Exception;
	
	//03.게시글 수정
	public void update(BoardVO vo) throws Exception;
	
	//04.게시글 삭제
	public void delete(int bno) throws Exception;
	
	//05.게시글 전체 목록
	public List<BoardVO> listAll(Pagination pagination) throws Exception;
	
	//06.게시글 조회수 증가
	public void increaseViewcnt(int bno) throws Exception;
	
	//07.게시물 총 갯수
	public int countBoard()throws Exception;
	
	//08파일 불러오기
	public FileVO readFile(int bno);
	
}

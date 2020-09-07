package com.example.springpjt.board.service.impl;

import java.util.List;

import com.example.springpjt.board.model.dto.BoardVO;
import com.example.springpjt.board.utils.Pagination;
import com.example.springpjt.cmmn.service.FileVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {
		//01.게시글 작성
		public int create(BoardVO vo);
		//02.게시글 상세보기
		public BoardVO read(int bno);
		//03.게시글 수정
		public void update(BoardVO vo);
		//04.게시글 삭제
		public void delete(int bno);
		//05.게시글 전체 목록
		public List<BoardVO> listAll(Pagination pagination);
		//06.게시글 조회 증가
		public void increaseViewcnt(int bno);
		//07.게시물 총 갯수
		public int countBoard();
		//08.파일 등록
		public void createFile(FileVO fileVO);
		//09.파일 불러오기
		public FileVO readFile(int bno);
}

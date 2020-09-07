package com.example.springpjt.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.springpjt.board.model.dto.BoardVO;
import com.example.springpjt.board.service.BoardService;
import com.example.springpjt.board.utils.Pagination;
import com.example.springpjt.cmmn.service.FileVO;
import com.example.springpjt.cmmn.utils.FileUtil;

//인터페이스 구현 클래스
//게시글 쓰기처리(태그문자 처리,공백문자 처리,줄바꿈 문자처리)
//게시글 조회 증가 처리(일정 시간도안 조회수 증가하지 않도록 처리)
@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardMapper boardDao;
	
	@Resource(name="fileUtil")	//name은 fileUtil에서 @Component(value="fileUtil")로 선언한 이름(이름은 선언하지 않아도 상관은 없음)
	private FileUtil fileUtil;

	@Resource(name="globalsProperties")
	private Properties globalsProperties;
	
	//01.게시글 쓰기
	@Override
	public HashMap<String, Object> create(MultipartHttpServletRequest multiPartHttpServletRequest) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object> ();
		
		try{
			String uploadPath = globalsProperties.getProperty("Globals.Path.filePath");		//globals.properties에 file저장될 경로를 따로 생성함
			System.out.println(uploadPath);
			
			HashMap<String, Object> paramMap = fileUtil.multipartRequestToMap(multiPartHttpServletRequest);
			
			//{boardFileTxt=C:\fakepath\라이언_배경화면_12.png, writer=수현, title=asda, content=asdf}
			BoardVO boardVO = new BoardVO();
			boardVO.setWriter((String)paramMap.get("writer"));		//write화면에 입력한 값을 boardVO에 담아준다
			boardVO.setTitle((String)paramMap.get("title"));
			boardVO.setContent((String)paramMap.get("content"));
			
			int result = boardDao.create(boardVO);
			
			if(result >0){			//IMAGE 형식은 따로 FileUtil에 선언되어 있어 가져다 사용함
				List<FileVO> boardFileList = fileUtil.uploadFile(multiPartHttpServletRequest, uploadPath, "IMAGE", "BOARD", String.valueOf(boardVO.getBno()));
				
				if(!boardFileList.isEmpty() && boardFileList.size() > 0){	//boardFileList에 담긴 데이터가 비어있지 않을경우 실행
					System.out.println(boardFileList.size());
					for(int i = 0; i < boardFileList.size(); i++){			
						boardDao.createFile(boardFileList.get(i));			//wirte에서 입력받은 파일값을 따로 createFile을 통해 데이터 베이스에 저장
					}
				}
				resultMap.put("result", "SUCCESS");
				resultMap.put("boardVO", boardVO);
			}else{
				resultMap.put("result", "FAIL");
			}
			
			System.out.println(paramMap.toString());
			
		}catch (Exception e){
			
			e.printStackTrace();
			throw e;		//트랙잭션 처리를 해주기 위해 선언
		}
		
		return resultMap;
	}

	//02.게시글 상세보기
	@Override
	public BoardVO read(int bno) throws Exception {		//bno는 게시글 번호
		return boardDao.read(bno);
	}

	
	//03.게시글 수정
	@Override
	public void update(BoardVO vo) throws Exception {
		boardDao.update(vo);
	}

	//04.게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}

	//05.게시글 전체 목록
	@Override
	public List<BoardVO> listAll(Pagination pagination) throws Exception {
		return boardDao.listAll(pagination);
	}

	//06.게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		boardDao.increaseViewcnt(bno);
	}

	//07.총 게시글 갯수
	@Override
	public int countBoard() throws Exception{
		return boardDao.countBoard();
	}
	
	//08.파일 불러오기
	@Override
	public FileVO readFile(int bno) {
		return boardDao.readFile(bno);
	}

	

}

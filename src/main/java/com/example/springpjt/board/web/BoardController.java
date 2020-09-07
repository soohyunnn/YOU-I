package com.example.springpjt.board.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;import javax.naming.directory.SearchControls;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.springpjt.board.model.dto.BoardVO;
import com.example.springpjt.board.model.dto.CommentVO;
import com.example.springpjt.board.service.BoardService;
import com.example.springpjt.board.service.CommentService;
import com.example.springpjt.board.utils.Pagination;
import com.example.springpjt.member.model.dto.MemberVO;

@Controller	//현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/board/")
public class BoardController {
	
	//의존관계 주입 => BoardServiceImpl 생성
	//IoC 의존관계 역전
	@Inject
	private BoardService boardService;
	
	@Inject
	private CommentService commentService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	//01.게시글 목록
	@RequestMapping("list.do")
    public String boardList(Model model
    		, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			,HttpSession session, HttpServletResponse response) throws Exception{
		
		System.out.println("boardList ()");
		
		logger.info("list");
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		if(vo == null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); location.href='//localhost:8080/';</script>");		
			out.flush();

		}
		
		//전체 게시글 개수
		int listCnt = boardService.countBoard();						
		System.out.println(listCnt);
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);

        model.addAttribute("list", boardService.listAll(pagination)); // model에 데이터 값을 담는다
       
        return "board/list.tiles"; // board/list.jsp로 이동
    }
	
	/*
	 * 02_01. 게시글 작성화면
	 * @RequestMapping("board/write.do")
	 * value="", method="전송방식"
	 * */
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write() throws Exception{
		System.out.println("write()");
		logger.info("writeView");		//write.jsp로 이동
		return "board/write.tiles"; 
	}
	
	//02_02.게시글 작성처리
	@RequestMapping(value="insert.do")
	public String insert(MultipartHttpServletRequest request, Model model) throws Exception{		
		System.out.println("insert()");
		logger.info("write");
		System.out.println(request.getParameter("writer"));
		
		HashMap<String, Object> resultMap = boardService.create(request);
		
		model.addAttribute("resultMap", resultMap);
		
		return "jsonView";
	}
	

	/*
	 * 03.게시글 상세내용 조회, 게시글 조회수 증가 처리
	 * @RequestParam : get/post방식으로 전달된 변수 1개
	 * 파일 업로드
	 */
	 
	@RequestMapping(value="view.do", method=RequestMethod.GET)
    public String boardRead(@RequestParam("bno") int bno,Model model,BoardVO boardVO) throws Exception {
		//조회수 증가 처리
		boardService.increaseViewcnt(bno);
        
        model.addAttribute("data", boardService.read(bno)); // model에 데이터 값을 담는다
        model.addAttribute("fileData", boardService.readFile(bno)); //업로드하는 file 데이터 값 담는다
        
        List<CommentVO> commentList = commentService.readComment(bno);
        System.out.println(boardVO.getBno());
        
        model.addAttribute("commentList", commentList);
        
        return "board/content.tiles"; // board/board_list.jsp로 이동
    }
		
	//04.게시글 수정		
	// 게시글 수정 페이지로 이동 
    @RequestMapping(value="updatepage.do", method=RequestMethod.GET)
    public String boardUpdate(@RequestParam("bno") int bno,Model model) throws Exception {
        BoardVO data = boardService.read(bno); // bno값을 넘김
        model.addAttribute("data", data); // model에 데이터 값을 담는다
        return "board/modify.tiles"; // board/modify로 이동
    }
	
    /*
     * 게시글 수정 실행
     * 폼에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
     */
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute BoardVO vo) throws Exception{
		System.out.println("update ()");
		boardService.update(vo);
		ModelAndView mv = new ModelAndView("redirect:list.do");
		
		return mv;
	}
	
	//05.게시글 삭제
	@RequestMapping(value="delete.do")
	public ModelAndView delete(@RequestParam("bno") int bno) throws Exception{
		boardService.delete(bno);
		ModelAndView mv = new ModelAndView("redirect:list.do");
		return mv;
	}
	
	
	//댓글 작성
	@RequestMapping(value="commentWrite.do", method=RequestMethod.POST )
	public String commentWrite(@RequestParam("bno") int bno, CommentVO commentVO, BoardVO boardVO)throws Exception{
		logger.info("BoardController commentWrite");
		System.out.println("commentWrite ()");
		System.out.println(bno);
		commentVO.setBno(bno);
		commentService.writeComment(commentVO);
			
		return "redirect:/board/view.do?bno="+bno;
	}
	
	
	//댓글 수정 POST
	@RequestMapping(value="commentUpdate.do", method= RequestMethod.POST)
	public String commentUpdate(@RequestParam("bno") int bno,@RequestParam("cno") int cno,CommentVO commentVO)throws Exception{
		logger.info("BoardController commentUpdate");
		System.out.println("commentUpdate ()");
		
		commentVO.setCno(cno);
		commentService.updateComment(commentVO);
		
		return "redirect:/board/view.do?bno="+bno;
		
	}
	
	
	//댓글 삭제 GET
	@RequestMapping(value="commentDeleteView.do", method = RequestMethod.GET)
	public String commentDeleteView(@RequestParam("bno") int bno, @RequestParam("cno") int cno, CommentVO commentVO) throws Exception{
		logger.info("BoardController commentDeleteView");
		System.out.println("cno : "+cno);
		commentService.deleteComment(cno);
		
		return "redirect:/board/view.do?bno="+bno;
		
	}
}











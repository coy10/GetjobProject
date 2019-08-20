package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Board;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public void list(Model model, @RequestParam(defaultValue = "1") int curPage) {
	
		Paging paging = boardService.getCurPage(curPage);
		
		model.addAttribute("paging", paging);
		
		List<Board> list = boardService.list(paging);
		
		model.addAttribute("list1", list);

		logger.info(paging.toString());
		
		logger.info(list.toString());
		
		logger.info("보드리스트");
	
	}
	
	@RequestMapping(value="/board/view", method=RequestMethod.GET)
	public void view(Model model, int board_no) {
		
		Board view= boardService.view(board_no);
		
		model.addAttribute("view", view);
		
		logger.info("보드뷰"+view);
		
		logger.info("보드넘버"+board_no);
		
		logger.info("보드 뷰");
	
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public void write() {
		
		logger.info("글쓰기");
	
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String writeProc(Board board, HttpSession session) {
		
		logger.info("글쓰기전송");
		
		board.setWriter_id((String)session.getAttribute("loginid"));
		board.setWriter_nick((String)session.getAttribute("loginnick"));
		
		logger.info("글쓴내용"+board);
		
		boardService.insertWrite(board);
		
		return "redirect:/board/list";
	
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public void update() {
		
		logger.info("수정");
	
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public void updateProc(Board board, HttpSession session) {
		
		logger.info("수정보안");
	

	}
	
}
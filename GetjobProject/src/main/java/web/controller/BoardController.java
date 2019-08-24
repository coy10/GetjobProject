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
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Board;
import web.dto.Recommend;
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
	public void view(Model model, int board_no, Recommend recommend) {
		
		Board view= boardService.view(board_no);
		
		model.addAttribute("view", view);
		
		logger.info("보드뷰"+view);
		
		logger.info("보드넘버"+board_no);
		
		logger.info("보드 뷰");
		
		recommend.setBoard_no(view.getBoard_no());
		recommend.setWriter_id(view.getWriter_id());
	
		boardService.selectreCntRecommend(recommend);
		
		model.addAttribute("recommend", recommend);
		
		logger.info(recommend.toString());
	
		
		model.addAttribute("recommend", recommend);
		
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
	public void update(Board board, Model model) {
		
		board = boardService.boardView(board);
		
		model.addAttribute("view", board);
		
		logger.info(board.toString());
		
		logger.info("수정");
	
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String updateProc(Board board) {
		
		boardService.boardUpdate(board);
		
		logger.info(board.toString());
		
		logger.info("수정보안");
	
		return "redirect:/board/list";
	}
	
	
	@RequestMapping(value="/board/delete", method=RequestMethod.GET)
	public String delete(Board board) {
		
		boardService.boardDelete(board);
		
		return "redirect:/board/list";
	}
	@RequestMapping(value="/board/recommend", method=RequestMethod.GET)
	public @ResponseBody Recommend recommend(Recommend recommend,HttpSession session,Model model) {
		
		logger.info("추천 : "+recommend.toString());
		
		recommend.setWriter_id((String)session.getAttribute("loginid"));
		recommend.setBoard_no(recommend.getBoard_no());
		
		boardService.recommend(recommend);
		
		logger.info("추천적용 후  : " + recommend.toString());
		
		boardService.selectreCntRecommend(recommend);
		
		model.addAttribute("recommend", recommend);
		
		return recommend;
	}
}
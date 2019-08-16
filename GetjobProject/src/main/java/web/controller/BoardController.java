package web.controller;

import java.util.List;

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
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public void list(Model model, @RequestParam(defaultValue = "1") int curPage) {
	
		List<Board> list = boardService.list();
		
		logger.info(list.toString());
		
		model.addAttribute("list1", list);
		
		Paging paging = boardService.getCurPage(curPage);
		
		model.addAttribute("paging", paging);
		
		
		logger.info("보드리스트");
	
	}
	
}
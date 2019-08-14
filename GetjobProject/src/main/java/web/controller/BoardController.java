package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//	@Autowired MainService mainService;
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public void list() {
	
		logger.info("보드리스트");
	
	}
	
}
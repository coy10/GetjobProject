package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//	@Autowired MainService mainService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() {
	
		logger.info("메인페이지");
	
	}
	
}

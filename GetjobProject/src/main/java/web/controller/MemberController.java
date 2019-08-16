package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/member/main", method=RequestMethod.GET)
	public void main() {
		logger.info("메인");
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() {
		logger.info("로그인");
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(Member member, HttpSession session) {
		
		if(memberService.login(member)) {
			
			member = memberService.selectByMember(member);
			
			logger.info(member.toString());
			
			session.setAttribute("login", true);
			session.setAttribute("loginid",member.getId());
			session.setAttribute("loginnick",member.getNick());
		}
		else {
			return "redirect:/member/login";
		}
		return "redirect:/member/main";
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		
		logger.info("로그아웃");
		
		session.invalidate();
		
		return "redirect:/member/main";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {
		logger.info("조인");
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc(Member member) {
		
		logger.info("멤버조인");
		logger.info(member.toString());
		logger.info("멤버 : " + member);
		memberService.insertMember(member);
		
		return "redirect:/member/main";
	}
	
	
}

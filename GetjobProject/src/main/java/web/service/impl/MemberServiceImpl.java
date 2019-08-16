package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberDao memberDao;
	
	@Override
	public void insertMember(Member member) {
		
		memberDao.insertMember(member);
		
	}
	
	public boolean login(Member member) {
		
		if(memberDao.selectCntMember(member)>0) {
			return true;
		}
		return false;
	}
	
	public Member selectByMember(Member member) {
		
		return memberDao.selectMember(member);
	}
}

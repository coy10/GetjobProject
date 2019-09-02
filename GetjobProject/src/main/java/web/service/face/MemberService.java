package web.service.face;

import web.dto.Member;

public interface MemberService {
	
	public void insertMember(Member member);
	
	public boolean login(Member member);
	
	public Member selectByMember(Member member);
	
	public boolean idcheck(Member member);
}

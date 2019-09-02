package web.dao.face;

import web.dto.Member;

public interface MemberDao {
	
	public void insertMember(Member member);
	
	public int selectCntMember(Member meber);
	
	public Member selectMember(Member meber);
	
	public int idcheckCntMember(Member member);
}

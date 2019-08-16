package web.dao.face;

import java.util.List;

import web.util.Paging;

public interface BoardDao {
	
	public List selectAll(Paging paging);
	
	public int selectCntAll();
}

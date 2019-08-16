package web.service.face;

import java.util.List;

import web.util.Paging;

public interface BoardService {
	
	public List list(Paging paging);

	public Paging getCurPage(int curPage);
}
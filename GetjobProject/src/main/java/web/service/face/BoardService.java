package web.service.face;

import java.util.List;

import web.dto.Board;
import web.dto.Recommend;
import web.util.Paging;

public interface BoardService {
	
	public List list(Paging paging);

	public Paging getCurPage(int curPage);
	
	public Board view(int board_no);
	
	public void insertWrite(Board board);
	
	public Board boardView(Board viewBoard);
	
	public Board boardUpdate(Board updateBoard);
	
	public Board boardDelete(Board deleteBoard);
	
	public void recommend(Recommend recommendBoard);
	
	public Recommend selectreCntRecommend(Recommend recommend);
	
}
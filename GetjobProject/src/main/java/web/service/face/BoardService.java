package web.service.face;

import java.util.List;


import web.dto.Board;
import web.dto.Comment;
import web.dto.Recommend;
import web.util.Paging;

public interface BoardService {
	
	public List list(Paging paging);

	public Paging getCurPage(int curPage, String select, String search);
	
	public Board view(int board_no);
	
	public void insertWrite(Board board);
	
	public Board boardView(Board viewBoard);
	
	public Board boardUpdate(Board updateBoard);
	
	public Board boardDelete(Board deleteBoard);
	
	public void recommend(Recommend recommendBoard);
	
	public Recommend selectCntRecommend(Recommend recommend);
	
	public Recommend totalCntRecommend(Recommend recommend);
	
	public List<Comment> commentList(Board board);
	
	public void commentInsert(Comment comment);
	
	public void commentDelete(Comment comment);
	
	public void listDelete(List list);
	
	public void commentUpdate(Comment comment);

}
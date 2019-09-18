package web.dao.face;

import java.util.List;
import java.util.Map;


import web.dto.Board;
import web.dto.Comment;
import web.dto.Recommend;
import web.util.Paging;

public interface BoardDao {
	
	public List selectAll(Paging paging);
	
	public int selectCntAll(Map map);
	
	public Board selectBoardByBoardno(int board_no);
	
	public void hit(int board_no);

	public void insertWrite(Board board);
	
	public Board selectBoardByBoardno(Board viewBoard);
	
	public void updateBoard(Board updateBoard);
	
	public void deleteBoard(Board deleteBoard);
	
	public void insertRecommend(Recommend recommend);

	public void deleteRecommend(Recommend recommend);
	
	public int selectMyCntRecommend(Recommend recommend);
	
	public int selectCntRecommend(Recommend recommend);
	
	public List<Comment> selectCommentByBoardno(Board board);
	
	public void insertComment(Comment comment);
	
	public void deleteComment(Comment comment);
	
	public void deleteList(List list);
	
	public void updateComment(Comment comment);
	
	public int selectCntComment(Comment comment);
}

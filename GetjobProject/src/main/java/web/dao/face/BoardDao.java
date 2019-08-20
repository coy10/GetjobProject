package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface BoardDao {
	
	public List selectAll(Paging paging);
	
	public int selectCntAll();
	
	public Board selectBoardByBoardno(int board_no);
	
	public void hit(int board_no);

	public void insertWrite(Board board);
	
	public Board selectBoardByBoardno(Board viewBoard);
	
	public void updateBoard(Board updateBoard);
}

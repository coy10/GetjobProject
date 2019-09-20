package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Comment;
import web.dto.Recommend;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

@Autowired BoardDao boardDao;
	
	@Override
	public List list(Paging paging) {
		
		return boardDao.selectAll(paging);
	}

	@Override
	public Paging getCurPage(int curPage, String select, String search) {
		
		Map map = new HashMap();
		map.put("search", search);
		map.put("select", select);
		
		int totalCount = boardDao.selectCntAll(map);
		
		Paging paging = new Paging(totalCount,curPage);
		
		paging.setSelect(select);
		paging.setSearch(search);
		
		return paging;
	}

	@Override
	public Board view(int board_no) {
		boardDao.hit(board_no);
		return boardDao.selectBoardByBoardno(board_no);
	}

	@Override
	public void insertWrite(Board board) {
		
		
		if(board.getTitle()=="" || board.getTitle()==null) {
			board.setTitle("(제목없음)");
		}
		if(board.getContent()=="" || board.getContent()==null) {
			board.setContent("(내용없음)");
		}
		
		boardDao.insertWrite(board);
	}

	@Override
	public Board boardView(Board viewBoard) {
		
		return boardDao.selectBoardByBoardno(viewBoard);
	}

	@Override
	public Board boardUpdate(Board updateBoard) {

		if(updateBoard.getTitle()=="" || updateBoard.getTitle()==null) {
			updateBoard.setTitle("(제목없음)");
		}
		if(updateBoard.getContent()=="" || updateBoard.getContent()==null) {
			updateBoard.setContent("(내용없음)");
		}

		
		boardDao.updateBoard(updateBoard);
		
		return updateBoard;
	}

	@Override
	public Board boardDelete(Board deleteBoard) {
		
		boardDao.deleteBoard(deleteBoard);
		
		return deleteBoard;
	}

	@Override
	public void recommend(Recommend recommendBoard) {
		
		if(boardDao.selectMyCntRecommend(recommendBoard)==0) {
			boardDao.insertRecommend(recommendBoard);
		}
		else{
			boardDao.deleteRecommend(recommendBoard);
		}
		
	}

	@Override
	public Recommend selectCntRecommend(Recommend recommend) {
		
		if(boardDao.selectMyCntRecommend(recommend)==0) {
			recommend.setRecommend_cnt(false);
		}
		else {
			recommend.setRecommend_cnt(true);
		}
		return recommend;
	}

	@Override
	public Recommend totalCntRecommend(Recommend recommend) {
		
		recommend.setTotal(boardDao.selectCntRecommend(recommend)); 
		
		return recommend;
	}

	@Override
	public List<Comment> commentList(Board board) {
		
		return boardDao.selectCommentByBoardno(board);
	}

	@Override
	public void commentInsert(Comment comment) {
		
		boardDao.insertComment(comment);
		
	}
		

	@Override
	public void commentDelete(Comment comment) {
		
		boardDao.deleteComment(comment);
		
	}

	@Override
	public void listDelete(List list) {
		boardDao.deleteList(list);
	}

	@Override
	public void commentUpdate(Comment comment) {
		boardDao.updateComment(comment);
	}

	@Override
	public int cntcommentSelect(Comment comment) {
		return boardDao.selectCntComment(comment);
	}
		
}

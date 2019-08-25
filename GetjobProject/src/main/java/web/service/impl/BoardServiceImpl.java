package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BoardDao;
import web.dto.Board;
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
	public Paging getCurPage(int curPage) {
		
		int totalCount = boardDao.selectCntAll();
		
		Paging paging = new Paging(totalCount,curPage);
		
		return paging;
	}

	@Override
	public Board view(int board_no) {
		boardDao.hit(board_no);
		return boardDao.selectBoardByBoardno(board_no);
	}

	@Override
	public void insertWrite(Board board) {
		boardDao.insertWrite(board);
	}

	@Override
	public Board boardView(Board viewBoard) {
		
		return boardDao.selectBoardByBoardno(viewBoard);
	}

	@Override
	public Board boardUpdate(Board updateBoard) {

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

	

	
}

package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BoardDao;
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
 
}

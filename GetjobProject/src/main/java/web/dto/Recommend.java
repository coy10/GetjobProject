package web.dto;

public class Recommend {
	
	private String writer_id;
	private int board_no;
	private boolean recommend_cnt;
	private int total;
	
	
	@Override
	public String toString() {
		return "Recommend [writer_id=" + writer_id + ", board_no=" + board_no + ", recommend_cnt=" + recommend_cnt
				+ ", total=" + total + "]";
	}

	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public boolean isRecommend_cnt() {
		return recommend_cnt;
	}
	public void setRecommend_cnt(boolean recommend_cnt) {
		this.recommend_cnt = recommend_cnt;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	

	
	

}

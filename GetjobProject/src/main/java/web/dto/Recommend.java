package web.dto;

public class Recommend {

	
	private int board_no;
	private String writer_id;
	private boolean recommend_cnt;
	private int total;
	
	@Override
	public String toString() {
		return "Recommend [board_no=" + board_no + ", writer_id=" + writer_id + ", recommend_cnt=" + recommend_cnt
				+ ", total=" + total + "]";
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public boolean isRecommend_cnt() {
		return recommend_cnt;
	}
	public void setRecommend_cnt(boolean recommend_cnt) {
		this.recommend_cnt = recommend_cnt;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	
	
}

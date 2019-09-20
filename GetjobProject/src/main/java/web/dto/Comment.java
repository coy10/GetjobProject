package web.dto;

import java.util.Date;


public class Comment {

	private int comment_no;
	private int board_no;
	private String writer_nick;
	private String content;
	private Date writtendate;
	private int commenttotal;

	
	
	
	
	


	@Override
	public String toString() {
		return "Comment [comment_no=" + comment_no + ", board_no=" + board_no + ", writer_nick=" + writer_nick
				+ ", content=" + content + ", writtendate=" + writtendate + ", commenttotal=" + commenttotal + "]";
	}
	public int getCommenttotal() {
		return commenttotal;
	}
	public void setCommenttotal(int commenttotal) {
		this.commenttotal = commenttotal;
	}
	public String getWriter_nick() {
		return writer_nick;
	}
	public void setWriter_nick(String writer_nick) {
		this.writer_nick = writer_nick;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
}
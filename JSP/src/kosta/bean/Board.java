package kosta.bean;

import java.io.Serializable;

public class Board implements Serializable{
	private String writer;
	private String title;
	private String contents;
	//폼에서 데이터값을 받기위한 객체 form 객체 / 커맨드 객체 --------------------------
	
	private int seq;
	private String regdate;
	private int hitcount;
	//VO 객체 / DTO 객체 - 계층간 데이터 교환을 위한 객체
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(String writer, String title, String contents, int seq, String regdate, int hitcount) {
		super();
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.seq = seq;
		this.regdate = regdate;
		this.hitcount = hitcount;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getHitcount() {
		return hitcount;
	}


	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}


	@Override
	public String toString() {
		return "Board [writer=" + writer + ", title=" + title + ", contents=" + contents + "]";
	}
}

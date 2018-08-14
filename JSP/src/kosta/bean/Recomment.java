package kosta.bean;

import java.io.Serializable;

public class Recomment implements Serializable{
	private int seq;
	private String title;
	private String writer;
	private String contents;
	private String regdate;
	private int b_seq;
	
	
	public Recomment() {
		// TODO Auto-generated constructor stub
	}
	
	public Recomment(int seq, String title, String writer, String contents, String regdate, int b_seq) {
		super();
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.b_seq = b_seq;
	}


	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
}

package com.dto;

public class BoardDTO {

	int num; //게시글 순서번호(PK)
	String author;//사용자아이디(작성자)()
	String title;//게시글제목
	String bcontent;// 게시글내용
	int readcnt; //조회수
	String writeday;//작성날짜
	int repRoot;//??
	int repStep;//??	
	int repIndent;//??
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int num, String author, String title, String bcontent, int readcnt, String writeday, int repRoot,
			int repStep, int repIndent) {
		super();
		this.num = num;
		this.author = author;
		this.title = title;
		this.bcontent = bcontent;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.repRoot = repRoot;
		this.repStep = repStep;
		this.repIndent = repIndent;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getRepRoot() {
		return repRoot;
	}

	public void setRepRoot(int repRoot) {
		this.repRoot = repRoot;
	}

	public int getRepStep() {
		return repStep;
	}

	public void setRepStep(int repStep) {
		this.repStep = repStep;
	}

	public int getRepIndent() {
		return repIndent;
	}

	public void setRepIndent(int repIndent) {
		this.repIndent = repIndent;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", author=" + author + ", title=" + title + ", bcontent=" + bcontent
				+ ", readcnt=" + readcnt + ", writeday=" + writeday + ", repRoot=" + repRoot + ", repStep=" + repStep
				+ ", repIndent=" + repIndent + "]";
	}
	
	
}

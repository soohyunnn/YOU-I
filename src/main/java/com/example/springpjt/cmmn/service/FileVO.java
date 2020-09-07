package com.example.springpjt.cmmn.service;

public class FileVO {

	int fileSeq;
	private String oriFileNm;	// 실제 파일명
	private String saveFileNm;	// 저장 파일명
	private String thumbFileNm;	// 썸네일 파일명
	private String uploadPath;	// 경로
	private String refType;		// 참조 유형
	private String refCd;		// 참조 코드

	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getOriFileNm() {
		return oriFileNm;
	}
	public void setOriFileNm(String oriFileNm) {
		this.oriFileNm = oriFileNm;
	}
	public String getSaveFileNm() {
		return saveFileNm;
	}
	public void setSaveFileNm(String saveFileNm) {
		this.saveFileNm = saveFileNm;
	}
	public String getThumbFileNm() {
		return thumbFileNm;
	}
	public void setThumbFileNm(String thumbFileNm) {
		this.thumbFileNm = thumbFileNm;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getRefType() {
		return refType;
	}
	public void setRefType(String refType) {
		this.refType = refType;
	}
	public String getRefCd() {
		return refCd;
	}
	public void setRefCd(String refCd) {
		this.refCd = refCd;
	}

}

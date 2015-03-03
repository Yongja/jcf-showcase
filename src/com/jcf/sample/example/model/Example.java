package com.jcf.sample.example.model;

public class Example {

	private String applyId;
	private String applyName;
	private String phoneNum;
	private String applyDept;
	private String deptName;
	private int dbFileId;
	private String fileSysId;

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getApplyId() {
		return applyId;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getApplyName() {
		return applyName;
	}

	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}

	public String getApplyDept() {
		return applyDept;
	}

	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept;
	}

	public int getDbFileId() {
		return dbFileId;
	}

	public void setDbFileId(int dbFileId) {
		this.dbFileId = dbFileId;
	}

	public String getFileSysId() {
		return fileSysId;
	}

	public void setFileSysId(String fileSysId) {
		this.fileSysId = fileSysId;
	}
}
package com.jcf.sample.sua.model;

public class SuaBean {

	private String name;
	private int age;
	private String regiDate;

	public SuaBean() {
	}

	public SuaBean(String name, int age, String regiDate) {
		this.name = name;
		this.age = age;
		this.regiDate = regiDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}

	@Override
	public String toString() {
		return String.format("아이디 : %s, 나이 : %d, 등록일자 : %s", this.name, this.age, this.regiDate);
	}
}

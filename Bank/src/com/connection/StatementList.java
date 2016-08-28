package com.connection;

public class StatementList {

	private String dt;
	private String ty;
	private String fr;
	private double mn;
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getTy() {
		return ty;
	}
	public void setTy(String ty) {
		this.ty = ty;
	}
	public String getFr() {
		return fr;
	}
	public void setFr(String fr) {
		this.fr = fr;
	}
	public double getMn() {
		return mn;
	}
	public void setMn(double mn) {
		this.mn = mn;
	}
	public StatementList(String dt, String ty, String fr, double mn) {
		super();
		this.dt = dt;
		this.ty = ty;
		this.fr = fr;
		this.mn = mn;
	}
	public StatementList() {
		super();
	}
	
}

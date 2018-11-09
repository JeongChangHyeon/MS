package com.bit.ms.admin.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("salesVO")
public class SalesVO {
	
	private Date sales_day;
	private int sales_total;
	private int sales_food;
	private int sales_seat;
	private int sales_id;
	
	@Override
	public String toString() {
		return "SalesVO [sales_day=" + sales_day + ", sales_total=" + sales_total + ", sales_food=" + sales_food
				+ ", sales_seat=" + sales_seat + ", sales_id=" + sales_id + "]";
	}
	
	public Date getSales_day() {
		return sales_day;
	}
	
	public void setSales_day(Date sales_day) {
		this.sales_day = sales_day;
	}
	
	public int getSales_total() {
		return sales_total;
	}
	
	public void setSales_total(int sales_total) {
		this.sales_total = sales_total;
	}
	
	public int getSales_food() {
		return sales_food;
	}
	
	public void setSales_food(int sales_food) {
		this.sales_food = sales_food;
	}
	
	public int getSales_seat() {
		return sales_seat;
	}
	
	public void setSales_seat(int sales_seat) {
		this.sales_seat = sales_seat;
	}
	
	public int getSales_id() {
		return sales_id;
	}
	
	public void setSales_id(int sales_id) {
		this.sales_id = sales_id;
	}
	
}

package model;

import java.util.List;

public class Tractor {
	private int id;
	private String name;
	private String description;
	private int power;
	private float price;
	
	public Tractor(int id, String name, String description, int power, float price) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.power = power;
		this.price = price;
	}
	
	public Tractor(List<String> sql_line) {
		try {
			if(sql_line.size() != 5) {
				throw new Exception("SQL String to Tractor Error");
			} else {
				id = Integer.parseInt(sql_line.get(0));
				name = sql_line.get(1);
				description = sql_line.get(2);
				power = Integer.parseInt(sql_line.get(3));
				price = Float.parseFloat(sql_line.get(4));
				
			}
		} catch(Exception e) {
			id = -1;
			name = "ERROR";
			description = "ERROR";
			power = -1;
			price = -1.99f;
			e.printStackTrace();
		}
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public float getPrice() {
		return price;
	}
	
	public void setPrice(float price) {
		this.price = price;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getPower() {
		return power;
	}
	
	public void setPower(int power) {
		this.power = power;
	}
}

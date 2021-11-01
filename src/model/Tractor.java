package model;

public class Tractor {
	private int id;
	private String name;
	private String description;
	private int power;
	private int price;
	
	public Tractor(int id, String name, String description, int power, int price) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.power = power;
		this.price = price;
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
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
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

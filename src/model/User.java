package model;

import database.MyDataBase;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String place;
	private boolean isAdmin;
	private final List<Tractor> owned;
	
	public User(int id, String username, String password, String phone, String place, boolean isAdmin) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.place = place;
		this.isAdmin = isAdmin;
		this.owned = new ArrayList<Tractor>();
	}
	
	public User(int id, String username, String password, String phone, String place, boolean isAdmin, List<Tractor> owned) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.place = place;
		this.isAdmin = isAdmin;
		this.owned = owned;
	}
	
	
	public static User Check(String username, String password) {
		if(username.equals("1234") && password.equals("1234")) {
			return new User(1, username, password, "18919626820", "SA", true);
		} else if(username.equals("123") && password.equals("123")) {
			return new User(2, username, password, "12345367890", "LA", false, MyDataBase.GetRandomTractors(new Random().nextInt(10) + 1));
		}
		return null;
	}
	
	public List<Tractor> getOwned() {
		return owned;
	}
	
	public void addOwned(Tractor newOne) {
	
	}
	
	public boolean isAdmin() {
		return isAdmin;
	}
	
	public void setAdmin(boolean admin) {
		isAdmin = admin;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUsername() {
		
		return username;
	}
	
	public void setUsername(String username) {
		
		this.username = username;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPlace() {
		return place;
	}
	
	public void setPlace(String place) {
		this.place = place;
	}
	
	@Override
	public String toString() {
		return "User: " + username;
	}
}

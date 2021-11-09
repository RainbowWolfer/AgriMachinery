package model;

import java.util.List;

public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String place;
	private boolean isAdmin;
	
	public User(int id, String username, String password, String phone, String place, boolean isAdmin) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.place = place;
		this.isAdmin = isAdmin;
	}
	
	public User(List<String> sql_line) {
		try {
			if(sql_line.size() != 5) {
				throw new Exception("SQL String to User Error");
			} else {
				id = Integer.parseInt(sql_line.get(0));
				username = sql_line.get(1);
				password = sql_line.get(2);
				phone = sql_line.get(3);
				place = sql_line.get(4);
				isAdmin = sql_line.get(5).toLowerCase().equals("true");
			}
		} catch(Exception e) {
			id = -1;
			username = "ERROR";
			password = "ERROR";
			phone = "ERROR";
			place = "ERROR";
			isAdmin = false;
			e.printStackTrace();
		}
	}
	
	public static User Check(String username, String password) {
		if(username.equals("1234") && password.equals("1234")) {
			return new User(1, username, password, "18919626820", "SA", true);
		} else if(username.equals("123") && password.equals("123")) {
			return new User(2, username, password, "12345367890", "LA", false);
		}
		return null;
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

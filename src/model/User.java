package model;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String username;
	private String password;
	private boolean isAdmin;
	
	public User(String username, String password, boolean isAdmin) {
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
	}
	
	public static User Check(String username, String password) {
		if(username.equals("1234") && password.equals("1234")) {
			return new User(username, password, true);
		} else if(username.equals("123") && password.equals("123")) {
			return new User(username, password, false);
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
	
	
	@Override
	public String toString() {
		return "User: " + username;
	}
}

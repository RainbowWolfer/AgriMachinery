package model;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String username;
	private String password;
	private boolean isAdmin;
	private List<Tractor> tractors;
	
	public User(String username, String password, boolean isAdmin) {
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
		tractors = new ArrayList<Tractor>();
	}
	
	public static User Check(String username, String password) {
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
	
	public List<Tractor> getTractors() {
		return tractors;
	}
	
	public boolean RemoveTractor(Tractor tractor) {
		if(!tractors.contains(tractor)) {
			return false;
		}
		tractors.remove(tractor);
		return true;
	}
	
	public void AddTractor(Tractor tractor) {
		tractors.add(tractor);
	}
	
}

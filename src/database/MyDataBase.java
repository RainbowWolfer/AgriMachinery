package database;

import model.Tractor;
import model.User;
import utility.Methods;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MyDataBase {
	private MyDataBase() throws Exception {
		throw new Exception("This class cannot be serialized");
	}
	
	private static List<User> users;
	private static List<Tractor> tractors;
	
	static {
		users = new ArrayList<User>();
		tractors = new ArrayList<Tractor>();
		
		for(int i = 0; i < new Random().nextInt(20) + 5; i++) {
			users.add(new User(
					Methods.GetRandomString(5),
					Methods.GetRandomString(10),
					new Random().nextInt(2) == 1));
		}
		
		for(int i = 0; i < new Random().nextInt(20) + 5; i++) {
			tractors.add(new Tractor(Methods.GetRandomString(5), Methods.GetRandomString(200), new Random().nextInt(5000)));
		}
	}
	
	public static List<Tractor> GetAllTractors() {
		return tractors;
	}
	
	public static List<User> GetAllUsers() {
		return users;
	}
	
	public static User FindUser(String username) {
		for(var u : users) {
			if(u.getUsername().equals(username)) {
				return u;
			}
		}
		return null;
	}
	
	public static boolean RemoveUser(User user) {
		return users.remove(user);
	}
	
	public static boolean AddUser(User user) {
		//detect whether there is a duplicate username
		users.add(user);
		return true;
	}
	
	public static boolean ModifyUser(User oldOne, User newOne) {
		if(!users.contains(oldOne)) {
			return false;
		}
		users.set(users.indexOf(oldOne), newOne);
		return true;
	}
}

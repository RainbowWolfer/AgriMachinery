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
		
		for(int i = 0; i < new Random().nextInt(20); i++) {
			users.add(new User(
					Methods.GetRandomString(5),
					Methods.GetRandomString(10),
					new Random().nextInt(2) == 1));
		}
		
		for(int i = 0; i < new Random().nextInt(20); i++) {
			tractors.add(new Tractor(Methods.GetRandomString(5), Methods.GetRandomString(200), new Random().nextInt(5000)));
		}
	}
	
	public static List<Tractor> GetAllTractors() {
		return tractors;
	}
	
	public static List<User> GetAllUsers() {
		return users;
	}
}

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
	
	private static final List<User> users;
	private static final List<Tractor> tractors;
	
	static {
		tractors = new ArrayList<Tractor>();
		users = new ArrayList<User>();
		
		for(int i = 0; i < new Random().nextInt(20) + 5; i++) {
			tractors.add(new Tractor(
					tractors.size() + 1,
					Methods.GetRandomString(5),
					Methods.GetRandomString(200),
					new Random().nextInt(20),
					new Random().nextInt(5000)));
		}
		
		for(int i = 0; i < new Random().nextInt(20) + 5; i++) {
			users.add(new User(
					users.size() + 1,
					Methods.GetRandomString(5),
					Methods.GetRandomString(10),
					Methods.GenerateRandomNumber(11),
					Methods.GetRandomString(2).toUpperCase(),
					new Random().nextInt(2) == 1,
					GetRandomTractors(new Random().nextInt(10) + 1)));
		}
	}
	
	public static List<Tractor> GetRandomTractors(int maxSize) {
		List<Tractor> result = new ArrayList<Tractor>();
		for(int i = 0; i < maxSize; i++) {
			Tractor found = tractors.get(new Random().nextInt(tractors.size()));
			if(!result.contains(found)) {
				result.add(found);
			}
		}
		return result;
	}
	
	public static List<Tractor> GetAllTractors() {
		return tractors;
	}
	
	public static Tractor FindTractor(String name) {
		for(var t : tractors) {
			if(t.getName().equals(name)) {
				return t;
			}
		}
		return null;
	}
	
	
	public static Tractor FindTractor(int id) {
		return tractors.stream().filter(t -> t.getId() == id).findAny().orElse(null);
	}
	
	public static int GetTractorID(Tractor tractor) {
		Tractor found = tractors.stream().filter(t -> t.equals(tractor)).findAny().orElse(null);
		return found == null ? tractors.size() + 1 : found.getId();
	}
	
	public static boolean RemoveTractor(Tractor tractor) {
		return tractors.remove(tractor);
	}
	
	public static boolean AddTractor(String name, String description, int power, int price) {
		tractors.add(new Tractor(tractors.size() + 1, name, description, power, price));
		return true;
	}
	
	public static boolean ModifyTractor(int oldID, String new_name, String new_description, int new_power, int new_price) {
		Tractor found = tractors.stream().filter(t -> t.getId() == oldID).findAny().orElse(null);
		if(found == null) {
			return false;
		}
		tractors.set(tractors.indexOf(found), new Tractor(tractors.size() + 1, new_name, new_description, new_power, new_price));
		return true;
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
	
	public static User FindUser(int id) {
		return users.stream().filter(u -> u.getId() == id).findAny().orElse(null);
	}
	
	public static int GetUserID(User user) {
		User found = users.stream().filter(u -> u.equals(user)).findAny().orElse(null);
		return found == null ? users.size() + 1 : found.getId();
	}
	
	public static boolean RemoveUser(User user) {
		return users.remove(user);
	}
	
	public static boolean AddUser(String username, String password, String phone, String place, boolean isAdmin) {
		users.add(new User(users.size() + 1, username, password, phone, place, isAdmin));
		return true;
	}
	
	public static boolean ModifyUser(int oldID, String new_username, String new_password, String new_phone, String new_place, boolean new_isAdmin) {
		User found = users.stream().filter(c -> c.getId() == oldID).findAny().orElse(null);
		if(found == null) {
			return false;
		}
		users.set(users.indexOf(found), new User(found.getId(), new_username, new_password, new_phone, new_place, new_isAdmin));
		return true;
	}
	
	
}

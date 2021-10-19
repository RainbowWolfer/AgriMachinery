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
	
	public static List<Tractor> GetAllTractors() {
		List<Tractor> result = new ArrayList<>();
		for (int i = 0; i < new Random().nextInt(20) + 10; i++) {
			result.add(new Tractor(Methods.GetRandomString(5), Methods.GetRandomString(200), new Random().nextInt(5000)));
		}
		return result;
	}
	
	public static List<User> GetAllUsers() {
		
	}
}

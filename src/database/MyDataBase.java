package database;

import model.Tractor;
import model.User;
import utility.Methods;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MyDataBase {
	private MyDataBase() throws Exception {
		throw new Exception("This class cannot be serialized");
	}
	
	private static final String URL = "jdbc:mysql://localhost:3306/agrimachinary?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USER = "root";
	private static final String PASSWORD = "123456";
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection CreateConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
	
	public static void Close(Connection connection, Statement statement, ResultSet resultSet) {
		try {
			if (connection != null) {
				connection.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}
	
	public static List<List<String>> Query(String sql) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = CreateConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			List<List<String>> result = new ArrayList<List<String>>();
			ResultSetMetaData meta = resultSet.getMetaData();
			List<String> head = new ArrayList<String>();
			int columnCount = meta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				head.add(meta.getColumnLabel(i));
			}
			result.add(head);
			while (resultSet.next()) {
				List<String> line = new ArrayList<String>();
				for (int i = 1; i <= columnCount; i++) {
					line.add(resultSet.getString(i));
				}
				result.add(line);
			}
			return result;
		} catch (SQLException throwables) {
			throwables.printStackTrace();
			System.err.println(sql);
			return null;
		} finally {
			Close(connection, statement, resultSet);
		}
	}
	
	public static boolean NonQuery(String sql) {
		Connection connection = null;
		Statement statement = null;
		try {
			connection = CreateConnection();
			statement = connection.createStatement();
			statement.execute(sql);
			return true;
		} catch (SQLException throwables) {
			throwables.printStackTrace();
			System.err.println(sql);
			return false;
		} finally {
			Close(connection, statement, null);
		}
	}
	
	public static Tractor[] GetAllTractors() {
		List<Tractor> tractors = new ArrayList<Tractor>();
		List<List<String>> result = Query("select * from tractors");
		if (result == null) {
			return new Tractor[]{};
		}
		for (List<String> line : result.subList(1, result.size())) {
			tractors.add(new Tractor(line));
		}
		return tractors.toArray(Tractor[]::new);
	}
	
	public static User[] GetAllUsers() {
		List<User> users = new ArrayList<User>();
		List<List<String>> result = Query("select * from users");
		if (!IsResultValid((result))) {
			return new User[]{};
		}
//		Methods.PrintListList(result);
		for (List<String> line : result.subList(1, result.size())) {
			users.add(new User(line));
		}
		return users.toArray(User[]::new);
	}
	
	public static boolean IsResultValid(List<List<String>> result) {
		return result != null && result.size() > 1 && result.get(0).size() != 0;
	}
	
	public static List<String> FindByColumn(List<List<String>> result, String columnName) {
		if (!IsResultValid((result))) {
			return null;
		}
		List<String> list = new ArrayList<String>();
		int index = -1;
		List<String> title = result.get(0);
		for (int i = 0; i < title.size(); i++) {
			if (title.get(i).equals(columnName)) {
				index = i;
				break;
			}
		}
		if (index != -1) {
			for (List<String> line : result) {
				list.add(line.get(index));
			}
			return list;
		} else {
			return null;
		}
	}
	
	public static Tractor GetTractor(int id) {
		List<List<String>> result = Query("select * from tractors where t_id = " + id + ";");
		return IsResultValid(result) ? new Tractor(result.get(1)) : null;
	}
	
	public static boolean RemoveTractor(Tractor tractor) {
		List<List<String>> result = Query(String.format("CALL DeleteTractor(%s);", tractor.getId()));
		if (!IsResultValid(result)) {
			return false;
		}
		// String message = result.get(1).get(0);
//		Methods.PrintListList(result);
		return result.get(0).get(0).toLowerCase().equals("true");
	}
	
	public static boolean AddTractor(String name, String description, int power, float price) {
		return NonQuery(String.format("insert into tractors(t_name, t_description, t_power, t_price) values ('%s','%s','%s','%s')", name, description, power, price));
	}
	
	public static boolean ModifyTractor(int oldID, String new_name, String new_description, int new_power, float new_price) {
		return NonQuery(String.format("update tractors set t_name = '%s', t_description = '%s', t_power = '%s', t_price = '%s' where t_id = '%s'", new_name, new_description, new_power, new_price, oldID));
	}
	
	public static User GetUser(int id) {
		List<List<String>> result = Query("select * from users where u_id = " + id + ";");
		return IsResultValid(result) ? new User(result.get(1)) : null;
	}
	
	public static boolean RemoveUser(User user) {
		List<List<String>> result = Query(String.format("CALL DeleteUser(%s);", user.getId()));
		if (!IsResultValid(result)) {
			return false;
		}
		return result.get(0).get(0).toLowerCase().equals("true");
	}
	
	public static boolean AddUser(String username, String password, String phone, String place, boolean isAdmin) {
		return NonQuery(String.format("insert into users(u_username, u_password, u_phone, u_place, u_isAdmin) values ('%s','%s','%s','%s','%s')", username, password, phone, place, isAdmin ? "1" : "0"));
	}
	
	public static boolean ModifyUser(int oldID, String new_username, String new_password, String new_phone, String new_place, boolean new_isAdmin) {
		return NonQuery(String.format("update users set u_username = '%s', u_password = '%s', u_phone = '%s', u_place = '%s', u_isAdmin = '%s' where u_id = '%s'", new_username, new_password, new_phone, new_place, new_isAdmin ? "1" : "0", oldID));
	}
	
	public static List<Tractor> FindUserOwned(User user) {
		List<Tractor> tractors = new ArrayList<Tractor>();
		if (user == null) {
			return tractors;
		}
		List<List<String>> result = Query("SELECT t_id, t_name, t_description, t_power, t_price FROM user_owned, tractors WHERE o_tractor_id = t_id AND o_user_id = " + user.getId() + ";");
		if (!IsResultValid(result)) {
			return tractors;
		}
		result.subList(1, result.size()).forEach(t -> tractors.add(new Tractor(t)));
		return tractors;
	}
	
	public static User CheckUser(String username, String password) {
		List<List<String>> result = Query(String.format("SELECT * FROM users WHERE u_username = '%s';", username));
		if (!IsResultValid(result)) {
			return null;
		}
		List<String> list = FindByColumn(result, "u_password");
		if (list == null || !password.equals(list.get(1))) {
			return null;
		}
		return new User(result.get(1));
	}
	
	public static boolean ChangePassword(int id, String password) {
		return NonQuery(String.format("update users set u_password = '%s' where u_id = '%s'", password, id));
	}
	
}

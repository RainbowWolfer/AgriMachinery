package utility;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Random;

public final class Methods {
	public static String GetRandomString(int length) {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < length; i++) {
			int number = random.nextInt(3);
			long result = 0;
			switch(number) {
				case 0:
					result = Math.round(Math.random() * 25 + 65);
					sb.append((char) result);
					break;
				case 1:
					result = Math.round(Math.random() * 25 + 97);
					sb.append((char) result);
					break;
				case 2:
					sb.append(new Random().nextInt(10));
					break;
			}
		}
		return sb.toString();
	}
	
	public static String GenerateRandomNumber(int length) {
		StringBuilder s = new StringBuilder();
		for(int i = 0; i < length; i++) {
			s.append(new Random().nextInt(10));
		}
		return s.toString();
	}
	
	public static void ForwardToBase(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		User current = (User) req.getSession().getAttribute("user");
		if(current == null) {
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else {
			if(current.isAdmin()) {
				req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("NormalUserPage.jsp").forward(req, resp);
			}
		}
	}
	
	public static void PrintListList(List<List<String>> ll) {
		System.out.println("Start");
		for(List<String> line : ll) {
			StringBuilder sb = new StringBuilder("\t");
			line.forEach(sb::append);
			System.out.println(sb.toString());
		}
		System.out.println("End");
	}
}

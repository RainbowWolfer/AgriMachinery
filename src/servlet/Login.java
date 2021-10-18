package servlet;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String info = "";
		var cookies = req.getCookies();
		User found = null;
		if(cookies != null) {
			String username = "";
			String password = "";
			for(var c : cookies) {
				if(c.getName().equals("LastLogin_Username")) {
					username = c.getValue();
				} else if(c.getName().equals("LastLogin_Password")) {
					password = c.getValue();
				}
				if(!username.equals("") && !password.equals("")) {
					break;
				}
			}
			if(!username.equals("") && !password.equals("")) {
				found = User.Check(username, password);
			}
		}
		info = String.valueOf(cookies == null);
		var out = resp.getWriter();
		if(found == null) {
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else {
			req.setAttribute("info", info);
			req.setAttribute("user", found);
			if(found.isAdmin()) {
				req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("NormalUserPage.jsp").forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String username = req.getParameter("UsernameInput");
		String password = req.getParameter("PasswordInput");
		
		var user = User.Check(username, password);
		if(user != null) {
			resp.addCookie(new Cookie("LastLogin_Username", username));
			resp.addCookie(new Cookie("LastLogin_Password", password));
			
			req.setAttribute("user", user);
			if(user.isAdmin()) {
				req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("NormalUserPage.jsp").forward(req, resp);
			}
		} else {
			resp.addCookie(new Cookie("LastLogin_Username", ""));
			resp.addCookie(new Cookie("LastLogin_Password", ""));
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
	}
	
	
}

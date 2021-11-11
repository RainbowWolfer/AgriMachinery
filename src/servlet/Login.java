package servlet;

import database.MyDataBase;
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
				found = MyDataBase.CheckUser(username, password);
			}
		}
		info = String.valueOf(cookies == null);
		var out = resp.getWriter();
		if(found == null) {
//			req.setAttribute("entrance_info", "自动登陆信息失效");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else {
			req.setAttribute("info", info);
//			req.setAttribute("user", found);
			req.getSession().setAttribute("user", found);
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
		
		var user = MyDataBase.CheckUser(username, password);
		if(user != null) {
			var c_u = new Cookie("LastLogin_Username", username);
			var c_p = new Cookie("LastLogin_Password", password);
			int duration = 60 * 60 * 24 * 7;
			c_u.setMaxAge(duration);
			c_p.setMaxAge(duration);
			resp.addCookie(c_u);
			resp.addCookie(c_p);
			
//			req.setAttribute("user", user);
			req.getSession().setAttribute("user", user);
			if(user.isAdmin()) {
				req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("NormalUserPage.jsp").forward(req, resp);
			}
		} else {
			var c_u = new Cookie("LastLogin_Username", "");
			var c_p = new Cookie("LastLogin_Password", "");
			int duration = 60 * 60 * 24 * 7;
			c_u.setMaxAge(duration);
			c_p.setMaxAge(duration);
			
			resp.addCookie(c_u);
			resp.addCookie(c_p);
			
			req.setAttribute("entrance_info", " 密码或者账号错误");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
	}
	
	
}

package servlet;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userpage")
public class UserPage extends HttpServlet {
	/**
	 * 修改登录信息
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		User user = (User) req.getSession().getAttribute("user");//it should be right after login
		resp.getWriter().println(user == null ? "_!yes" : "_!no");
		req.getRequestDispatcher("ChangePasswordPage.jsp").forward(req, resp);
	}
	
	/**
	 * 注销
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		var c_u = new Cookie("LastLogin_Username", "");
		var c_p = new Cookie("LastLogin_Password", "");
		int duration = 60 * 60 * 24 * 7;
		c_u.setMaxAge(duration);
		c_p.setMaxAge(duration);
		
		resp.addCookie(c_u);
		resp.addCookie(c_p);
		
		req.getSession().setAttribute("user", null);
		
		req.getRequestDispatcher("Login.jsp").forward(req, resp);
		
	}
}

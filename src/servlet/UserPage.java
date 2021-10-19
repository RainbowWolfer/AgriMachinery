package servlet;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		User user = (User) req.getSession().getAttribute("user");
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
	}
}

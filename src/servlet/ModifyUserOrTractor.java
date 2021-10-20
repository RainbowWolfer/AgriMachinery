package servlet;

import database.MyDataBase;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;

@WebServlet("/modify")
public class ModifyUserOrTractor extends HttpServlet {
	/**
	 * 用户
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("ObjectInput");
		User u = MyDataBase.FindUser(username);
		if(u != null) {
			req.setAttribute("modify_target", u);
			req.getRequestDispatcher("ModifyUser.jsp").forward(req, resp);
		} else {
			req.setAttribute("entrace_alert", "找不到用户");
			req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
		}
	}
	
	/**
	 * 农机
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getRequestDispatcher("Login.jsp").forward(req, resp);
		String username = req.getParameter("ObjectInput");
		resp.getWriter().println(username);
		
		MyDataBase.FindUser(username);
	}
}

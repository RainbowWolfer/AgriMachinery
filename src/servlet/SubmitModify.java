package servlet;

import database.MyDataBase;
import model.Tractor;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/submitmodify")
public class SubmitModify extends HttpServlet {
	/**
	 * 用户
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("usernameInput");
		String password = req.getParameter("passwordInput");
		String isadmin = req.getParameter("adminInput");
		String originalName = req.getParameter("originalName");

//		resp.getWriter().println(username);
//		resp.getWriter().println(password);
//		resp.getWriter().println(isadmin);
//		resp.getWriter().println(originalName);
//		resp.getWriter().println(originalName == null);
		
		if (originalName.equals("null")) {
			if (MyDataBase.AddUser(username, password, "", "", isadmin != null)) {
				req.setAttribute("entrace_alert", "成功添加用户");
			} else {
				req.setAttribute("entrace_alert", "添加用户失败");
			}
		} else {
			User user = MyDataBase.FindUser(originalName);
			boolean result = false;
			if (user != null) {
				result = MyDataBase.ModifyUser(user.getId(), username, password, "", "", isadmin != null);
			}
			if (result) {
				req.setAttribute("entrace_alert", "成功修改用户");
			} else {
				req.setAttribute("entrace_alert", "修改用户失败");
			}
		}
		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
	}
	
	/**
	 * 农机
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("nameInput");
		String description = req.getParameter("descriptionInput");
		String price = req.getParameter("priceInput");
		String originalName = req.getParameter("originalName");
		
		if (originalName.equals("null")) {
			if (MyDataBase.AddTractor(name, description, 1, Integer.parseInt(price))) {
				req.setAttribute("entrace_alert", "成功添加农机");
			} else {
				req.setAttribute("entrace_alert", "添加农机失败");
			}
		} else {
			Tractor tractor = MyDataBase.FindTractor(originalName);
			boolean result = false;
			if (tractor != null) {
				result = MyDataBase.ModifyTractor(tractor.getId(), name, description, 2, Integer.parseInt(price));
			}
			if (result) {
				req.setAttribute("entrace_alert", "成功修改农机");
			} else {
				req.setAttribute("entrace_alert", "修改农机失败");
			}
		}
		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
	}
}

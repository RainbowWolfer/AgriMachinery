package servlet;

import database.MyDataBase;
import model.Tractor;
import model.User;
import utility.Methods;

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
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String username = req.getParameter("usernameInput");
		String password = req.getParameter("passwordInput");
		String isadmin = req.getParameter("adminInput");
		
		int user_id = Integer.parseInt(req.getParameter("user_id"));
		
		if (user_id == -1) {
			if (MyDataBase.AddUser(username, password, "", "", isadmin != null)) {
				req.setAttribute("entrace_alert", "成功添加用户");
			} else {
				req.setAttribute("entrace_alert", "添加用户失败");
			}
		} else {
			User user = MyDataBase.GetUser(user_id);
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
//		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
		Methods.ForwardToBase(req, resp);
	}
	
	/**
	 * 农机
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("nameInput");
		String description = req.getParameter("descriptionInput");
		String power = req.getParameter("powerInput");
		String price = req.getParameter("priceInput");
		
		int tractor_id = Integer.parseInt(req.getParameter("tractor_id"));
		
		if (tractor_id == -1) {
			if (MyDataBase.AddTractor(name, description, 1, Integer.parseInt(price))) {
				req.setAttribute("entrace_alert", "成功添加农机");
			} else {
				req.setAttribute("entrace_alert", "添加农机失败");
			}
		} else {
			Tractor tractor = MyDataBase.GetTractor(tractor_id);
			boolean result = false;
			if (tractor != null) {
				result = MyDataBase.ModifyTractor(tractor.getId(), name, description, Integer.parseInt(power), Float.parseFloat(price));
			}
			req.setAttribute("entrace_alert", result ? "成功修改农机" : "修改农机失败");
		}
//		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
		Methods.ForwardToBase(req, resp);
	}
}

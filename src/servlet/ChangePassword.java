package servlet;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/submitnewpassword")
public class ChangePassword extends HttpServlet {
	//成功修改返回登陆界面
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		req.getRequestDispatcher("Login.jsp").forward(req, resp);
	}
	
	/**
	 * 提交修改密码
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String originalInput = req.getParameter("originalInput");
		String newInput = req.getParameter("newInput");
		String confirmInput = req.getParameter("confirmInput");
		
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else {
			if (!user.getPassword().equals(originalInput)) {
				req.setAttribute("hint", "与原先密码比对错误");
				req.getRequestDispatcher("ChangePasswordPage.jsp").forward(req, resp);
			} else if (!newInput.equals(confirmInput)) {
				req.setAttribute("hint", "确认密码输入错误");
				req.getRequestDispatcher("ChangePasswordPage.jsp").forward(req, resp);
			} else {
				req.setAttribute("display", "密码修改成功");
				req.setAttribute("buttonContent", "返回");
				req.setAttribute("form_action", "submitnewpassword");
				req.setAttribute("form_methods", "get");
				req.getRequestDispatcher("SimpleDisplayPage.jsp").forward(req, resp);
			}
		}
	}
}

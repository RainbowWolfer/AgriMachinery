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

@WebServlet("/modify")
public class ModifyUserOrTractor extends HttpServlet {
	/**
	 * 用户
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(req.getParameter("ObjectInput"));
		User u = MyDataBase.GetUser(id);
		if(u != null) {
			req.setAttribute("modify_target", u);
			req.getRequestDispatcher("ModifyUser.jsp").forward(req, resp);
		} else {
			req.getSession().setAttribute("entrace_alert", "找不到用户");
//			req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			Methods.ForwardToBase(req, resp);
		}
	}
	
	/**
	 * 农机
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(req.getParameter("ObjectInput"));
		Tractor t = MyDataBase.GetTractor(id);
		resp.getWriter().println(t == null);
		resp.getWriter().println(id);
		if(t != null) {
			req.setAttribute("modify_target", t);
			req.getRequestDispatcher("ModifyTractor.jsp").forward(req, resp);
		} else {
			req.getSession().setAttribute("entrace_alert", "找不到农机");
//			req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			Methods.ForwardToBase(req, resp);
		}
	}
}

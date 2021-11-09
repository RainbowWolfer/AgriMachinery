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

@WebServlet("/delete")
public class DeleteUserOrTractor extends HttpServlet {
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
			MyDataBase.RemoveUser(u);
			req.setAttribute("entrace_alert", "成功删除用户");
		} else {
			req.setAttribute("entrace_alert", "删除用户失败");
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
		
		int id = Integer.parseInt(req.getParameter("ObjectInput"));
		Tractor t = MyDataBase.GetTractor(id);
		if(t != null) {
			boolean result = MyDataBase.RemoveTractor(t);
			if(result) {
				req.setAttribute("entrace_alert", "成功删除农机" + id + "//" + t.getId());
			} else {
				req.setAttribute("entrace_alert", "删除农机失败1 " + id + "//" + t.getId());
			}
		} else {
			req.setAttribute("entrace_alert", "删除农机失败2 " + id + "//" + t.getId());
		}
//		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
		Methods.ForwardToBase(req, resp);
	}
}

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
		User user = (User) req.getSession().getAttribute("modify_target");
		String info = (String) req.getSession().getAttribute("deleteORmodify");
		
		if(user == null) {
			resp.getWriter().println("what");
			resp.getWriter().println(req.getSession().getAttribute("modify_target"));
			resp.getWriter().println(req.getSession().getAttribute("deleteORmodify"));
			resp.getWriter().println("what????");
			for(String v : Collections.list(req.getSession().getAttributeNames())) {
				resp.getWriter().println(v);
			}
		} else {
			if(info.equals("delete")) {
				MyDataBase.RemoveUser(user);
				req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
			} else if(info.equals("modify")) {
				req.getRequestDispatcher("ModifyUser.jsp").forward(req, resp);
			} else {
				resp.getWriter().println("wtf2");
			}
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

package servlet;

import database.MyDataBase;
import model.User;
import utility.Methods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkUserInfo")
public class CheckUserInfo extends HttpServlet {
	//进入
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(req.getParameter("ObjectInput"));
		User u = MyDataBase.GetUser(id);
		req.setAttribute("check_user", u);
//		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
		Methods.ForwardToBase(req, resp);
	}
	
	//退出
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

//		req.getRequestDispatcher("AdminUserPage.jsp").forward(req, resp);
		Methods.ForwardToBase(req, resp);
	}
}

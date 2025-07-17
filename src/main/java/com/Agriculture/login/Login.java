package com.Agriculture.login;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.Agriculture.OBJ.User;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
//		if(uname==""||pass=="") {
//			out.print("<script>" +
//		            "alert('Username Or Password Cannot be Empty!');" +
//		            "window.location.href = 'Login.jsp';" + 
//		            "</script>");
//		}
		
		LoginDAO obj = new LoginDAO();
		boolean res = obj.check(uname, pass);
		
		HttpSession session = request.getSession();
		if(res) {
			session.setAttribute("uname", uname);
			
			User user = new User();
			user.getUserDetails(uname);
			
			session.setAttribute("name", user.getName());
			session.setAttribute("uid", user.getId());
			session.setAttribute("user", user);
			
//			RequestDispatcher rd = request.getRequestDispatcher("Index2.jsp");
//			rd.forward(request, response);
			response.sendRedirect("index1.jsp");
		}else {
			out.print("<script>" +
		            "alert('Authentication Failed!');" +
		            "window.location.href = 'login.jsp';" + 
		            "</script>");
		}
	}

}
package com.Agriculture.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Agriculture.OBJ.User;


@WebServlet("/FetchDetails")
public class FetchDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("uname");
		user.getUserDetails(uname);
		session.removeAttribute("user");
		session.setAttribute("user", user);
		response.sendRedirect("profile.jsp");
	}

}

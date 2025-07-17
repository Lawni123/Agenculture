package com.Agriculture.viewAcc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.User;


@WebServlet("/ViewAccount")
public class ViewAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ViewAccountDAO vDao = new ViewAccountDAO();
		ArrayList<User> userList = vDao.fetchUser();
		HttpSession session = request.getSession();
		session.setAttribute("userList",userList);
		response.sendRedirect("ViewAccount.jsp");

}
}
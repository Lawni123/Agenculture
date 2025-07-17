package com.Agriculture.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String pass = request.getParameter("pass");
		String nick = request.getParameter("nick");	
		String addr = request.getParameter("addr");	
		
		

		SignUpDAO daoObj = new SignUpDAO();
		if(!daoObj.checkDuplicate(mail)) {
			out.print("<script>" +
		            "alert('User Email Already Exist!');" +
		            "window.location.href = 'signuppage.jsp';" + 
		            "</script>");
		}else if(daoObj.registerUser(name.toLowerCase(), mail, phone, pass, nick,addr)){
				out.print("<script>" +
			            "alert('Succesfully SignedUp!');" +
			            "window.location.href = 'login.jsp';" + 
			            "</script>");
		}else {
			out.print("<script>" +
		            "alert('Error Occured!\n Please Try Again!');" +
		            "window.location.href = 'login.jsp';" + 
		            "</script>");
		}
	}

}

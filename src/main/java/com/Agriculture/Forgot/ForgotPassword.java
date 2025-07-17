package com.Agriculture.Forgot;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.Agriculture.signup.SignUpDAO;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String nick = request.getParameter("nick");
		
		SignUpDAO daoObj = new SignUpDAO();
		if(daoObj.checkDuplicate(mail)) {
			out.print("<script>" +
		            "alert('Email Does Not Exist!');" +
		            "window.location.href = 'passwordReset.jsp';" + 
		            "</script>");
		}
		
		ForgotPasswordDAO fPDao = new ForgotPasswordDAO();
		if(!fPDao.checkNick(mail, nick)) {
			out.print("<script>" +
		            "alert('InCorrect NickName(Security Question)!');" +
		            "window.location.href = 'passwordReset.jsp';" + 
		            "</script>");
		}else if(fPDao.resetPassword(mail, pass)) {
			out.print("<script>" +
		            "alert('Succesful Password Reset!');" +
		            "window.location.href = 'login.jsp';" + 
		            "</script>");
		}else {
			out.print("<script>" +
		            "alert('UnSuccesful Password Reset!\nPlease Try Again');" +
		            "window.location.href = 'login.jsp';" + 
		            "</script>");
		}
	}
}

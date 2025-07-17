package com.Agriculture.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String edit = (String) request.getParameter("edit");
		String value = (String) request.getParameter("value");
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession();
		SignUpDAO sUDao = new SignUpDAO();
		int id = (int)session.getAttribute("uid");
		
		if(sUDao.editProfile(edit,value,id)) {
			
			out.print("<script>" +
		            "alert('changes successful');" +
		        		            "</script>");
			response.sendRedirect("FetchDetails");
		
			
		}
		else
		{
			out.print("<script>" +
		            "alert('failed to change');" +
		            "window.location.href = 'EditPfl.jsp';" + 
		            "</script>");
	}

}}

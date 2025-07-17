package com.Agriculture.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/MarkAsRead")
public class MarkAsRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int messageId = Integer.parseInt(request.getParameter("message_id"));
		PrintWriter out=response.getWriter();
		MessageDAO mDao = new MessageDAO();
		
		
		 if( mDao.markAsRead(messageId))
 		{
 	out.print("<script>" +
	            "alert('mark as read completed');" +
	            "window.location.href = 'GetMessage';" + 
	            "</script>");
	
 }
 else {
 	out.print("<script>" +
	            "alert('!error occured in mark as read');" +
	            "window.location.href = 'GetMessage';" + 
	            "</script>");
	
 }

	}
}
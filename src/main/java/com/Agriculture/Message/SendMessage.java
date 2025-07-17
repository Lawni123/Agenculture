package com.Agriculture.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    PrintWriter out=response.getWriter();
		MessageDAO mDao = new MessageDAO();
		
        int sid = (int)session.getAttribute("uid");
        int rid = 0;
        if(sid==3) {
        	rid=Integer.parseInt(request .getParameter("sid"));
        	int id=Integer.parseInt(request.getParameter("id"));
        	
        	mDao.markAsRead(id);
        }else {
        	rid = 3;
        }
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        if( mDao.addMessage(sid, rid, subject, message))
        		{
        	out.print("<script>" +
		            "alert('Message sent');" +
		            "window.location.href = 'Message.jsp';" + 
		            "</script>");
		
        }
        else {
        	out.print("<script>" +
		            "alert('!error occured Message not sent');" +
		            "window.location.href = 'Message.jsp';" + 
		            "</script>");
		
        }
       
	}
  
}

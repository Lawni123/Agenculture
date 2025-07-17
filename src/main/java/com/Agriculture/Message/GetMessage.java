package com.Agriculture.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Message;

@WebServlet("/GetMessage")
public class GetMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageDAO mDao = new MessageDAO();
		HttpSession session= request.getSession();
		int id =(int) session.getAttribute("uid");
		ArrayList<Message> messageList = mDao.fetchMessage(id);
		
		session.setAttribute("messageList", messageList);
		if(session.getAttribute("name").equals("Admin")) {
			response.sendRedirect("Message.jsp");
		}
		else {
			response.sendRedirect("Inbox.jsp");
		}
		
	}

}
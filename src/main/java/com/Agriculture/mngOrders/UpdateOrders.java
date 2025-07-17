package com.Agriculture.mngOrders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/UpdateOrders")
public class UpdateOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int orderId = Integer.parseInt(request.getParameter("orderId"));
	String status =request.getParameter("status");
	AdminDAO aDao = new AdminDAO();
	if(aDao.updateOrders(orderId,status))
	{
		response.getWriter().print("<script>"
		        + "alert('Successfully updated');"
		        + "window.location.href = 'AdminDashboard.jsp';"
		        + "</script>");

	}
	
	
	}
}

package com.Agriculture.mngOrders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Order;

@WebServlet("/FetchAOrders")
public class FetchAOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String status = request.getParameter("status");
		AdminDAO aDao = new AdminDAO();
		ArrayList<Order> orderlist = aDao.fetchOrders(status);
		session.removeAttribute("orderlist");
		session.setAttribute("orderlist",orderlist);
		session.setAttribute("status", status);
		response.sendRedirect("AdminControl.jsp");
	
	}

}

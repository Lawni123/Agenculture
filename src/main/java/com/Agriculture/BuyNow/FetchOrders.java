package com.Agriculture.BuyNow;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Order;


@WebServlet("/FetchOrders")
public class FetchOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     HttpSession session = request.getSession();
	     int userId = (int) session.getAttribute("uid");
	     BuyNowDAO bNDao = new BuyNowDAO();
	     ArrayList<Order> orderlist=bNDao.fetchOrders(userId);
	     session.removeAttribute("orderlist");
	     session.setAttribute("orderlist",orderlist);
	     response.sendRedirect("Orders.jsp");
	     
	}

}

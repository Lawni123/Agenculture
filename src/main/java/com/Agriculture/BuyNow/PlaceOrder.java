package com.Agriculture.BuyNow;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Order;


@WebServlet("/Order")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String prodName=request.getParameter("prodName");
		int prodId = Integer.parseInt(request.getParameter("prodId"));
		int price = (int) Double.parseDouble(request.getParameter("price"));
		int qty   =Integer.parseInt(request.getParameter("qty"));
		ArrayList<Order> orderlist = new ArrayList();
		Order od = new Order();
		od.setProdId(prodId);
		
		od.setProdPrice(price);
		od.setProdQty(qty);
		od.setProdName(prodName);
		od.setTotalAmt(qty*price);
		orderlist.add(od);
		session.removeAttribute("orderlist");
		session.setAttribute("orderlist",orderlist);
		response.sendRedirect("BuyNow.jsp");
	}

}

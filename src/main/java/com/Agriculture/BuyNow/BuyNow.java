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
import com.Agriculture.cart.AddToCartDAO;


@WebServlet("/BuyNow")
public class BuyNow extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId           = (int) session.getAttribute("uid");
		int totalAmt        =  Integer.parseInt(request.getParameter("Total"));
	    String paymentMethod = request.getParameter("paymentMethod");
	    ArrayList<Order> orderlist =(ArrayList<Order>)session.getAttribute("orderlist");
	    BuyNowDAO bNDao =  new BuyNowDAO();
	    if(bNDao.placeOrder(userId,paymentMethod,orderlist,totalAmt)) {
	    	 AddToCartDAO aTCDao= new AddToCartDAO(); 
	    	 for(Order order : orderlist) {
	    		 
	    		 aTCDao.deleteItem(userId,order.getProdId(),order.getCartId());
	    	 }
	    	 response.sendRedirect("Ordered.jsp");
	    }else {
	    	response.getWriter().print("<script>" +
		            "alert('please try again!');" +
		            "window.location.href = 'BuyNow.jsp';" + 
		            "</script>");
	    }
	}

}

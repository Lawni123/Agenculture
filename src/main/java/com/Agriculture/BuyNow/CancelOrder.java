package com.Agriculture.BuyNow;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BuyNowDAO bNDao = new BuyNowDAO();
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		if (bNDao.cancelOrder(orderId)) {
			response.sendRedirect("TrackOrder?orderId="+orderId);
		}

	}

}

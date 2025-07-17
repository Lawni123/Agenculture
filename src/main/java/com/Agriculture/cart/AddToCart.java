package com.Agriculture.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int prodId = Integer.parseInt(request.getParameter("prodId"));
		int userId = Integer.parseInt(request.getParameter("uid"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int price = qty * (int) Double.parseDouble(request.getParameter("price"));

		AddToCartDAO aTCDao = new AddToCartDAO();
		PrintWriter out = response.getWriter();
		if (qty <= aTCDao.checkQuantity(prodId))
			if (aTCDao.checkDuplicate(prodId)) {
				if (aTCDao.addToCart(prodId, userId, qty, price)) {
					out.print("<script>" + "alert('Successfully Added to Cart');" + "window.location.href = 'Cart';"
							+ "</script>");
				} else {
					out.print("<script>" + "alert('Failed to add!');" + "window.location.href = 'products.jsp';"
							+ "</script>");
				}
			} else {
				if (aTCDao.increaseQty(prodId, qty,userId,price)) {
					out.print("<script>" + "alert('Successfully Increased Quantity');"
							+ "window.location.href = 'Cart';" + "</script>");
				} else {
					out.print("<script>" + "alert(' Failed to increase qty!');"
							+ "window.location.href = 'products.jsp';" + "</script>");
				}
			}
		else {
			out.print("<script>" + "alert('sorry out of stock!');" + "window.location.href = 'products.jsp';"
					+ "</script>");
		}

	}

}

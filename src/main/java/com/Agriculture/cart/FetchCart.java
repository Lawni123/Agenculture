package com.Agriculture.cart;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Cart;
import com.Agriculture.OBJ.Order;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Cart")
public class FetchCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("uid");
		
		AddToCartDAO aTCDao = new AddToCartDAO();
		ArrayList<Cart> cartList = aTCDao.fetchCart(uid);
		request.setAttribute("cartList", cartList);
		
		ArrayList<Order> orderlist = new ArrayList();
		session.removeAttribute("orderlist");
		for(Cart cart : cartList) {
			Order od = new Order();
			od.setProdId(cart.getProdId());
			od.setProdPrice(cart.getpPrice());
			od.setProdQty(cart.getQuantity());
			od.setProdName(cart.getProductName());
			od.setTotalAmt(cart.getQuantity()*cart.getpPrice());
			od.setCartId(cart.getCartId());
			orderlist.add(od);
			
		}
		session.setAttribute("orderlist",orderlist);
		RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
		rd.forward(request, response);
	}

}

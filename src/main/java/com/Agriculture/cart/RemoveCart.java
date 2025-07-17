package com.Agriculture.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Agriculture.deleteAccount.DeleteAccountDAO;


@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("uid"); 
		int prodId= Integer.parseInt(request.getParameter("prodId"));
		int cartId= Integer.parseInt(request.getParameter("cartId"));
	    AddToCartDAO aTCDao= new AddToCartDAO();
	   
        if(aTCDao.deleteItem(userId,prodId,cartId))
        {
        	
        	response.getWriter().println("<script>alert('successfully removed');"
        			+ "window.location.href = 'Cart';</script>");
        }
        else 
        {
        	response.getWriter().println("<script>alert('failed to remove,Try again');"
        			+ "window.location.href = 'Cart';</script>"); 
        }
		
	}

}

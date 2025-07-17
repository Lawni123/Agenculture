package com.Agriculture.BuyNow;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Product;
import com.Agriculture.fruits.FruitsDAO;

@WebServlet("/FetchEquipment")
public class FetchEquipment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BuyNowDAO bDao = new BuyNowDAO();
		
		ArrayList<Product> productList = bDao.fetchEquipment();
		
		HttpSession session = request.getSession();
		session.setAttribute("productList", productList);
		
		response.sendRedirect("Rental.jsp");
	}
	}



package com.Agriculture.vegetables;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Product;

@WebServlet("/Vegetables")
public class Vegetables extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VegetablesDAO vDao = new VegetablesDAO();
		
		ArrayList<Product> productList = vDao.fetchProduct();
		
		HttpSession session = request.getSession();
		session.setAttribute("productList", productList);
		
		response.sendRedirect("vegetables.jsp");
	}

}

package com.Agriculture.Mngprod;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/IncreaseQty")
public class IncreaseQty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String quantityStr = request.getParameter("quantity");

        if (productName != null && quantityStr != null) {
            int quantity = Integer.parseInt(quantityStr);
            AddProductDAO aPDao = new AddProductDAO();
            if (aPDao.increaseQty(productName.toLowerCase(), quantity)) {
                response.getWriter().print("<script>" +
                        "alert('Quantity Updated Successfully!');" +
                        "</script>");
                response.sendRedirect("products.jsp");
            } else {
                response.getWriter().print("<script>" +
                        "alert('Failed to Update Quantity!');" +
                    
                        "</script>");
            }
        }
    }
}
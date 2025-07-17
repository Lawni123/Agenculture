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

@WebServlet("/TrackOrder")
public class TrackOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BuyNowDAO bNDao = new BuyNowDAO();
        
        // Retrieve the orderId parameter
        String orderIdString = request.getParameter("orderId");
       
        // Check if orderId is valid
        if (orderIdString != null && !orderIdString.isEmpty()) {
            try {
                // Try parsing the orderId to an integer
                int orderId = Integer.parseInt(orderIdString);
                
                // Track the order using the parsed orderId
                ArrayList<Order> orderlist = bNDao.trackOrder(orderId);
                
                // Set the orderlist in the session
                HttpSession session = request.getSession();
                session.removeAttribute("orderlist");
                session.setAttribute("orderlist", orderlist);
                
                // Redirect to the TrackOrder.jsp page
                response.sendRedirect("TrackOrder.jsp");
            } catch (NumberFormatException e) {
                // Handle invalid orderId format
                request.setAttribute("error", "Invalid order ID format.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Handle missing orderId parameter
            request.setAttribute("error", "Order ID is required.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

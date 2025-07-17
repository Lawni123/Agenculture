package com.Agriculture.BuyNow;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;


@WebServlet("/numberOfOrders")
public class numberOfOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Map<String, Integer> orderMap = new LinkedHashMap<>();
		 BuyNowDAO bNDao = new BuyNowDAO();
		 orderMap.put("ordered", bNDao.fetchNumber("ordered") );
		 orderMap.put("shipped", bNDao.fetchNumber("shipped") );
		 orderMap.put("out", bNDao.fetchNumber("out for delivery") );
		 orderMap.put("complete", bNDao.fetchNumber("complete") );
		 orderMap.put("cancelled", bNDao.fetchNumber("cancelled") );
		 orderMap.put("returned", bNDao.fetchNumber("return") );
		 String json = new Gson().toJson(orderMap);
	        response.setContentType("application/json");    
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

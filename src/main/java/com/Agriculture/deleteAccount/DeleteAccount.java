package com.Agriculture.deleteAccount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Delete")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("user_id"));
	    DeleteAccountDAO dDao= new  DeleteAccountDAO();
        if(dDao.deleteAccount(id))
        {
        	response.sendRedirect("ViewAccount");
        }
        else 
        {
        	response.getWriter().println("<script>alert('failed to delete,Try again');"
        			+ "window.location.href = 'ViewAccount.jsp';</script>"); 
        }
}
}
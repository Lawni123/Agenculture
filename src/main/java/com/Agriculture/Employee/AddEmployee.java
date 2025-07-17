package com.Agriculture.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.Agriculture.signup.SignUpDAO;


@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();
		
		String Name = request.getParameter("name");
		String Email = request.getParameter("mail");
		String Phone = request.getParameter("phone");
		String Role = request.getParameter("role");
		String Salary = request.getParameter("salary");	
		String Address = request.getParameter("addr");	
		String DateOfBirth = request.getParameter("date");

		AddEmployeeDAO daoObj = new AddEmployeeDAO();
		if(!daoObj.checkDuplicate(Email)) {
			out.print("<script>" +
		            "alert('User Email Already Exist!');" +
		            "window.location.href = 'AddEmployee.jsp';" + 
		            "</script>");
		}else if(daoObj.AddEmployee(Name,Email, Phone,Role, Salary,Address,DateOfBirth)){
				out.print("<script>" +
			            "alert('Succesfully Added Employee!');" +
			            "window.location.href = 'ViewEmployees.jsp';" + 
			            "</script>");
		}else {
			out.print("<script>" +
		            "alert('Error Occured!\n Please Try Again!');" +
		            "window.location.href = 'ViewEmployees.jsp';" + 
		            "</script>");
		}
	}


	}



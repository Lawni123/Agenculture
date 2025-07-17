package com.Agriculture.Employee;
import com.Agriculture.fruits.FruitsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddEmployeeDAO {

	FruitsDAO conObj = new FruitsDAO();

	public boolean checkDuplicate(String mail) {
		String query = "SELECT email FROM employee";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = conObj.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					if (mail.equals(resultSet.getString("email")))
						return false;
				}
			}
		} catch (SQLException e) {
			System.err.println("Error executing query.");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				System.err.println("Error closing ResultSet.");
				e.printStackTrace();
			}

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {
				System.err.println("Error closing PreparedStatement.");
				e.printStackTrace();
			}

			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("Error closing Connection.");
				e.printStackTrace();
			}
		}

		return true;
	}

	public boolean AddEmployee( String name,String email, String phone, String role,String salary, String address,
			String dateOfBirth) {
		String query = "INSERT INTO employee(name,email,phone_number,role,salary,address,date_of_birth) values (?,?,?,?,?,?,?)";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet;
		int res = 0;
		String id = null;

		try {
			connection = conObj.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				preparedStatement.setString(1, name);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, phone);
				preparedStatement.setString(4, role);
				preparedStatement.setString (5, salary);
				preparedStatement.setString(6, address);
				preparedStatement.setString(7, dateOfBirth);

				res = preparedStatement.executeUpdate();
			}
			
		} catch (SQLException e) {
			System.err.println("Error executing query.");
			e.printStackTrace();
		} finally {

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {
				System.err.println("Error closing PreparedStatement.");
				e.printStackTrace();
			}

			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("Error closing Connection.");
				e.printStackTrace();
			}
		}

		if (res > 0) {
			return true;
		}
		return false;

		
	}

}

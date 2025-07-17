package com.Agriculture.vegetables;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import com.Agriculture.OBJ.Product;

public class VegetablesDAO {

	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/agriculture";
		String username = "root";
		String password = "admin";

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			return DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			System.err.println("MySQL Driver not found!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("Error connecting to the database.");
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Product> fetchProduct() {

		String query = "SELECT * FROM products where type='vegetable'";

		ArrayList<Product> productList = new ArrayList<Product>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					Product product = new Product();
					product.setName(resultSet.getString("name"));
					product.setInfo(resultSet.getString("info"));
					product.setPrice(resultSet.getInt("price"));
					product.setPic(resultSet.getString("pic"));
					product.setQty(resultSet.getInt("qty"));
					product.setId(resultSet.getInt("prod_id"));
					productList.add(product);
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
		return productList;

	}
}

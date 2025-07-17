package com.Agriculture.mngOrders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Order;
import com.Agriculture.fruits.FruitsDAO;

public class AdminDAO {

	public ArrayList<Order> fetchOrders(String status) {
		String query =  "SELECT o.order_id, p.name AS pname,u.name,u.address,o.total_amt,o.status,oi.quantity " +
	               "FROM orders o " +
	               "JOIN order_items oi ON o.order_id = oi.order_id " +
	               "JOIN products p ON oi.prod_id = p.prod_id " + 
	               "JOIN user u ON u.user_id = o.user_id " +
	               "WHERE o.status = ? " +
	               "ORDER BY o.order_id DESC"; 

		
		ArrayList<Order> orderlist = new ArrayList<Order>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	                        
		FruitsDAO fDao = new FruitsDAO();
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, status);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) 
				{
				 Order order = new Order();
				order.setOrderId(resultSet.getInt("order_id"));
				order.setProdName(resultSet.getString("pname"));
				order.setuName(resultSet.getString("name"));
				order.setuAddress(resultSet.getString("address"));
				order.setTotalAmt(resultSet.getInt("total_amt"));
				order.setStatus(resultSet.getString("status"));
				order.setProdQty(resultSet.getInt("quantity"));
				
					orderlist.add(order);
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
		return orderlist;
		
	}

	public boolean updateOrders(int orderId, String status) {
		String query = "UPDATE Orders set status = ? WHERE order_id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int res = 0;
		FruitsDAO fDao = new FruitsDAO();
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(2, orderId);
				preparedStatement.setString(1, status);
				

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

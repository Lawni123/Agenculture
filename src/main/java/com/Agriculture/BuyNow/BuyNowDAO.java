package com.Agriculture.BuyNow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Cart;
import com.Agriculture.OBJ.Order;
import com.Agriculture.OBJ.Product;
import com.Agriculture.fruits.FruitsDAO;

public class BuyNowDAO {
	FruitsDAO fDao = new FruitsDAO();
	public boolean placeOrder(int userId, String paymentMethod, ArrayList<Order> orderlist,int totalAmt) {
		String query1 = "insert into Order_Items(order_id,prod_id,quantity,price) values (?,?,?,?)";
		String query = "select order_id from Orders where user_id=? and status='ordered'";
		String query2 = "insert into Orders(user_id,total_amt,payment_method,status) values (?,?,?,?)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int res = 0;
		ResultSet resultset  =null; 
		
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query2);

				preparedStatement.setInt(1, userId);
				preparedStatement.setInt(2,  totalAmt - (totalAmt * 15 / 100));
				preparedStatement.setString(3, paymentMethod);
				preparedStatement.setString(4, "ordered");

				res = preparedStatement.executeUpdate();
				int orderid=0;
				if (connection != null) {
					preparedStatement = connection.prepareStatement(query);

					preparedStatement.setInt(1, userId);

					resultset = preparedStatement.executeQuery();
					while(resultset.next()) {
						orderid = resultset.getInt("order_id");
					}

				}
				if (connection != null) {
					preparedStatement = connection.prepareStatement(query1);

					for(Order order:orderlist) {
						preparedStatement.setInt(1, orderid);
						preparedStatement.setInt(2, order.getProdId() );
						preparedStatement.setInt(3, order.getProdQty());
						preparedStatement.setInt(4,  order.getProdPrice() - (order.getProdPrice() * 15 / 100));
						
						res = preparedStatement.executeUpdate();
						if(res>0) {
							removeProdQty(order.getProdId(),order.getProdQty());
						}
					}
					

				}

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
	
	public boolean removeProdQty(int prodId,int prodQty){
		String query1 = "UPDATE products set qty=? where prod_id=?";
		String query = "select qty from products where prod_id=? ";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int res = 0;
		ResultSet resultset  =null; 
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				preparedStatement.setInt(1, prodId);
				resultset = preparedStatement.executeQuery();
				int qty =0;
				if(resultset.next()) {
					qty=resultset.getInt("qty");
				}
				qty-=prodQty;
				if (connection != null) {
					preparedStatement = connection.prepareStatement(query1);

					preparedStatement.setInt(1, qty);
					preparedStatement.setInt(2, prodId);

					res = preparedStatement.executeUpdate();
					

				}
				

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
	public ArrayList<Order> fetchOrders(int uid) {
		String query =  "SELECT o.order_id, p.name,o.status " +
	               "FROM orders o " +
	               "JOIN order_items oi ON o.order_id = oi.order_id " +
	               "JOIN products p ON oi.prod_id = p.prod_id " +  
	               "WHERE o.user_id = ? " +
	               "ORDER BY o.order_id DESC"; 

		
		ArrayList<Order> orderlist = new ArrayList<Order>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	                        
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, uid);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) 
				{
				 Order order = new Order();
				order.setOrderId(resultSet.getInt("order_id"));
				order.setProdName(resultSet.getString("name"));
				order.setStatus(resultSet.getString("status"));
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

	public ArrayList<Order> trackOrder(int orderId) {
		
		String query =  "SELECT o.status,p.name,oi.price,oi.quantity,o.total_amt,o.order_id " +
	               "FROM orders o " +
	               "JOIN order_items oi ON o.order_id = oi.order_id " +
	               "JOIN products p ON oi.prod_id = p.prod_id " +  
	               "WHERE o.order_id = ? " ; 

		
		ArrayList<Order> orderlist = new ArrayList<Order>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	                        
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, orderId);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) 
				{
				 Order order = new Order();
				 order.setStatus(resultSet.getString("status"));
				 order.setProdName(resultSet.getString("name"));
				 order.setProdPrice(resultSet.getInt("price"));
				 order.setProdQty(resultSet.getInt("quantity"));
				 order.setTotalAmt(resultSet.getInt("total_amt"));
				 order.setOrderId(resultSet.getInt("order_id"));
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

	public boolean cancelOrder(int orderId) {
		String query = "UPDATE Orders set status = 'cancelled' WHERE order_id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int res = 0;
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				preparedStatement.setInt(1, orderId);
				

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
	
public int fetchNumber(String status) 
{
	String query =  "SELECT count(*) as Count FROM Orders where status= ? " ; 

	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
                     
	try {
		connection = fDao.getConnection();
		if (connection != null) {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, status);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) 
			{
			 return resultSet.getInt("Count");
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
	return 0;
	
}
public ArrayList<Product> fetchEquipment() {

	String query = "SELECT * FROM Equipment";

	ArrayList<Product> productList = new ArrayList<Product>();

	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;

	try {
		connection = fDao.getConnection();
		if (connection != null) {
			preparedStatement = connection.prepareStatement(query);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Product product = new Product();
				product.setName(resultSet.getString("name"));
				product.setInfo(resultSet.getString("description"));
				product.setPrice(resultSet.getInt("rental_price_per_hour"));
				product.setPic(resultSet.getString("pic"));
				product.seteStatus(resultSet.getString("availability_status"));
				product.setId(resultSet.getInt("equipment_id"));
				product.setQty(resultSet.getInt("number"));
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
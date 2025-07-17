package com.Agriculture.cart;

import java.io.PrintWriter;
import com.Agriculture.OBJ.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Product;
import com.Agriculture.fruits.FruitsDAO;

public class AddToCartDAO {
	FruitsDAO conObj = new FruitsDAO();

	public int checkQuantity(int id) {
		String query = "SELECT qty FROM products where prod_id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = conObj.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, id);
				resultSet = preparedStatement.executeQuery();

				if (resultSet.next()) {
					return resultSet.getInt("qty");

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

		return -1;
	}

	public boolean checkDuplicate(int id) {
		String query = "SELECT prod_id FROM cart_items";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = conObj.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					if (id == (resultSet.getInt("prod_id")))
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

	public boolean addToCart(int prodId, int userId, int qty, int price) {
		String query = "insert into cart_items(user_id,prod_id,quantity,price) values (?,?,?,?)";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int res = 0;

		try {
			connection = conObj.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				preparedStatement.setInt(1, userId);
				preparedStatement.setInt(2, prodId);
				preparedStatement.setInt(3, qty);
				preparedStatement.setInt(4, price);

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

	public boolean increaseQty(int prodId, int qty, int user_id, int price) {
		String getQuery = "SELECT quantity FROM cart_items WHERE prod_id= ? AND user_id= ? ";
		String setQuery = "UPDATE cart_items SET quantity = ?,price=? WHERE prod_id = ? AND user_id=?";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int res = 0;

		try {
			connection = conObj.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(getQuery);

				preparedStatement.setInt(1, prodId);
				preparedStatement.setInt(2, user_id);

				resultSet = preparedStatement.executeQuery();

				if (resultSet.next()) {
					int preQty = resultSet.getInt("quantity");
					if (preQty > 0) {
						qty += preQty;
						price *= qty;
						if (connection != null) {
							preparedStatement = connection.prepareStatement(setQuery);

							preparedStatement.setInt(1, qty);
							preparedStatement.setInt(2, price);
							preparedStatement.setInt(3, prodId);
							preparedStatement.setInt(4, user_id);
							res = preparedStatement.executeUpdate();
						}
					}
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

	public ArrayList<Cart> fetchCart(int uid) {

		String query = "SELECT * FROM cart_items WHERE user_id = ?";
		String query1 = "SELECT name,price FROM products where prod_id=?";

		ArrayList<Cart> cartList = new ArrayList<Cart>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet1 = null;
		ResultSet resultSet2 = null;
		FruitsDAO fDao = new FruitsDAO();
		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, uid);
				resultSet1 = preparedStatement.executeQuery();

				while (resultSet1.next()) {
					Cart cart = new Cart();
					cart.setPrice(resultSet1.getInt("price"));
					cart.setProdId(resultSet1.getInt("prod_id"));
					cart.setUserId(resultSet1.getInt("user_id"));
					cart.setCartId(resultSet1.getInt("cart_id"));
					cart.setQuantity(resultSet1.getInt("quantity"));
					if (connection != null) {
						preparedStatement = connection.prepareStatement(query1);
						preparedStatement.setInt(1, resultSet1.getInt("prod_id"));
						resultSet2 = preparedStatement.executeQuery();

						if (resultSet2.next()) {

							cart.setProductName(resultSet2.getString("name"));
							cart.setpPrice(resultSet2.getInt("price"));
						}
					}
					cartList.add(cart);
				}
			}
		} catch (SQLException e) {
			System.err.println("Error executing query.");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet1 != null && resultSet2 != null) {
					resultSet1.close();
					resultSet2.close();
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
		return cartList;
	}

	public boolean deleteItem(int userId, int prodId, int cartId) {
		String query = "DELETE from cart_items WHERE user_id=? AND prod_id=? AND cart_id =?";

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int res = 0;
		FruitsDAO fDao = new FruitsDAO();

		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				preparedStatement.setInt(1, userId);
				preparedStatement.setInt(2, prodId);
				preparedStatement.setInt(3, cartId);

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


package com.Agriculture.Mngprod;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Agriculture.fruits.FruitsDAO;


public class AddProductDAO {
	FruitsDAO conObj = new FruitsDAO();
	
	public boolean checkDuplicate(String name) {
        String query = "SELECT name FROM products";
        
 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);

                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                	if(name.equals(resultSet.getString("name")))
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

	public boolean addProduct(String name,String info,String price,String type,String qty,String picName) {
		String query = "INSERT INTO products (name,info,price,type,pic,qty) VALUES (?,?,?,?,?,?)";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, name); 
                preparedStatement.setString(2, info); 
                preparedStatement.setString(3, price); 
                preparedStatement.setString(4, type);
                preparedStatement.setString(5, picName); 
                preparedStatement.setString(6, qty); 
                
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
        
        if(res>0) {
        	return true;
        }
        return false;  
		
	}

	public boolean increaseQty(String name, int qty) {
		 String getQuery = "SELECT qty FROM products WHERE name= ? "; 
		 String setQuery = "UPDATE products SET qty = ? WHERE name = ?";
	        
		 
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        int res = 0;
	        
	        try {
	            connection = conObj.getConnection();
	            if (connection != null) {
	                preparedStatement = connection.prepareStatement(getQuery);
	                
	                preparedStatement.setString(1, name);
	                
	                resultSet = preparedStatement.executeQuery();

	                if (resultSet.next()) {
	                	int preQty = resultSet.getInt("qty");
	                	if(preQty>0) {
	                			qty+=preQty;
	                		if (connection != null) {
	        	                preparedStatement = connection.prepareStatement(setQuery);
	        	                
	        	                preparedStatement.setInt(1, qty);
	        	                preparedStatement.setString(2, name);
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
}

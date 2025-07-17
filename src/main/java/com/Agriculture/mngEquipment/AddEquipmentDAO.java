package com.Agriculture.mngEquipment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Agriculture.fruits.FruitsDAO;

public class AddEquipmentDAO {
FruitsDAO conObj = new FruitsDAO();
	
	public boolean checkDuplicate(String name) {
        String query = "SELECT name FROM Equipment";
        
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

	public boolean addEquipment(String name, String info, int price, String picName, int number) {
		String query = "INSERT INTO Equipment (name,description,rental_price_per_hour,pic,number) VALUES (?,?,?,?,?)";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, name); 
                preparedStatement.setString(2, info); 
                preparedStatement.setInt(3, price); 
                preparedStatement.setString(4, picName); 
                preparedStatement.setInt(5, number); 
                
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
		 String getQuery = "SELECT number FROM Equipment WHERE name= ? "; 
		 String setQuery = "UPDATE Equipment SET number = ? WHERE name = ?";
	        
		 
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
	                	int preQty = resultSet.getInt("number");
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
	public static void main(String Args[]) {
		AddEquipmentDAO dao = new AddEquipmentDAO();
		System.out.println(dao.addEquipment("plough","ygdfwyfc",300,"hvj", 2)); 
	}


}

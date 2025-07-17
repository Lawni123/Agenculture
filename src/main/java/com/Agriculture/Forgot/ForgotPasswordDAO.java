package com.Agriculture.Forgot;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Agriculture.fruits.FruitsDAO;

public class ForgotPasswordDAO {
	 FruitsDAO conObj = new FruitsDAO();
	
	public boolean checkNick(String mail,String nick) {
		String query = "SELECT * FROM user WHERE email = ? AND sec_answer=?";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean res=false;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, mail); 
                preparedStatement.setString(2, nick); 
                
                resultSet = preparedStatement.executeQuery();

                res=resultSet.next();
                
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
       
    
			if (res) {
			    return true; 
			}
        return res;  
		
	}

	public boolean resetPassword(String mail,String pass) {
		String query = "UPDATE user SET password = ? WHERE email=?";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, pass); 
                preparedStatement.setString(2, mail); 
                
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
}

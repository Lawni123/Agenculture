package com.Agriculture.deleteAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.Agriculture.fruits.FruitsDAO;

public class DeleteAccountDAO {
	public boolean deleteAccount(int id) {
		String query = "DELETE  from user WHERE user_id=?";
	       
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        int res = 0;
        FruitsDAO fDao = new FruitsDAO();
        
        try {
            connection = fDao.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setInt(1, id); 
                
                 
                
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

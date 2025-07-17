package com.Agriculture.login;

import java.sql.*;
import com.Agriculture.fruits.FruitsDAO;

public class LoginDAO {
  
    public boolean check(String uname, String pass) {
        String query = "SELECT * FROM user WHERE email = ? AND password = ?";
        FruitsDAO fDao = new FruitsDAO();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = fDao.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, uname); 
                preparedStatement.setString(2, pass); 

                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    return true; 
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

        return false; 
    }
}

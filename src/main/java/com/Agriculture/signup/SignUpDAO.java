package com.Agriculture.signup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Agriculture.fruits.FruitsDAO;

public class SignUpDAO {
	FruitsDAO conObj = new FruitsDAO();
	
	public boolean checkDuplicate(String mail) {
        String query = "SELECT email FROM user";
        
 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);

                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                	if(mail.equals(resultSet.getString("email")))
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
	public boolean registerUser(String name,String mail,String phone,String pass,String nick, String addr) {
		String query = "INSERT INTO user (name,email,password,phone_number,address,sec_answer) values (?,?,?,?,?,?)";
        String idQuery = "SELECT user_id FROM user WHERE email = ?";
        String imgQuery = "INSERT INTO profile (user_id) VALUES (?)";
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet;
        int res = 0;
        String id =null;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, name); 
                preparedStatement.setString(2, mail); 
                preparedStatement.setString(3, pass); 
                preparedStatement.setString(4, phone);
                preparedStatement.setString(5, addr);
                preparedStatement.setString(6, nick); 
                
                res = preparedStatement.executeUpdate();   
            }
            if (connection != null) {
                preparedStatement = connection.prepareStatement(idQuery);
                preparedStatement.setString(1, mail); 

                resultSet = preparedStatement.executeQuery();

                if(resultSet.next()) {
                	id = resultSet.getString("user_id");
                }
            }
            if (connection != null) {
                preparedStatement = connection.prepareStatement(imgQuery);
                
                preparedStatement.setString(1, id); 
             
                
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
	public boolean editImg(int id, String picName) {
		String query = "UPDATE profile SET img =? WHERE user_id=?";
       
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet;
        int res = 0;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, picName); 
                preparedStatement.setInt(2, id); 
                 
                
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
	public boolean editProfile(String edit,String value,int id){
		String query = "UPDATE user SET " + edit + " = ? WHERE user_id = ?";

	       
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connection = conObj.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                
                preparedStatement.setString(1, value); 
                preparedStatement.setInt(2, id); 
                
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
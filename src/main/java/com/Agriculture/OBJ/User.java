package com.Agriculture.OBJ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Agriculture.fruits.FruitsDAO;

public class User {
	private int id;
	private String name;
	private String email;
	private String  phone;
	private String address;
	private String img;
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name.substring(0, 1).toUpperCase() + name.substring(1);
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
		
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void getUserDetails(String mail) {
		FruitsDAO lDao = new FruitsDAO();
		
		String query = "SELECT * FROM user WHERE email = ?";
		String imgQuery = "SELECT img FROM profile WHERE user_id = ?";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = lDao.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, mail); 

                resultSet = preparedStatement.executeQuery();

                if(resultSet.next()) {
                	setName(resultSet.getString("name"));
                    setEmail(mail);
                    setPhone(resultSet.getString("phone_number"));
                    setId(resultSet.getInt("user_id"));
                    setAddress(resultSet.getString("address"));
                }
                if (connection != null) {
                    preparedStatement = connection.prepareStatement(imgQuery);
                    preparedStatement.setInt(1, getId()); 

                    resultSet = preparedStatement.executeQuery();

                    if(resultSet.next()) {
                    	setImg(resultSet.getString("img"));
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
	}

}

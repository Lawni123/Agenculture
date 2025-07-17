package com.Agriculture.viewAcc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.Agriculture.OBJ.User;
import com.Agriculture.fruits.FruitsDAO;
public class ViewAccountDAO {
	public ArrayList<User> fetchUser()
	{
		
		String query = "SELECT * FROM user  ";

		ArrayList<User> userList = new ArrayList<User>();
		FruitsDAO fDao = new FruitsDAO();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);

				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					User user = new User();
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));;
					user.setPhone(resultSet.getString("phone_number"));
					user.setAddress(resultSet.getString("address"));
					user.setId(resultSet.getInt("user_id"));
					System.out.println(user.getId());
					userList.add(user);
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
		return userList;

		
		
	}

}
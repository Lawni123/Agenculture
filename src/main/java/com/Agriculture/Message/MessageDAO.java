package com.Agriculture.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Agriculture.OBJ.Message;
import com.Agriculture.fruits.FruitsDAO;

public class MessageDAO {
	FruitsDAO fDao = new FruitsDAO();
	public boolean addMessage(int sid,int rid,String subject,String message) {
		String query = "INSERT INTO messages (sender_id,receiver_id,subject,message) values (?,?,?,?)";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connection = fDao.getConnection();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setInt(1, sid); 
                preparedStatement.setInt(2, rid); 
                preparedStatement.setString(3, subject); 
                preparedStatement.setString(4, message);
                
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
	
	public ArrayList<Message> fetchMessage(int id) {

		String query = "SELECT * FROM messages WHERE receiver_id = ? ORDER BY message_id DESC";

		ArrayList<Message> MessageList = new ArrayList<Message>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, id);

				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					String nameMail[] = getNameMail(resultSet.getString("sender_id"));
					Message message = new Message();
					message.setId(resultSet.getString("message_id"));
					message.setSid(resultSet.getInt("sender_id"));
					message.setSender(nameMail[0]);
					message.setSubject(resultSet.getString("subject"));
					message.setMail(nameMail[1]);
					message.setMessage(resultSet.getString("message"));
					MessageList.add(message);
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
		return MessageList;

	}
	

	
	private String[] getNameMail(String user_id) {
		String nameMail[] = new String[2];
		
		String query = "SELECT name,email FROM user where user_id=?";
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = fDao.getConnection();
			if (connection != null) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, user_id);

				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					nameMail[0]=resultSet.getString("name");
					nameMail[1]=resultSet.getString("email");
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
		return nameMail;
	}

	public boolean markAsRead(int id) {
		String query = "UPDATE  messages SET is_read=1 WHERE message_id = ?;";
        
		 
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
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



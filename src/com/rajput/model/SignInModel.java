package com.rajput.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rajput.dtos.SignInDTO;

public class SignInModel {
	public Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MySQL","root","rajputvishal");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	public boolean insertIntoDatabase(SignInDTO newUser) throws SQLException{
	
		if((newUser.getPassword()).equals(newUser.getPasswordAgain())){
			Connection con = null;
			PreparedStatement pstmt = null;
			//ResultSet rs = null;	
			try {
				con = this.getConnection();
				pstmt = con.prepareStatement("insert into institutesProjdb.users values(?,?,?,?,?)");
				pstmt.setString(1, newUser.getFullName());
				pstmt.setString(2, newUser.getUsername());
				pstmt.setString(3, newUser.getPassword());
				pstmt.setString(4, newUser.getEmail());
				pstmt.setString(5, newUser.getContactNo());
				pstmt.executeUpdate();
				System.out.println("Values of new user inserted");
				return true;
			} catch(Exception e){
				e.printStackTrace();
				return false;
			}finally{
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}
		} else {
			return false;
		}
	}
}

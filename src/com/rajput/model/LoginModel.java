package com.rajput.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rajput.dtos.LoginDTO;

public class LoginModel {
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
	public boolean checkFromDatabase(LoginDTO existingUser) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=this.getConnection();
			pstmt = con.prepareStatement("select * from institutesprojdb.users where UserName=? and Password=?");
			pstmt.setString(1, existingUser.getUsername());
			pstmt.setString(2, existingUser.getPassword());
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		} finally{
			if(pstmt!=null){
				pstmt.close();
			}
			if(con!=null){
				con.close();
			}
		}
		
	}
}

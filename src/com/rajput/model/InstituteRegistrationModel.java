package com.rajput.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rajput.dtos.InstituteDTO;

public class InstituteRegistrationModel {
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
	public boolean registerInstituteIntoDatabase(InstituteDTO newInsti) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement("select * from institutesprojdb.institutes where InstituteName = ? and InstiCity = ? ");
			pstmt.setString(1, newInsti.getInstituteName());
			pstmt.setString(2, newInsti.getInstituteCity());
			rs = pstmt.executeQuery();
			if(rs.next()){
				return false;
			}
			else{
				pstmt2 = con.prepareStatement("insert into institutesprojdb.institutes values(?,?,?,?,?,?,?,?,?,?)");
				pstmt2.setString(1, newInsti.getInstituteName());
				pstmt2.setString(2, newInsti.getInstituteDescription());
				pstmt2.setString(3, newInsti.getInstituteWebsite());
				pstmt2.setString(4, newInsti.getInstituteAddress());
				pstmt2.setString(5, newInsti.getInstituteCity());
				pstmt2.setString(6, newInsti.getInstituteState());
				pstmt2.setString(7, newInsti.getInstitutePincode());
				pstmt2.setString(8, newInsti.getInstituteEmail());
				pstmt2.setString(9, newInsti.getInstituteContactNo());
				pstmt2.setString(10, newInsti.getInstituteImageURL());
				pstmt2.executeUpdate();
				return true;
			}
		} catch (SQLException e) {
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
		
	}
}

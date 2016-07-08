package com.rajput.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rajput.dtos.InstituteDTO;

public class CourseRegistrationModel {
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
	public boolean registerCourseIntoDatabase(InstituteDTO newCourse) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement("insert into institutesprojdb.courses values(?,?,?,?,?,?)");
			pstmt.setString(1, newCourse.getInstituteName());
			pstmt.setString(2, newCourse.getInstituteCourseTitle());
			pstmt.setString(3, newCourse.getCourseDescription());
			pstmt.setString(4, newCourse.getCourseDuration());
			pstmt.setString(5, newCourse.getCourseTimings());
			pstmt.setDouble(6, newCourse.getCourseFees());
			pstmt.executeUpdate();
			return true;
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

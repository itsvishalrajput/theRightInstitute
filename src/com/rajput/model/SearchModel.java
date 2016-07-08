package com.rajput.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.rajput.dtos.InstituteDTO;

public class SearchModel {
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
	public ArrayList<InstituteDTO> searchFromDatabase(InstituteDTO searchDetails) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// preparing query
		String query = "SELECT * FROM institutesprojdb.institutes "
				+ "INNER JOIN institutesprojdb.courses "
				+ "ON institutes.InstituteName=courses.InstituteName WHERE (";
			//	+ "institutes.InstituteName =? and CourseTitle = ? and InstiCity = ?";
		if(searchDetails.getInstituteName()!=null){
			query += "institutes.InstituteName LIKE '"+searchDetails.getInstituteName()+"%' AND ";
		}
		if(searchDetails.getInstituteCourseTitle()!=null){
			query += "CourseTitle LIKE '"+searchDetails.getInstituteCourseTitle()+"%' AND ";
		}
		if(searchDetails.getInstituteCity()!=null){
			query += "InstiCity LIKE '"+searchDetails.getInstituteCity()+"%' AND ";
		}
		query += "1=1)";
		
		ArrayList<InstituteDTO> institutesList = new ArrayList<>();
		try {
			con=this.getConnection();
			pstmt = con.prepareStatement(query);
			/*if(searchDetails.getInstituteName()!=null){
			pstmt.setString(1,searchDetails.getInstituteName());
			}
			if(searchDetails.getInstituteCourseTitle()!=null){
			pstmt.setString(2,searchDetails.getInstituteCourseTitle());
			}
			if(searchDetails.getInstituteCity()!=null){
			pstmt.setString(3,searchDetails.getInstituteCity());
			}*/
			System.out.println("Query to DB- "+query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				InstituteDTO srchdto = new InstituteDTO();
				srchdto.setInstituteName(rs.getString("InstituteName"));
				srchdto.setInstituteDescription(rs.getString("InstiDescription"));
				srchdto.setInstituteWebsite(rs.getString("InstiWebsite"));
				srchdto.setInstituteAddress(rs.getString("InstiAddress"));
				srchdto.setInstituteCity(rs.getString("InstiCity"));
				srchdto.setInstituteState(rs.getString("InstiState"));
				srchdto.setInstitutePincode(rs.getString("InstiPincode"));
				srchdto.setInstituteEmail(rs.getString("InstiEmail"));
				srchdto.setInstituteContactNo(rs.getString("InstiContactNo"));
				srchdto.setInstituteImageURL(rs.getString("InstiImageURL"));
				srchdto.setInstituteCourseTitle(rs.getString("CourseTitle"));
				srchdto.setCourseDescription(rs.getString("Description"));
				srchdto.setCourseDuration(rs.getString("Duration"));
				srchdto.setCourseTimings(rs.getString("Timings"));
				srchdto.setCourseFees(rs.getDouble("Fees"));
				institutesList.add(srchdto);
				System.out.println("List of results is created.");
			}
		} finally{
			if(pstmt!=null){
				pstmt.close();
			}
			if(con!=null){
				con.close();
			}
		}
		return institutesList;
	}
}

package com.rajput.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.rajput.dtos.InstituteDTO;
import com.rajput.model.SearchModel;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(request.getSession().getAttribute("user-name")==null){
			response.sendRedirect("Login.jsp");
		}else{
			
			String searchByInstitute = request.getParameter("searchInstitute");
			String searchByCourse = request.getParameter("searchCourse");
			String searchByLocation = request.getParameter("searchLocation");
			
			if(searchByInstitute.isEmpty() && searchByCourse.isEmpty() && searchByLocation.isEmpty()){
				response.sendRedirect("search.jsp");
			}
			else{
				InstituteDTO getInstitute = new InstituteDTO();
				if(searchByLocation.length()>0 && searchByCourse.isEmpty() && searchByInstitute.isEmpty()){
					getInstitute.setInstituteCity(searchByLocation);
				}
				else if(searchByCourse.length()>0 && searchByLocation.isEmpty() && searchByInstitute.isEmpty()){
					getInstitute.setInstituteCourseTitle(searchByCourse);
				}
				else if(searchByInstitute.length()>0 && searchByCourse.isEmpty() && searchByLocation.isEmpty()){
					getInstitute.setInstituteName(searchByInstitute);
				}
				else if(searchByLocation.length()>0 && searchByInstitute.isEmpty() && searchByCourse.length()>0){
					getInstitute.setInstituteCourseTitle(searchByCourse);
					getInstitute.setInstituteCity(searchByLocation);
				}
				else if(searchByLocation.length()>0 && searchByCourse.isEmpty() && searchByInstitute.length()>0){
					getInstitute.setInstituteName(searchByInstitute);
					getInstitute.setInstituteCity(searchByLocation);
				}else if(searchByCourse.length()>0 && searchByLocation.isEmpty() && searchByInstitute.length()>0){
					getInstitute.setInstituteName(searchByInstitute);
					getInstitute.setInstituteCourseTitle(searchByCourse);
				}
				else{
					getInstitute.setInstituteName(searchByInstitute);
					getInstitute.setInstituteCourseTitle(searchByCourse);
					getInstitute.setInstituteCity(searchByLocation);
				}
				
				SearchModel srchModel = new SearchModel();
				ArrayList<InstituteDTO> institutesList = new ArrayList<>();
				try {
					institutesList = srchModel.searchFromDatabase(getInstitute);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				session.setAttribute("institutesList", institutesList);
				RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
				rd.forward(request, response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

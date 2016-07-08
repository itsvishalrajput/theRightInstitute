package com.rajput.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rajput.dtos.InstituteDTO;
import com.rajput.model.InstituteRegistrationModel;

@WebServlet("/registerInstitute")
public class InstituteRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user-name")==null){
			response.sendRedirect("Login.jsp");
		}else{
			String instituteName = request.getParameter("instituteName");
			String instituteDescription = request.getParameter("instituteDescription");
			String instituteAddress = request.getParameter("instituteAddress");
			String instituteCity = request.getParameter("instituteCity");
			String instituteState = request.getParameter("instituteState");
			String institutePincode = request.getParameter("institutePincode");
			String instituteWebsite = request.getParameter("instituteWebsite");
			String instituteEmail = request.getParameter("instituteEmail");
			String instituteContactNo = request.getParameter("instituteContactNo");
			String instituteImageURL = request.getParameter("instituteImageURL");
			
			InstituteDTO instiObj = new InstituteDTO();
			instiObj.setInstituteName(instituteName);
			instiObj.setInstituteDescription(instituteDescription);
			instiObj.setInstituteAddress(instituteAddress);
			instiObj.setInstituteCity(instituteCity);
			instiObj.setInstituteState(instituteState);
			instiObj.setInstitutePincode(institutePincode);
			instiObj.setInstituteWebsite(instituteWebsite);
			instiObj.setInstituteEmail(instituteEmail);
			instiObj.setInstituteContactNo(instituteContactNo);
			instiObj.setInstituteImageURL(instituteImageURL);
			
			System.out.println("Institute Inputs Taken.");
			
			InstituteRegistrationModel regInsti = new InstituteRegistrationModel();
			try {
				if(regInsti.registerInstituteIntoDatabase(instiObj)){
					System.out.println("Institute Now Registered.Redirecting to Course Registration.");
					//response.sendRedirect("register_course.jsp");
				}
				else{
					System.out.println("Institute Already Registered.Redirecting to Course Registration.");
					//response.sendRedirect("register_course.jsp");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("instituteName", instituteName);
			RequestDispatcher rd = request.getRequestDispatcher("register_course.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

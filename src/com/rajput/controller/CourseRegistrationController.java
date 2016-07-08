package com.rajput.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rajput.dtos.InstituteDTO;
import com.rajput.model.CourseRegistrationModel;

@WebServlet("/registerCourse")
public class CourseRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user-name")==null){
			response.sendRedirect("Login.jsp");
		}
		else{
			String instituteName = request.getParameter("instiName");
			String courseName = request.getParameter("courseName");
			String courseDescription = request.getParameter("courseDescription");
			String courseDuration = request.getParameter("courseDuration");
			String courseTimings = request.getParameter("courseTimings");
			Double courseFees = Double.parseDouble(request.getParameter("courseFees"));
			
			InstituteDTO courseObj = new InstituteDTO();
			courseObj.setInstituteName(instituteName);
			courseObj.setInstituteCourseTitle(courseName);
			courseObj.setCourseDescription(courseDescription);
			courseObj.setCourseDuration(courseDuration);
			courseObj.setCourseTimings(courseTimings);
			courseObj.setCourseFees(courseFees);
			
			System.out.println("Course inputs taken");
			
			CourseRegistrationModel regCourse = new CourseRegistrationModel();
			try {
				if(regCourse.registerCourseIntoDatabase(courseObj)){
					System.out.println("Course Registered.Redirecting to home page.");
					response.sendRedirect("success.jsp");
				}
				else{
					System.out.println("Some Error Occured.Redirecting to error occurred.");
					response.sendRedirect("error.jsp");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

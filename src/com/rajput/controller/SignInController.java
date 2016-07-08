package com.rajput.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rajput.dtos.SignInDTO;
import com.rajput.model.SignInModel;


@WebServlet("/sign-in")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String FullName = request.getParameter("fullname");
		String UserName = request.getParameter("username");
		String Password = request.getParameter("pswrd");
		String RePassword = request.getParameter("pswrdAgain");
		String Email = request.getParameter("email");
		String ContactNo = request.getParameter("contactNo");	
		SignInDTO newUser = new SignInDTO();
		newUser.setFullName(FullName);
		newUser.setUsername(UserName);
		newUser.setPassword(Password);
		newUser.setPasswordAgain(RePassword);
		newUser.setEmail(Email);
		newUser.setContactNo(ContactNo);
		System.out.println("Register credentials taken.");
		SignInModel smodel = new SignInModel();
		try {
			if(smodel.insertIntoDatabase(newUser)){
				response.sendRedirect("Login.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

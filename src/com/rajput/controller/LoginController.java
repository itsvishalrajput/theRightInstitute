package com.rajput.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rajput.dtos.LoginDTO;
import com.rajput.model.LoginModel;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("pswd");
		LoginDTO existingUser = new LoginDTO();
		existingUser.setUsername(username);
		existingUser.setPassword(password);
		System.out.println("user credentials taken.");
		LoginModel lmodel = new LoginModel();
		try {
			if(lmodel.checkFromDatabase(existingUser)){
				HttpSession session = request.getSession();  
		        session.setAttribute("user-name",existingUser.getUsername());
		        session.setMaxInactiveInterval(30*60);
		        System.out.println("Session created- "+session.getAttribute("user-name"));
		        
		        /*Cookie username = new Cookie("Username",UserName);
		        username.setMaxAge(30*60);
		        response.addCookie(username);*/
				response.sendRedirect("search.jsp");
				System.out.println("User logged in successfully.");
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
	}

}

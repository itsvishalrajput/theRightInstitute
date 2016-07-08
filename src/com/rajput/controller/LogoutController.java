package com.rajput.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("JSESSIONID")){
	    			System.out.println("JSESSIONID="+cookie.getValue());
	    			break;
	    		}
			}
		}
		
		HttpSession session = request.getSession(false);
		if(session != null){
			response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "-1");
			//session.removeAttribute("institutesList");
			session.invalidate();
			System.out.println("session invalidated");
			System.out.println(session);
		}
		response.sendRedirect("index.jsp");
		
	}
}

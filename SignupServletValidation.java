package com.connection.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

import com.connection.ConnectionProvider;
@WebServlet("/signupAction")
public class SignupServletValidation extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String uname = req.getParameter("uname");
		String pwd = req.getParameter("pwd");
		try {
			Connection con = ConnectionProvider.getConn();
		PreparedStatement pst = con.prepareStatement("insert into signup(first_name,last_name,email,username,password) values(?,?,?,?,?)");
        pst.setString(1,fname);
        pst.setString(2,lname);
        pst.setString(3,email);
        pst.setString(4,uname);
        pst.setString(5,pwd);
        pst.executeUpdate();
        res.sendRedirect("signup.jsp?msg=valid");
		
			
		}
		catch(Exception e) {
			e.printStackTrace();
			res.sendRedirect("error.jsp");
		}
}
}

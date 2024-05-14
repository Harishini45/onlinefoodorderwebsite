package com.connection.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

import com.connection.ConnectionProvider;

@WebServlet("/loginAction")
public class LoginServletValidation extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        
        try {
            Connection con = ConnectionProvider.getConn();
            PreparedStatement pst = con.prepareStatement("SELECT email FROM signup WHERE email = ? AND password = ?");
            pst.setString(1, email);
            pst.setString(2, pwd);
            
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                // User is authenticated, create or get the session object
                HttpSession session = req.getSession(true);
                
                // Store the email attribute in the session
                session.setAttribute("email", email);
                
                // Insert into login table if necessary
                PreparedStatement pst2 = con.prepareStatement("INSERT INTO login (email, password) VALUES (?, ?)");
                pst2.setString(1, email);
                pst2.setString(2, pwd);
                pst2.executeUpdate();
                
                // Redirect to the fooditemshow.jsp page with email parameter
                res.sendRedirect("fooditemshow.jsp?email=" + email);
            } else if ("admin123@gmail.com".equals(email) && "admin123".equals(pwd)) {
                // Admin login
                HttpSession session = req.getSession(true);
                session.setAttribute("email", "admin123@gmail.com");
                res.sendRedirect("Upload.jsp");
            } else {
                // Invalid credentials, redirect back to the login page with a message
                res.sendRedirect("login.jsp?msg=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }
    }
}

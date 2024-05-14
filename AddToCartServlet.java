package com.connection.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

import com.connection.ConnectionProvider;

@WebServlet("/cartAction")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        int id = Integer.parseInt(req.getParameter("id"));
        int quan = 1;
        try {
            Connection con = ConnectionProvider.getConn();
            PreparedStatement pst = con.prepareStatement("SELECT quantity FROM cart WHERE email = ? AND id = ?");
            pst.setString(1, email);
            pst.setInt(2, id);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                quan = rs.getInt(1);
                quan += 1;
                PreparedStatement pst2 = con.prepareStatement("UPDATE cart SET quantity = ? WHERE email = ? AND id = ?");
                pst2.setInt(1, quan);
                pst2.setString(2, email);
                pst2.setInt(3, id);
                pst2.executeUpdate();
                res.sendRedirect("fooditemshow.jsp?msg=added");
            } else {
                PreparedStatement pst3 = con.prepareStatement("INSERT INTO cart (id, email, quantity) VALUES (?, ?, ?)");
                pst3.setInt(1, id);
                pst3.setString(2, email);
                pst3.setInt(3, quan);
                pst3.executeUpdate();
                res.sendRedirect("fooditemshow.jsp?msg=added");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }
}
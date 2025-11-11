package com.bookstore.servlet;

import com.bookstore.dao.UserDAO;
import com.bookstore.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            System.out.println("Registration attempt - Name: " + name + ", Email: " + email);

            // Validation
            if (name == null || name.trim().isEmpty() || 
                email == null || email.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                
                response.sendRedirect("register.jsp?error=Please fill all fields");
                return;
            }

            // ✅ Check if email already exists
            UserDAO dao = new UserDAO();
            if (dao.isEmailExists(email)) {
                response.sendRedirect("register.jsp?error=Email already exists! Please use a different email.");
                return;
            }

            User u = new User();
            u.setName(name);
            u.setEmail(email);
            u.setPassword(password);
            u.setRole(role != null ? role : "customer");

            boolean success = dao.registerUser(u);

            if (success) {
                System.out.println("User registered successfully: " + email);
                response.sendRedirect("login.jsp?success=Registration successful! Please login.");
            } else {
                System.out.println("User registration failed: " + email);
                response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Server error: " + e.getMessage());
        }
    }
}
package com.bookstore.dao;

import com.bookstore.model.User;
import java.sql.*;

public class UserDAO {
    
    // ✅ ADD THIS METHOD - User Registration
    public boolean registerUser(User user) {
        boolean success = false;
        String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
        
        System.out.println("📝 Registering user: " + user.getEmail());
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword()); // In real app, hash this!
            ps.setString(4, user.getRole());
            
            int rowsAffected = ps.executeUpdate();
            success = (rowsAffected > 0);
            
            System.out.println("✅ User registration " + (success ? "successful" : "failed"));
            
        } catch (SQLException e) {
            System.err.println("❌ Database error during registration: " + e.getMessage());
            e.printStackTrace();
        }
        return success;
    }
    
    // ✅ ADD THIS METHOD - User Login
    public User loginUser(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        
        System.out.println("🔐 Attempting login for: " + email);
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    System.out.println("✅ Login successful for: " + user.getName());
                } else {
                    System.out.println("❌ Invalid credentials for: " + email);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Database error during login: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }
    
    // ✅ Check if email already exists
    public boolean isEmailExists(String email) {
        String sql = "SELECT id FROM users WHERE email = ?";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // Returns true if email exists
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
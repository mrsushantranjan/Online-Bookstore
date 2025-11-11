package com.bookstore.dao;

import com.bookstore.model.Book;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT id, title, author, price, category, image, quantity, description FROM books";

        try (Connection conn = DBconnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setCategory(rs.getString("category"));
                book.setImage(rs.getString("image"));
                book.setQuantity(rs.getInt("quantity"));
                book.setDescription(rs.getString("description"));
                list.add(book);
            }

        } catch (SQLException e) {
            System.err.println("❌ Error fetching books: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
}

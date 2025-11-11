package com.bookstore.servlet;

import com.bookstore.model.Book;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/remove-from-cart")
public class RemovefromCartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Book> cart = (List<Book>) session.getAttribute("cart");

        if (cart != null) {
            try {
                int bookId = Integer.parseInt(request.getParameter("id"));
                boolean removed = false;

                // Remove only one occurrence of the book
                for (int i = 0; i < cart.size(); i++) {
                    if (cart.get(i).getId() == bookId) {
                        cart.remove(i);
                        removed = true;
                        break; // stop after removing one
                    }
                }

                if (!removed) {
                    System.err.println("⚠️ Book not found in cart with ID: " + bookId);
                } else {
                    System.out.println("✅ Book removed from cart (ID: " + bookId + ")");
                }

            } catch (NumberFormatException e) {
                System.err.println("❌ Invalid book ID for removal: " + e.getMessage());
            }
        }

        // Update cart in session and redirect
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

package com.bookstore.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        try {
            if ("remove".equals(action)) {
                int bookId = Integer.parseInt(request.getParameter("id"));
                cart.removeIf(item -> (Integer) item.get("bookId") == bookId);
            } else if ("clear".equals(action)) {
                cart.clear();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}

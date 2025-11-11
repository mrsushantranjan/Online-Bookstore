package com.bookstore.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String title = request.getParameter("title");
            double price = Double.parseDouble(request.getParameter("price"));

            boolean exists = false;
            for (Map<String, Object> item : cart) {
                if (bookId == (Integer) item.get("bookId")) {
                    exists = true;
                    break;
                }
            }

            if (!exists) {
                Map<String, Object> item = new HashMap<>();
                item.put("bookId", bookId);
                item.put("title", title);
                item.put("price", price);
                cart.add(item);
            }

            session.setAttribute("cart", cart);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("books");
    }
}

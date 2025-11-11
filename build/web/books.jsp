<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookVerse Digital Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f8f9fa;
            color: #2e0d30;
        }

        header {
            background-color: #4b3ca7;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        header h1 {
            font-size: 1.8em;
            letter-spacing: 1px;
        }

        nav a {
            text-decoration: none;
            color: #fff;
            font-weight: 600;
            margin-left: 1.5em;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ffd84a;
        }

        .cart-info {
            background: #fff;
            border-radius: 10px;
            padding: 15px;
            margin: 20px auto;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            max-width: 320px;
        }

        .container {
            width: 90%;
            margin: 2em auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2em;
        }

        .book-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: 0.3s;
            padding: 20px;
            text-align: center;
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        .book-image img {
            width: 120px;
            height: 160px;
            border-radius: 8px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .book-info h3 {
            color: #2e0d30;
            margin-bottom: 0.5em;
            font-size: 1.2em;
        }

        .book-info p {
            color: #555;
            font-size: 0.95em;
            margin-bottom: 0.5em;
        }

        .book-category {
            display: inline-block;
            background: #ffd84a;
            color: #2e0d30;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 0.8em;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .price {
            color: #4b3ca7;
            font-weight: bold;
            font-size: 1.3em;
            margin: 10px 0;
        }

        .btn {
            background-color: #4b3ca7;
            color: #fff;
            padding: 0.7em 1.5em;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s, transform 0.3s;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #372a85;
            transform: scale(1.05);
        }

        footer {
            text-align: center;
            padding: 1.5em;
            background: #2e0d30;
            color: #fff;
            margin-top: 3em;
            font-size: 0.9em;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            background: white;
            border-radius: 10px;
            grid-column: 1 / -1;
        }
    </style>
</head>

<body>
    <header>
        <h1>📖 BookVerse Digital Library</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="books">Books</a>
            <a href="cart.jsp">Cart</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </header>

    <!-- Cart Info -->
    <div class="cart-info">
        <%
            HttpSession userSession = request.getSession();
            java.util.List cart = (java.util.List) userSession.getAttribute("cart");
            int cartCount = (cart != null) ? cart.size() : 0;
        %>
        <h3>🛒 Your Cart: <%= cartCount %> items</h3>
        <a href="cart.jsp" class="btn" style="display: inline-block; margin-top: 10px;">View Cart</a>
    </div>

    <!-- Books Display -->
    <div class="container">
        <%
            java.util.List dbBooks = (java.util.List) request.getAttribute("books");
            if (dbBooks != null && !dbBooks.isEmpty()) {
        %>
            <c:forEach var="book" items="${books}">
                <div class="book-card">
                    <div class="book-image">
                        <img src="images/${book.image}" alt="${book.title}">
                    </div>
                    <div class="book-info">
                        <h3>${book.title}</h3>
                        <p>by ${book.author}</p>
                        <span class="book-category">${book.category}</span>
                        <p>${book.description}</p>
                        <p><strong>Available:</strong> ${book.quantity}</p>
                        <div class="price">₹${book.price}</div>
                        <form action="add-to-cart" method="post">
                            <input type="hidden" name="bookId" value="${book.id}">
                            <input type="hidden" name="title" value="${book.title}">
                            <input type="hidden" name="price" value="${book.price}">
                            <button class="btn" type="submit">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        <%
            } else {
        %>
            <div class="empty-state">
                <h2>No books available right now 📚</h2>
                <p>Please check back later.</p>
            </div>
        <%
            }
        %>
    </div>

    <footer>
        &copy; 2025 BookVerse Digital Library | Read. Learn. Grow.
    </footer>
</body>
</html>
    
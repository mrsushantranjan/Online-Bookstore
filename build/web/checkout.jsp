<%-- 
    Document   : checkout
    Created on : Oct 21, 2025, 1:47:36 PM
    Author     : sushantpathak
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - Online Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f4f4f4;
        }

        header {
            background-color: #f4c531;
            color: #2e0d30;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        header h1 {
            font-size: 1.8em;
        }

        nav a {
            text-decoration: none;
            color: #2e0d30;
            font-weight: 600;
            margin-left: 1.5em;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #fff;
        }

        .checkout-container {
            width: 90%;
            max-width: 900px;
            margin: 2em auto;
            background: #fff;
            border-radius: 10px;
            padding: 2em;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #2e0d30;
            margin-bottom: 1em;
            border-bottom: 3px solid #f4c531;
            display: inline-block;
            padding-bottom: 0.2em;
        }

        .section {
            margin-bottom: 2em;
        }

        .section label {
            display: block;
            font-weight: 600;
            margin-bottom: 0.5em;
            color: #3f3554;
        }

        .section input, .section textarea, .section select {
            width: 100%;
            padding: 0.8em;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            font-size: 1em;
            margin-bottom: 1em;
        }

        .section input:focus, .section textarea:focus {
            border-color: #f4c531;
        }

        .order-summary {
            background: #fafafa;
            border-radius: 10px;
            padding: 1em;
            margin-bottom: 2em;
        }

        .order-summary table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-summary th, .order-summary td {
            padding: 0.8em;
            text-align: left;
        }

        .order-summary th {
            background: #f4c531;
            color: #2e0d30;
            text-transform: uppercase;
        }

        .total {
            text-align: right;
            margin-top: 1em;
            font-size: 1.2em;
            font-weight: 700;
            color: #2e0d30;
        }

        .btn-submit {
            display: inline-block;
            background-color: #2e0d30;
            color: #fff;
            padding: 0.8em 2em;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background-color: #4b1761;
        }

        footer {
            text-align: center;
            padding: 1.5em;
            background: #2e0d30;
            color: #fff;
            margin-top: 3em;
        }
    </style>
</head>
<body>
    <header>
        <h1>Checkout</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="books">Books</a>
            <a href="cart.jsp">Cart</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </header>

    <div class="checkout-container">
        <form action="PlaceOrderServlet" method="post">
            <!-- Order Summary Section -->
            <div class="section">
                <h2>Order Summary</h2>
                <div class="order-summary">
                    <c:if test="${not empty cartList}">
                        <table>
                            <tr>
                                <th>Book</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                            <c:forEach var="item" items="${cartList}">
                                <tr>
                                    <td>${item.book.title}</td>
                                    <td>${item.quantity}</td>
                                    <td>₹${item.book.price}</td>
                                    <td>₹${item.book.price * item.quantity}</td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="total">
                            Grand Total: ₹${totalAmount}
                        </div>
                    </c:if>

                    <c:if test="${empty cartList}">
                        <p>Your cart is empty. <a href="books.jsp">Add books</a> before checkout.</p>
                    </c:if>
                </div>
            </div>

            <!-- Shipping Details -->
            <div class="section">
                <h2>Shipping Address</h2>
                <label>Full Name</label>
                <input type="text" name="fullname" placeholder="Enter your full name" required>

                <label>Address</label>
                <textarea name="address" rows="3" placeholder="Enter your delivery address" required></textarea>

                <label>City</label>
                <input type="text" name="city" required>

                <label>State</label>
                <input type="text" name="state" required>

                <label>ZIP Code</label>
                <input type="text" name="zip" required>
            </div>

            <!-- Payment Section -->
            <div class="section">
                <h2>Payment Method</h2>
                <select name="paymentMethod" required>
                    <option value="">-- Select Payment Method --</option>
                    <option value="COD">Cash on Delivery</option>
                    <option value="CARD">Credit/Debit Card</option>
                    <option value="UPI">UPI</option>
                </select>
            </div>

            <div style="text-align: center;">
                <button type="submit" class="btn-submit">Place Order</button>
            </div>
        </form>
    </div>

    <footer>
        &copy; 2025 Online Book Store | Designed by PATHAK
    </footer>
</body>
</html>
           
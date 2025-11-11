<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Digital Book</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: white;
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .header p {
            color: #e0e0e0;
            font-size: 1.1rem;
        }

        .cart-container {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            backdrop-filter: blur(10px);
        }

        .empty-cart {
            text-align: center;
            padding: 60px 20px;
        }

        .empty-cart i {
            font-size: 4rem;
            color: #ccc;
            margin-bottom: 20px;
        }

        .empty-cart h3 {
            color: #666;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }

        .empty-cart p {
            color: #888;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #f093fb, #f5576c);
        }

        .cart-items {
            margin-bottom: 30px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #eee;
            transition: all 0.3s ease;
        }

        .cart-item:hover {
            background: #f8f9fa;
            border-radius: 10px;
        }

        .item-info {
            flex: 1;
        }

        .item-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .item-price {
            font-size: 1.1rem;
            color: #667eea;
            font-weight: 500;
        }

        .remove-btn {
            background: #ff4757;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .remove-btn:hover {
            background: #ff3742;
            transform: scale(1.05);
        }

        .cart-summary {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            padding: 25px;
            border-radius: 15px;
            text-align: center;
        }

        .total-amount {
            font-size: 1.8rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }

        .total-label {
            color: #666;
            font-size: 1.1rem;
            margin-right: 10px;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .continue-shopping {
            text-align: center;
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #eee;
        }

        .continue-shopping a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .continue-shopping a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .item-count {
            background: #667eea;
            color: white;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
            margin-left: 10px;
        }

        @media (max-width: 768px) {
            .cart-item {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-shopping-cart"></i> Your Shopping Cart</h1>
            <p>Review your selected books and proceed to checkout</p>
        </div>

        <div class="cart-container">
            <%
            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
            %>
                <div class="empty-cart">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>Your cart is empty</h3>
                    <p>Looks like you haven't added any books to your cart yet.</p>
                    <a href="books" class="btn">
                        <i class="fas fa-book"></i> Browse Books
                    </a>
                </div>
            <%
            } else {
                double total = 0;
                int itemCount = cart.size();
            %>
                <div class="cart-header" style="margin-bottom: 20px;">
                    <h3 style="color: #333;">
                        <i class="fas fa-list"></i> Cart Items 
                        <span class="item-count"><%= itemCount %></span>
                    </h3>
                </div>

                <div class="cart-items">
                    <%
                    for (Map<String, Object> item : cart) {
                        double price = (Double) item.get("price");
                        total += price;
                    %>
                        <div class="cart-item">
                            <div class="item-info">
                                <div class="item-title">
                                    <i class="fas fa-book" style="color: #667eea; margin-right: 10px;"></i>
                                    <%= item.get("title") %>
                                </div>
                                <div class="item-price">
                                    <i class="fas fa-tag" style="margin-right: 8px;"></i>
                                    ?<%= String.format("%.2f", price) %>
                                </div>
                            </div>
                            <button class="remove-btn" onclick="removeItem(<%= item.get("bookId") %>)">
                                <i class="fas fa-trash"></i> Remove
                            </button>
                        </div>
                    <%
                    }
                    %>
                </div>

                <div class="cart-summary">
                    <div class="total-amount">
                        <span class="total-label">Total Amount:</span>
                        ?<%= String.format("%.2f", total) %>
                    </div>
                    
                    <div class="action-buttons">
                        <a href="success.jsp" class="btn">
                            <i class="fas fa-credit-card"></i> Proceed to Checkout
                        </a>
                        <a href="books" class="btn btn-secondary">
                            <i class="fas fa-plus"></i> Continue Shopping
                        </a>
                        <button class="btn" style="background: linear-gradient(135deg, #ff6b6b, #ee5a52);" 
                                onclick="clearCart()">
                            <i class="fas fa-broom"></i> Clear Cart
                        </button>
                    </div>
                </div>

                <div class="continue-shopping">
                    <a href="index.jsp">
                        <i class="fas fa-home"></i> Back to Home
                    </a>
                </div>
            <%
            }
            %>
        </div>
    </div>

    <script>
        function removeItem(bookId) {
            if (confirm('Are you sure you want to remove this item from your cart?')) {
                window.location.href = 'cart?action=remove&id=' + bookId;
            }
        }

        function clearCart() {
            if (confirm('Are you sure you want to clear your entire cart?')) {
                window.location.href = 'cart?action=clear';
            }
        }

        // Add some animations
        document.addEventListener('DOMContentLoaded', function() {
            const cartItems = document.querySelectorAll('.cart-item');
            cartItems.forEach((item, index) => {
                item.style.animation = `fadeInUp 0.5s ease ${index * 0.1}s both`;
            });
        });

        // Add CSS animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
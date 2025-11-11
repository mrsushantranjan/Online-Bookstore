<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookVault – Your Literary Sanctuary</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c5530;
            --secondary: #4a7c59;
            --accent: #8fb996;
            --gold: #d4af37;
            --dark: #1a1f2b;
            --light: #f8f9fa;
            --success: #27ae60;
            --text: #2d3748;
            --cream: #fef7e5;
        }

        * {
            margin: 0; 
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            color: var(--text);
        }

        .main-container {
            background: white;
            min-height: 100vh;
            box-shadow: 0 0 50px rgba(0,0,0,0.1);
        }

        /* Header Styles */
        header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1.5em 0;
            position: relative;
            overflow: hidden;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 2em;
            font-weight: 700;
        }

        .logo-icon {
            background: var(--gold);
            color: var(--dark);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* User Info */
        .user-info {
            background: rgba(255,255,255,0.15);
            padding: 1em 2em;
            margin: 0 2em;
            border-radius: 20px;
            text-align: center;
            animation: slideDown 0.6s ease;
            border: 1px solid rgba(255,255,255,0.2);
        }

        @keyframes slideDown {
            from { transform: translateY(-30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .user-info .welcome {
            color: var(--gold);
            font-weight: 600;
            font-size: 1.1em;
            margin-right: 10px;
        }

        .user-info a {
            color: white;
            text-decoration: none;
            margin: 0 8px;
            padding: 6px 12px;
            border-radius: 15px;
            transition: all 0.3s ease;
            font-size: 0.9em;
        }

        .user-info a:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-2px);
        }

        /* Navigation */
        nav {
            background: rgba(255,255,255,0.95);
            padding: 1em 0;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            gap: 1em;
            padding: 0 2em;
            flex-wrap: wrap;
        }

        nav a {
            color: var(--dark);
            text-decoration: none;
            font-weight: 500;
            padding: 0.7em 1.5em;
            border-radius: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        nav a:hover {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        nav a i {
            margin-right: 8px;
        }

        /* Cart Badge */
        .cart-badge {
            background: #e74c3c;
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-left: 5px;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, rgba(44, 85, 48, 0.9) 0%, rgba(74, 124, 89, 0.9) 100%), 
                        url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570') center/cover;
            height: 80vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
        }

        .hero-content {
            max-width: 800px;
            padding: 2em;
            animation: fadeInUp 1s ease;
        }

        @keyframes fadeInUp {
            from { 
                opacity: 0; 
                transform: translateY(40px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .hero h2 {
            font-size: 3.5em;
            margin-bottom: 0.5em;
            font-weight: 700;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.3em;
            margin-bottom: 2em;
            opacity: 0.9;
            line-height: 1.6;
        }

        .cta-button {
            background: linear-gradient(135deg, var(--gold) 0%, #ffd700 100%);
            color: var(--dark);
            padding: 1.2em 3em;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(212, 175, 55, 0.4);
            display: inline-flex;
            align-items: center;
            gap: 12px;
        }

        .cta-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(212, 175, 55, 0.6);
        }

        /* Messages */
        .message {
            padding: 1.2em 2em;
            margin: 1.5em auto;
            max-width: 800px;
            border-radius: 15px;
            text-align: center;
            font-weight: 500;
            animation: slideIn 0.5s ease;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        @keyframes slideIn {
            from { transform: translateX(-100px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .success {
            background: linear-gradient(135deg, var(--success) 0%, #2ecc71 100%);
            color: white;
        }

        .error {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
        }

        /* Books Section */
        .section {
            padding: 5em 2em;
            text-align: center;
            background: var(--cream);
        }

        .section h2 {
            font-size: 2.8em;
            margin-bottom: 1em;
            color: var(--dark);
            position: relative;
            display: inline-block;
        }

        .section h2::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 5px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: 3px;
        }

        .books {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2.5em;
            max-width: 1200px;
            margin: 0 auto;
        }

        .book {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: all 0.4s ease;
            position: relative;
        }

        .book::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        }

        .book:hover {
            transform: translateY(-15px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .book-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .book:hover .book-image {
            transform: scale(1.1);
        }

        .book-content {
            padding: 1.5em;
        }

        .book h3 {
            font-size: 1.4em;
            margin-bottom: 0.5em;
            color: var(--dark);
            font-weight: 600;
        }

        .book-author {
            color: var(--text);
            font-size: 0.95em;
            margin-bottom: 1em;
            opacity: 0.8;
        }

        .book-price {
            font-size: 1.5em;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 1em;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .rupee-symbol {
            font-family: Arial, sans-serif;
            font-weight: bold;
        }

        .btn-add {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            border: none;
            padding: 1em 2em;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-add:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(44, 85, 48, 0.4);
        }

        .login-prompt {
            background: linear-gradient(135deg, #edf2f7 0%, #e2e8f0 100%);
            padding: 1.2em;
            border-radius: 15px;
            color: var(--text);
            font-size: 0.95em;
            text-align: center;
            border: 2px dashed #cbd5e0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        /* Features Section */
        .features {
            background: white;
            padding: 5em 2em;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2em;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature {
            text-align: center;
            padding: 2.5em 1.5em;
            border-radius: 20px;
            background: linear-gradient(135deg, #f7fafc 0%, #edf2f7 100%);
            transition: all 0.3s ease;
            position: relative;
        }

        .feature::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        }

        .feature:hover {
            transform: translateY(-10px);
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
        }

        .feature i {
            font-size: 3em;
            margin-bottom: 1em;
            color: var(--primary);
            transition: all 0.3s ease;
        }

        .feature:hover i {
            color: white;
        }

        .feature h3 {
            font-size: 1.4em;
            margin-bottom: 1em;
            font-weight: 600;
        }

        /* Shipping Info */
        .shipping-info {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1.5em;
            text-align: center;
            margin: 2em auto;
            max-width: 800px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(44, 85, 48, 0.3);
        }

        .shipping-info h3 {
            margin-bottom: 0.5em;
            font-size: 1.3em;
        }

        /* Footer */
        footer {
            background: linear-gradient(135deg, var(--dark) 0%, #2d3748 100%);
            color: white;
            padding: 4em 2em 2em;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3em;
            margin-bottom: 3em;
        }

        .footer-section h3 {
            margin-bottom: 1.5em;
            color: var(--gold);
            font-size: 1.3em;
        }

        .footer-section p {
            color: #cbd5e0;
            line-height: 1.6;
            margin-bottom: 1.5em;
        }

        .footer-section a {
            color: #cbd5e0;
            text-decoration: none;
            display: block;
            margin-bottom: 0.8em;
            transition: all 0.3s ease;
        }

        .footer-section a:hover {
            color: var(--gold);
        }

        .social-links {
            display: flex;
            gap: 1em;
            margin-top: 1.5em;
        }

        .social-links a {
            background: rgba(255,255,255,0.1);
            width: 45px;
            height: 45px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: var(--gold);
            color: var(--dark);
        }

        .copyright {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 2em;
            text-align: center;
            color: #a0aec0;
            font-size: 0.9em;
        }

        .india-flag {
            display: inline-block;
            margin: 0 5px;
            font-size: 1.2em;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1em;
                text-align: center;
            }

            .hero h2 {
                font-size: 2.5em;
            }

            .nav-container {
                gap: 0.5em;
            }

            nav a {
                padding: 0.6em 1em;
                font-size: 0.9em;
            }

            .books {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <header>
            <div class="header-content">
                <div class="logo">
                    <div class="logo-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <span>BookVault <span class="india-flag">🇮🇳</span></span>
                </div>
            </div>

            <!-- User Session Information -->
            <%
                User currentUser = (User) session.getAttribute("currentUser");
                String success = request.getParameter("success");
                String error = request.getParameter("error");
            %>
            
            <% if (currentUser != null) { %>
                <div class="user-info">
                    <span class="welcome">👋 Welcome, <%= currentUser.getName() %>!</span>
                    <span class="role">(<%= currentUser.getRole() %>)</span>
                    <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
                    <a href="orders.jsp"><i class="fas fa-shopping-bag"></i> Orders</a>
                </div>
            <% } %>
        </header>

        <nav>
            <div class="nav-container">
                <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
                <% if (currentUser == null) { %>
                    <a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="register.jsp"><i class="fas fa-user-plus"></i> Register</a>
                <% } %>
                <a href="books"><i class="fas fa-book"></i> Books</a>
                <a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a>
                <a href="cart.jsp">
                    <i class="fas fa-shopping-cart"></i> Cart
                    <span class="cart-badge" id="cartBadge">0</span>
                </a>
                <% if (currentUser != null && "admin".equals(currentUser.getRole())) { %>
                    <a href="admin.jsp"><i class="fas fa-cog"></i> Admin Panel</a>
                <% } %>
            </div>
        </nav>

        <!-- Display Messages -->
        <% if (success != null) { %>
            <div class="message success">
                <i class="fas fa-check-circle"></i> <%= success %>
            </div>
        <% } %>
        
        <% if (error != null) { %>
            <div class="message error">
                <i class="fas fa-exclamation-circle"></i> <%= error %>
            </div>
        <% } %>

        <section class="hero">
            <div class="hero-content">
                <h2>Discover Your Next Literary Adventure</h2>
                <p>Immerse yourself in a world of stories, knowledge, and imagination. Your perfect book awaits.</p>
                <a href="books" class="cta-button">
                    <i class="fas fa-search"></i> Explore Our Collection
                </a>
            </div>
        </section>

        <!-- Indian Shipping Info -->
        <div class="shipping-info">
            <h3>🇮🇳 Free Shipping Across India</h3>
            <p>Free delivery on all orders above ₹499 | Cash on Delivery Available</p>
        </div>

        <section class="section">
            <h2>Featured Masterpieces</h2>
            <div class="books">
                <%
                    String[][] books = {
                        {"Atomic Habits", "James Clear", "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c", "₹499"},
                        {"The Alchemist", "Paulo Coelho", "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c", "₹399"},
                        {"Think and Grow Rich", "Napoleon Hill", "https://images.unsplash.com/photo-1481627834876-b7833e8f5570", "₹349"},
                        {"The Psychology of Money", "Morgan Housel", "https://images.unsplash.com/photo-1553729459-efe14ef6055d", "₹599"},
                        {"Ikigai", "Héctor García", "https://images.unsplash.com/photo-1589998059171-988d887df646", "₹299"},
                        {"The Palace of Illusions", "Chitra Banerjee", "https://images.unsplash.com/photo-1543002588-bfa74002ed7e", "₹449"},
                        {"Wings of Fire", "APJ Abdul Kalam", "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c", "₹279"},
                        {"The God of Small Things", "Arundhati Roy", "https://images.unsplash.com/photo-1512820790803-83ca734da794", "₹529"}
                    };
                    for (String[] b : books) {
                %>
                    <div class="book">
                        <img src="<%= b[2] %>" alt="<%= b[0] %>" class="book-image">
                        <div class="book-content">
                            <h3><%= b[0] %></h3>
                            <p class="book-author">by <%= b[1] %></p>
                            <div class="book-price">
                                <span class="rupee-symbol">₹</span><%= b[3].substring(1) %>
                            </div>
                            <% if (currentUser != null) { %>
                                <button class="btn-add" data-book="<%= b[0] %>">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </button>
                            <% } else { %>
                                <div class="login-prompt">
                                    <i class="fas fa-lock"></i> Login to purchase
                                </div>
                            <% } %>
                        </div>
                    </div>
                <% } %>
            </div>
        </section>

        <section class="features">
            <div class="feature-grid">
                <div class="feature">
                    <i class="fas fa-shipping-fast"></i>
                    <h3>Free Shipping</h3>
                    <p>Free delivery on orders over ₹499</p>
                </div>
                <div class="feature">
                    <i class="fas fa-money-bill-wave"></i>
                    <h3>Cash on Delivery</h3>
                    <p>Pay when you receive your order</p>
                </div>
                <div class="feature">
                    <i class="fas fa-headset"></i>
                    <h3>24/7 Support</h3>
                    <p>Hindi & English customer support</p>
                </div>
                <div class="feature">
                    <i class="fas fa-undo-alt"></i>
                    <h3>Easy Returns</h3>
                    <p>10-day easy return policy</p>
                </div>
            </div>
        </section>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h3>BookVault <span class="india-flag">🇮🇳</span></h3>
                    <p>Your trusted Indian destination for discovering amazing books and building your personal literary collection.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-whatsapp"></i></a>
                    </div>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <a href="index.jsp">Home</a>
                    <a href="books.jsp">Browse Books</a>
                    <a href="indian-authors.jsp">Indian Authors</a>
                    <a href="contact.jsp">Contact</a>
                </div>
                <div class="footer-section">
                    <h3>Customer Service</h3>
                    <a href="help.jsp">Help Center</a>
                    <a href="shipping.jsp">Shipping Info</a>
                    <a href="returns.jsp">Returns & Exchange</a>
                    <a href="cod.jsp">Cash on Delivery</a>
                </div>
                <div class="footer-section">
                    <h3>Contact Info</h3>
                    <a href="tel:+911800123456"><i class="fas fa-phone"></i> 1800-123-456</a>
                    <a href="mailto:support@bookvault.in"><i class="fas fa-envelope"></i> support@bookvault.in</a>
                    <a href="#"><i class="fas fa-map-marker-alt"></i> Mumbai, India</a>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; <%= java.time.Year.now() %> BookVault India. All Rights Reserved.</p>
            </div>
        </footer>
    </div>

    <script>
        // Simple and working JavaScript
        document.addEventListener('DOMContentLoaded', function() {
            let cartCount = 0;
            const cartBadge = document.getElementById('cartBadge');
            
            // Add to cart functionality
            const addToCartButtons = document.querySelectorAll('.btn-add');
            addToCartButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const bookName = this.getAttribute('data-book');
                    
                    // Update cart count
                    cartCount++;
                    cartBadge.textContent = cartCount;
                    
                    // Button feedback
                    const originalHTML = this.innerHTML;
                    this.innerHTML = '<i class="fas fa-check"></i> Added!';
                    this.style.background = 'linear-gradient(135deg, var(--success) 0%, #2ecc71 100%)';
                    
                    setTimeout(() => {
                        this.innerHTML = originalHTML;
                        this.style.background = 'linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%)';
                    }, 2000);
                    
                    // Show simple notification
                    showNotification(`${bookName} added to cart!`);
                });
            });

            // Scroll animations
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, { threshold: 0.1 });

            // Observe elements for scroll animation
            document.querySelectorAll('.book, .feature').forEach(el => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(30px)';
                el.style.transition = 'all 0.6s ease';
                observer.observe(el);
            });

            // Simple notification function
            function showNotification(message) {
                // Create a simple alert-style notification
                alert('✅ ' + message);
            }

            console.log('BookVault frontend loaded successfully!');
        });
    </script>
</body>
</html>
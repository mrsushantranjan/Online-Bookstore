<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>WELCOME TO DIGITAL BOOK</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    * {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }
    body {
      background-color: #f4c531;
    }
    .container {
      height: 37.25em;
      width: 31.25em;
      position: absolute;
      transform: translate(-50%, -50%);
      top: 50%;
      left: 50%;
    }
    form {
      width: 23.75em;
      height: 24.75em;
      background-color: #ffffff;
      position: absolute;
      transform: translate(-50%, -50%);
      top: calc(50% + 3.1em);
      left: 50%;
      padding: 1.5em 3.1em;
      display: flex;
      flex-direction: column;
      justify-content: center;
      border-radius: 0.5em;
      box-shadow: 0 0.5em 1.5em rgba(0, 0, 0, 0.1);
    }
    form label {
      display: block;
      margin-bottom: 0.2em;
      font-weight: 600;
      color: #2e0d30;
      font-size: 0.9em;
    }
    form input, form select {
      font-size: 0.95em;
      font-weight: 400;
      color: #3f3554;
      padding: 0.6em;
      border: none;
      border-bottom: 0.12em solid #3f3554;
      outline: none;
      background-color: #fafafa;
      margin-bottom: 0.9em;
      border-radius: 0.3em;
      transition: all 0.3s ease;
    }
    form input:focus, form select:focus {
      border-color: #f4c531;
      background-color: #fffdf0;
      box-shadow: 0 0 0.3em rgba(244, 197, 49, 0.3);
    }
    form button {
      font-size: 0.95em;
      padding: 0.8em 0;
      border-radius: 2em;
      border: none;
      cursor: pointer;
      outline: none;
      background-color: #f4c531;
      color: #2e0d30;
      text-transform: uppercase;
      font-weight: 600;
      letter-spacing: 0.15em;
      margin-top: 1em;
      transition: 0.5s;
    }
    form button:hover {
      background-color: #e6b82e;
      transform: translateY(-2px);
      box-shadow: 0 0.3em 0.8em rgba(0, 0, 0, 0.2);
    }
    .form-title {
      text-align: center;
      color: #2e0d30;
      margin-bottom: 1em;
      font-size: 1.4em;
      font-weight: 600;
    }
    .panda-face {
      height: 7.5em;
      width: 8.4em;
      background-color: #ffffff;
      border: 0.18em solid #2e0d30;
      border-radius: 7.5em 7.5em 5.62em 5.62em;
      position: absolute;
      top: 2em;
      margin: auto;
      left: 0;
      right: 0;
      z-index: 2;
    }
    .ear-l, .ear-r {
      background-color: #3f3554;
      height: 2.5em;
      width: 2.81em;
      border: 0.18em solid #2e0d30;
      border-radius: 2.5em 2.5em 0 0;
      top: 1.75em;
      position: absolute;
      z-index: 1;
    }
    .ear-l { transform: rotate(-38deg); left: 10.75em; }
    .ear-r { transform: rotate(38deg); right: 10.75em; }
    .blush-l, .blush-r {
      background-color: #ff8bb1;
      height: 1em;
      width: 1.37em;
      border-radius: 50%;
      position: absolute;
      top: 4em;
      opacity: 0.7;
    }
    .blush-l { transform: rotate(25deg); left: 1em; }
    .blush-r { transform: rotate(-25deg); right: 1em; }
    .eye-l, .eye-r {
      background-color: #3f3554;
      height: 2.18em;
      width: 2em;
      border-radius: 2em;
      position: absolute;
      top: 2.18em;
    }
    .eye-l { left: 1.37em; transform: rotate(-20deg); }
    .eye-r { right: 1.37em; transform: rotate(20deg); }
    .eyeball-l, .eyeball-r {
      height: 0.6em;
      width: 0.6em;
      background-color: #ffffff;
      border-radius: 50%;
      position: absolute;
      left: 0.6em;
      top: 0.6em;
      transition: 1s all;
    }
    .eyeball-l { transform: rotate(20deg); }
    .eyeball-r { transform: rotate(-20deg); }
    .nose {
      height: 1em;
      width: 1em;
      background-color: #3f3554;
      position: absolute;
      top: 4.37em;
      margin: auto;
      left: 0;
      right: 0;
      border-radius: 1.2em 0 0 0.25em;
      transform: rotate(45deg);
    }
    .nose:before {
      content: "";
      position: absolute;
      background-color: #3f3554;
      height: 0.6em;
      width: 0.1em;
      transform: rotate(-45deg);
      top: 0.75em;
      left: 1em;
    }
    .mouth, .mouth:before {
      height: 0.75em;
      width: 0.93em;
      background-color: transparent;
      position: absolute;
      border-radius: 50%;
      box-shadow: 0 0.18em #3f3554;
    }
    .mouth { top: 5.31em; left: 3.12em; }
    .mouth:before { content: ""; position: absolute; left: 0.87em; }
    .hand-l, .hand-r {
      background-color: #3f3554;
      height: 2.81em;
      width: 2.5em;
      border: 0.18em solid #2e0d30;
      border-radius: 0.6em 0.6em 2.18em 2.18em;
      transition: 1s all;
      position: absolute;
      top: 8.4em;
      z-index: 1;
    }
    .hand-l { left: 7.5em; }
    .hand-r { right: 7.5em; }
    .paw-l, .paw-r {
      background-color: #3f3554;
      height: 3.12em;
      width: 3.12em;
      border: 0.18em solid #2e0d30;
      border-radius: 2.5em 2.5em 1.2em 1.2em;
      position: absolute;
      top: 26.56em;
    }
    .paw-l { left: 10em; }
    .paw-r { right: 10em; }
    .paw-l:before, .paw-r:before {
      position: absolute;
      content: "";
      background-color: #ffffff;
      height: 1.37em;
      width: 1.75em;
      top: 1.12em;
      left: 0.55em;
      border-radius: 1.56em 1.56em 0.6em 0.6em;
    }
    .paw-l:after, .paw-r:after {
      position: absolute;
      content: "";
      background-color: #ffffff;
      height: 0.5em;
      width: 0.5em;
      border-radius: 50%;
      top: 0.31em;
      left: 1.12em;
      box-shadow: 0.87em 0.37em #ffffff, -0.87em 0.37em #ffffff;
    }
    .login-link {
      text-align: center;
      margin-top: 1em;
      font-size: 0.9em;
      color: #3f3554;
    }
    .login-link a {
      color: #f4c531;
      text-decoration: none;
      font-weight: 600;
    }
    .login-link a:hover {
      text-decoration: underline;
    }
    @media screen and (max-width: 500px) {
      .container { font-size: 14px; }
    }
  </style>
</head>

<body>
  <div class="container">
    <!-- ✅ JSP Registration Form -->
    <form action="RegisterServlet" method="post">
      <div class="form-title">Create Account</div>
      
      <label for="fullname">Full Name:</label>
      <input type="text" id="fullname" name="name" placeholder="Enter your full name" required />
      
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required />
      
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Create a password" required />
      
      <label for="role">Role:</label>
      <select id="role" name="role" required>
        <option value="">Select your role</option>
        <option value="customer">Customer</option>
        <option value="admin">Administrator</option>
        <option value="manager">Manager</option>
        <option value="user">Regular User</option>
      </select>
      
      <button type="submit">Register</button>
      
      <div class="login-link">
        Already have an account? <a href="login.jsp">Login here</a>
      </div>
    </form>

    <div class="ear-l"></div>
    <div class="ear-r"></div>
    <div class="panda-face">
      <div class="blush-l"></div>
      <div class="blush-r"></div>
      <div class="eye-l">
        <div class="eyeball-l"></div>
      </div>
      <div class="eye-r">
        <div class="eyeball-r"></div>
      </div>
      <div class="nose"></div>
      <div class="mouth"></div>
    </div>
    <div class="hand-l"></div>
    <div class="hand-r"></div>
    <div class="paw-l"></div>
    <div class="paw-r"></div>
  </div>

  <script>
    let fullnameRef = document.getElementById("fullname");
    let emailRef = document.getElementById("email");
    let passwordRef = document.getElementById("password");
    let roleRef = document.getElementById("role");
    let eyeL = document.querySelector(".eyeball-l");
    let eyeR = document.querySelector(".eyeball-r");
    let handL = document.querySelector(".hand-l");
    let handR = document.querySelector(".hand-r");

    let normalEyeStyle = () => {
      eyeL.style.cssText = `left:0.6em; top:0.6em;`;
      eyeR.style.cssText = `right:0.6em; top:0.6em;`;
    };
    let normalHandStyle = () => {
      handL.style.cssText = `height:2.81em; top:8.4em; left:7.5em; transform:rotate(0deg);`;
      handR.style.cssText = `height:2.81em; top:8.4em; right:7.5em; transform:rotate(0deg);`;
    };

    fullnameRef.addEventListener("focus", () => {
      eyeL.style.cssText = `left:0.75em; top:1.12em;`;
      eyeR.style.cssText = `right:0.75em; top:1.12em;`;
      normalHandStyle();
    });

    emailRef.addEventListener("focus", () => {
      eyeL.style.cssText = `left:0.5em; top:0.8em;`;
      eyeR.style.cssText = `right:0.5em; top:0.8em;`;
      normalHandStyle();
    });

    passwordRef.addEventListener("focus", () => {
      handL.style.cssText = `height:6.56em; top:3.87em; left:11.75em; transform:rotate(-155deg);`;
      handR.style.cssText = `height:6.56em; top:3.87em; right:11.75em; transform:rotate(155deg);`;
      normalEyeStyle();
    });

    roleRef.addEventListener("focus", () => {
      eyeL.style.cssText = `left:0.8em; top:1em;`;
      eyeR.style.cssText = `right:0.8em; top:1em;`;
      normalHandStyle();
    });

    document.addEventListener("click", (e) => {
      let clickedElem = e.target;
      if (clickedElem != fullnameRef && clickedElem != emailRef && 
          clickedElem != passwordRef && clickedElem != roleRef) {
        normalEyeStyle();
        normalHandStyle();
      }
    });

    // Form validation
    document.querySelector('form').addEventListener('submit', function(e) {
      let password = passwordRef.value;
      if (password.length < 6) {
        e.preventDefault();
        alert('Password must be at least 6 characters long');
        passwordRef.focus();
      }
    });
  </script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* Floating geometric elements */
        .geometric-shapes {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .shape {
            position: absolute;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
        }

        .circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 3px solid #fff;
        }

        .triangle {
            width: 0;
            height: 0;
            border-left: 20px solid transparent;
            border-right: 20px solid transparent;
            border-bottom: 35px solid #fff;
        }

        .triangle.down {
            border-bottom: none;
            border-top: 35px solid #fff;
        }

        .square {
            width: 30px;
            height: 30px;
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 6px;
        }

        /* Position shapes */
        .shape:nth-child(1) { top: 20%; left: 15%; animation-delay: 0s; }
        .shape:nth-child(2) { top: 60%; left: 10%; animation-delay: 1s; }
        .shape:nth-child(3) { top: 15%; right: 20%; animation-delay: 2s; }
        .shape:nth-child(4) { top: 70%; right: 15%; animation-delay: 0.5s; }
        .shape:nth-child(5) { top: 40%; left: 8%; animation-delay: 1.5s; }
        .shape:nth-child(6) { bottom: 20%; right: 25%; animation-delay: 2.5s; }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-20px) rotate(10deg); }
            66% { transform: translateY(10px) rotate(-5deg); }
        }

        /* Login container */
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 60px 50px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            position: relative;
            z-index: 2;
        }

        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .login-header h1 {
            color: #333;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .profile-icon {
            width: 160px;
            height: 90px;
            background: linear-gradient(135deg, #4a5568, #2d3748);
            border-radius: 12px;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .profile-icon::before {
            content: '';
            width: 35px;
            height: 35px;
            border: 3px solid rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            position: absolute;
            top: 15px;
        }

        .profile-icon::after {
            content: '';
            width: 45px;
            height: 25px;
            border: 3px solid rgba(255, 255, 255, 0.8);
            border-radius: 25px 25px 0 0;
            border-bottom: none;
            position: absolute;
            bottom: 12px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .input-container {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #81c784;
            font-size: 18px;
            z-index: 1;
        }

        .form-input {
            width: 100%;
            padding: 18px 20px 18px 55px;
            border: none;
            border-radius: 50px;
            background-color: #f5f5f5;
            font-size: 16px;
            color: #333;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            background-color: #e8f5e8;
            box-shadow: 0 0 0 3px rgba(129, 199, 132, 0.2);
        }

        .form-input::placeholder {
            color: #999;
        }

        .login-btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #66bb6a, #4caf50);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }

        .login-btn:hover {
            background: linear-gradient(135deg, #5cb660, #43a047);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.3);
        }

        .forgot-password {
            text-align: center;
            margin-bottom: 30px;
        }

        .forgot-password a {
            color: #999;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #666;
        }

        .create-account {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .create-account a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: color 0.3s ease;
        }

        .create-account a:hover {
            color: #333;
        }

        .create-account a::after {
            content: '→';
            font-size: 16px;
        }

        @media (max-width: 480px) {
            .login-container {
                margin: 20px;
                padding: 40px 30px;
            }

            .login-header h1 {
                font-size: 24px;
            }

            .profile-icon {
                width: 100px;
                height: 70px;
            }
        }
    </style>
</head>
<body>
<div class="geometric-shapes">
    <div class="shape circle"></div>
    <div class="shape triangle"></div>
    <div class="shape circle"></div>
    <div class="shape triangle down"></div>
    <div class="shape square"></div>
    <div class="shape circle"></div>
</div>

<div class="login-container">
    <div class="login-header">
        <h1>Pahana Edu BookShop Login</h1>
        <div class="profile-icon"></div>
    </div>

    <form action="login" method="post">
        <div class="form-group">
            <div class="input-container">
                <div class="input-icon"></div>
                <input type="text" class="form-input" placeholder="Enter Username" name="username" required>
            </div>
        </div>

        <div class="form-group">
            <div class="input-container">

                <input type="password" class="form-input" placeholder="Enter Valid Password" name="password" required>
            </div>
        </div>

       <input type="submit" class="login-btn" value="Login">

        <div class="forgot-password">
            <a href="#" onclick="return false;">Forgot Username / Password?</a>
        </div>


    </form>
</div>
<%
    String error = request.getParameter("error");
    if ("true".equals(error)) {
%>
<script>
    alert("Invalid username or password!");
    if (window.history.replaceState) {
        // Remove the query string so it won't show again on refresh
        window.history.replaceState(null, null, window.location.pathname);
    }
</script>
<%
    }
%>

</body>

</html>
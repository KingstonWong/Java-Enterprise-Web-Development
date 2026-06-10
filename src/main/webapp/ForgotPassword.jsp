<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password - LMS Pro</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="landing.css">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            body {
                background-color: #f8fafc;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                font-family: 'Inter', sans-serif;
            }

            .main-content {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 40px 24px;
            }

            .card {
                max-width: 450px;
                width: 100%;
                background: white;
                padding: 48px;
                border-radius: 24px;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            }

            .form-input {
                width: 100%;
                padding: 12px 16px;
                padding-left: 44px;
                border: 1px solid #e2e8f0;
                border-radius: 12px;
                background: #f8fafc;
                margin-top: 8px;
            }

            .input-icon {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: #94a3b8;
                font-size: 20px;
            }
        </style>
    </head>

    <body>
        <header class="navbar">
            <div class="container nav-container">
                <a href="Landing.jsp" class="nav-brand">
                    <span class="material-symbols-outlined">book_2</span>
                    <span>LMS Pro</span>
                </a>
                <nav class="nav-links">
                    <a href="Landing.jsp#features" class="nav-link">Features</a>
                    <a href="Landing.jsp#mission" class="nav-link">Mission</a>
                    <div class="nav-separator"></div>
                    <div style="display: flex; gap: 12px; align-items: center; margin-left: 12px;">
                        <a href="user-login" class="nav-btn-white">Sign In</a>
                        <a href="Register.jsp" class="nav-btn-primary" style="font-weight: 700;">Sign Up</a>
                    </div>
                </nav>
            </div>
        </header>

        <main class="main-content"
            style="flex: 1; display: flex; align-items: center; justify-content: center; margin-left: 0; max-width: none; margin-right: 0;">
            <div class="card">
                <div style="text-align: center; margin-bottom: 32px;">
                    <div
                        style="display: inline-flex; width: 64px; height: 64px; background: #eff6ff; color: #1877f2; border-radius: 16px; align-items: center; justify-content: center; margin-bottom: 24px;">
                        <span class="material-symbols-outlined" style="font-size: 32px;">lock_reset</span>
                    </div>
                    <h1 style="font-size: 1.875rem; font-weight: 800; color: #0f172a; margin: 0;">Forgot Password?</h1>
                    <p style="color: #64748b; margin-top: 8px;">Enter your email to receive a temporary password.</p>
                </div>

                <% if (request.getAttribute("error") !=null) { %>
                    <div
                        style="background: #fef2f2; color: #991b1b; padding: 12px; border-radius: 12px; margin-bottom: 24px; font-size: 0.875rem; display: flex; align-items: center; gap: 8px;">
                        <span class="material-symbols-outlined" style="font-size: 18px;">error</span>
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                        <% if (request.getAttribute("success") !=null) { %>
                            <div
                                style="background: #f0fdf4; color: #166534; padding: 24px; border-radius: 16px; margin-bottom: 24px; text-align: center;">
                                <span class="material-symbols-outlined"
                                    style="font-size: 48px; margin-bottom: 12px;">check_circle</span>
                                <h2 style="font-size: 1.25rem; font-weight: 700; margin-bottom: 8px;">
                                    <%= request.getAttribute("success") %>
                                </h2>
                                <p style="font-size: 0.875rem; opacity: 0.9; margin-bottom: 0;">You can now use that
                                    password to log in and reset your credentials.</p>
                            </div>
                            <a href="user-login" class="btn-primary"
                                style="display: flex; justify-content: center; text-decoration: none; background: #1877f2; color: white; padding: 14px; border-radius: 12px; font-weight: 700;">Back
                                to Login</a>
                            <% } else { %>
                                <form action="forgot-password" method="post"
                                    style="display: flex; flex-direction: column; gap: 24px;">
                                    <div class="form-group">
                                        <label style="font-size: 0.875rem; font-weight: 600; color: #475569;">Email
                                            Address</label>
                                        <div style="position: relative;">
                                            <span class="material-symbols-outlined input-icon">alternate_email</span>
                                            <input type="email" name="email" class="form-input"
                                                placeholder="Enter your registered email" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn-primary"
                                        style="background: #1877f2; padding: 14px; width: 100%; display: flex; justify-content: center; align-items: center; border-radius: 12px; border: none; color: white; font-weight: 700; font-size: 1rem; cursor: pointer;">Reset
                                        Password</button>
                                    <a href="user-login"
                                        style="text-align: center; color: #64748b; font-size: 0.875rem; text-decoration: none; font-weight: 600;">Back
                                        to Login</a>
                                </form>
                                <% } %>
            </div>
        </main>
    </body>

    </html>
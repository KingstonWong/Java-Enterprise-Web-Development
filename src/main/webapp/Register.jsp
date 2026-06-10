<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Member Registration - LMS Pro</title>
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

            .register-card {
                max-width: 1000px;
                width: 100%;
                background: white;
                border-radius: 24px;
                overflow: hidden;
                display: flex;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                min-height: 650px;
            }

            .register-left {
                flex: 1.5;
                padding: 48px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .register-right {
                flex: 1;
                background: #cce4ff;
                background: linear-gradient(to bottom, #dbeafe 0%, #cce4ff 100%);
                padding: 48px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                position: relative;
            }

            .form-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
                margin-bottom: 20px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-label {
                font-size: 0.875rem;
                font-weight: 600;
                color: #0f172a;
            }

            .form-input {
                width: 100%;
                padding: 10px 14px;
                border: 1px solid #e2e8f0;
                border-radius: 8px;
                font-size: 0.875rem;
                outline: none;
                transition: all 0.2s;
            }

            .form-input:focus {
                border-color: #1877f2;
                box-shadow: 0 0 0 3px rgba(24, 119, 242, 0.1);
            }

            @media (max-width: 768px) {
                .register-card {
                    flex-direction: column;
                }

                .register-right {
                    display: none;
                }

                .form-grid {
                    grid-template-columns: 1fr;
                }
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

        <main class="main-content">
            <div class="register-card">
                <div class="register-left">
                    <div style="max-width: 448px; width: 100%; margin: 0 auto;">
                        <h1
                            style="font-size: 2rem; font-weight: 800; color: #0f172a; margin-bottom: 8px; letter-spacing: -0.025em;">
                            Member Registration</h1>
                        <p style="color: #64748b; font-size: 0.875rem; margin-bottom: 32px;">Create an account to borrow
                            books and access digital resources.</p>

                        <% if (request.getAttribute("error") !=null) { %>
                            <div
                                style="background: #fef2f2; color: #991b1b; padding: 12px; border-radius: 12px; margin-bottom: 24px; font-size: 0.875rem; display: flex; align-items: center; gap: 8px;">
                                <span class="material-symbols-outlined" style="font-size: 18px;">error</span>
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                                <form action="Register" method="post" style="display: flex; flex-direction: column;">
                                    <div class="form-grid">
                                        <div class="form-group">
                                            <label class="form-label">Full Name</label>
                                            <input type="text" name="member_name" class="form-input"
                                                placeholder="Enter your full name" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Phone Number</label>
                                            <input type="tel" name="phone_number" class="form-input"
                                                placeholder="Enter phone number" required>
                                        </div>
                                        <div class="form-group" style="grid-column: 1 / -1;">
                                            <label class="form-label">Email Address</label>
                                            <input type="email" name="email" class="form-input"
                                                placeholder="Enter your email" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Create Password</label>
                                            <input type="password" name="password" class="form-input"
                                                placeholder="Enter password" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Confirm Password</label>
                                            <input type="password" name="confirm_password" class="form-input"
                                                placeholder="Confirm password" required>
                                        </div>
                                    </div>

                                    <div
                                        style="display: flex; align-items: flex-start; gap: 10px; margin: 12px 0 24px;">
                                        <input type="checkbox" id="terms" name="agree_terms" required
                                            style="width: 16px; height: 16px; margin-top: 2px;">
                                        <label for="terms" style="font-size: 0.875rem; color: #475569;">
                                            I agree to the <a href="#"
                                                style="color: #1877f2; font-weight: 600; text-decoration: none;">Terms
                                                and Conditions</a> and <a href="#"
                                                style="color: #1877f2; font-weight: 600; text-decoration: none;">Privacy
                                                Policy</a>
                                        </label>
                                    </div>

                                    <button type="submit" class="btn-primary"
                                        style="background: #1877f2; color: white; border: none; padding: 12px; border-radius: 8px; font-size: 1rem; font-weight: 700; cursor: pointer; transition: background 0.2s; display: flex; justify-content: center; width: 100%;">Create
                                        Account</button>
                                </form>

                                <p style="text-align: center; margin-top: 24px; font-size: 0.875rem; color: #64748b;">
                                    Already have an account? <a href="Login.jsp"
                                        style="color: #1877f2; font-weight: 700; text-decoration: none;">Log in</a>
                                </p>
                    </div>
                </div>

                <div class="register-right">
                    <div
                        style="position: relative; z-index: 10; display: flex; flex-direction: column; align-items: center;">
                        <div
                            style="width: 80px; height: 80px; background: white; border-radius: 16px; display: flex; align-items: center; justify-content: center; margin-bottom: 32px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                            <span class="material-symbols-outlined"
                                style="font-size: 40px; color: #1877f2;">book_2</span>
                        </div>
                        <h2 style="font-size: 1.5rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Expand
                            Your Knowledge</h2>
                        <p style="color: #475569; max-width: 280px; font-size: 0.95rem; line-height: 1.5;">Join
                            thousands of members accessing our vast collection of physical and digital materials.</p>
                        <div style="display: flex; gap: 8px; margin-top: 48px;">
                            <div style="width: 8px; height: 8px; background: #1877f2; border-radius: 50%;"></div>
                            <div style="width: 8px; height: 8px; background: #bfdbfe; border-radius: 50%;"></div>
                            <div style="width: 8px; height: 8px; background: #bfdbfe; border-radius: 50%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>

    </html>
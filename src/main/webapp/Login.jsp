<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Member Access - LMS Pro</title>
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

            .login-card {
                max-width: 1000px;
                width: 100%;
                background: white;
                border-radius: 24px;
                overflow: hidden;
                display: flex;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
                min-height: 600px;
            }

            .login-left {
                flex: 1;
                background: #255b98;
                background: linear-gradient(135deg, #1877f2 0%, #0d47a1 100%);
                padding: 48px;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                position: relative;
                overflow: hidden;
            }

            .login-left::before {
                content: '';
                position: absolute;
                inset: 0;
                background: url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?q=80&w=2000&auto=format&fit=crop');
                background-size: cover;
                opacity: 0.1;
                mix-blend-mode: overlay;
            }

            .login-right {
                flex: 1;
                padding: 48px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .switcher {
                display: flex;
                background: #f1f5f9;
                padding: 4px;
                border-radius: 12px;
                margin-bottom: 32px;
            }

            .switcher-btn {
                flex: 1;
                padding: 10px;
                text-align: center;
                border-radius: 8px;
                font-weight: 600;
                font-size: 0.875rem;
                cursor: pointer;
                transition: all 0.2s;
                text-decoration: none;
                color: #64748b;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .switcher-btn.active {
                background: white;
                color: #1877f2;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .form-input {
                width: 100%;
                padding: 12px 16px;
                padding-left: 44px;
                border: 1px solid #e2e8f0;
                border-radius: 12px;
                font-size: 0.95rem;
                transition: all 0.2s;
                background: #f8fafc;
            }

            .form-input:focus {
                outline: none;
                border-color: #1877f2;
                box-shadow: 0 0 0 3px rgba(24, 119, 242, 0.1);
                background: white;
            }

            .input-icon {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: #94a3b8;
                font-size: 20px;
            }

            @media (max-width: 768px) {
                .login-card {
                    flex-direction: column;
                }

                .login-left {
                    display: none;
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
            <div class="login-card">
                <div class="login-left">
                    <div style="position: relative; z-index: 10;">
                        <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 40px;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">book_2</span>
                            <span style="font-size: 1.5rem; font-weight: 700;">LMS Pro</span>
                        </div>
                        <h1 style="font-size: 2.75rem; font-weight: 800; line-height: 1.2; margin-bottom: 24px;">Digital
                            Access to Infinite Knowledge.</h1>
                        <p style="font-size: 1.125rem; opacity: 0.9; line-height: 1.6;">Manage your loans, explore our
                            catalog, and access thousands of digital resources from anywhere.</p>
                    </div>
                    <div style="position: relative; z-index: 10; display: flex; gap: 8px;">
                        <div style="width: 32px; height: 6px; background: white; border-radius: 3px;"></div>
                        <div style="width: 6px; height: 6px; background: rgba(255,255,255,0.4); border-radius: 3px;">
                        </div>
                        <div style="width: 6px; height: 6px; background: rgba(255,255,255,0.4); border-radius: 3px;">
                        </div>
                    </div>
                </div>
                <div class="login-right">
                    <div style="max-width: 400px; width: 100%; margin: 0 auto;">
                        <h2 style="font-size: 1.875rem; font-weight: 800; color: #0f172a; margin-bottom: 8px;">Welcome
                            Back</h2>
                        <p style="color: #64748b; margin-bottom: 32px;">Please enter your details to sign in.</p>

                        <div class="switcher">
                            <button class="switcher-btn active">
                                <span class="material-symbols-outlined" style="font-size: 18px;">person</span>
                                Member
                            </button>
                            <a href="admin-login" class="switcher-btn">
                                <span class="material-symbols-outlined" style="font-size: 18px;">shield</span>
                                Admin
                            </a>
                        </div>

                        <% String error=(String) request.getAttribute("error"); %>
                            <% if (error !=null) { %>
                                <div
                                    style="background: #fef2f2; color: #991b1b; padding: 12px; border-radius: 12px; margin-bottom: 24px; font-size: 0.875rem; display: flex; align-items: center; gap: 8px;">
                                    <span class="material-symbols-outlined" style="font-size: 18px;">error</span>
                                    <%= error %>
                                </div>
                                <% } %>

                                    <form action="user-login" method="post"
                                        style="display: flex; flex-direction: column; gap: 20px;">
                                        <div class="form-group">
                                            <label
                                                style="display: block; font-size: 0.875rem; font-weight: 600; color: #475569; margin-bottom: 8px;">Email
                                                Address</label>
                                            <div style="position: relative;">
                                                <span
                                                    class="material-symbols-outlined input-icon">alternate_email</span>
                                                <input type="email" name="email" class="form-input"
                                                    placeholder="Enter your email" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label
                                                style="display: block; font-size: 0.875rem; font-weight: 600; color: #475569; margin-bottom: 8px;">Password</label>
                                            <div style="position: relative;">
                                                <span class="material-symbols-outlined input-icon">lock</span>
                                                <input type="password" name="password" class="form-input"
                                                    placeholder="••••••••" required>
                                            </div>
                                        </div>
                                        <div
                                            style="display: flex; align-items: center; justify-content: space-between;">
                                            <label
                                                style="display: flex; align-items: center; gap: 8px; font-size: 0.875rem; color: #64748b; cursor: pointer;">
                                                <input type="checkbox"
                                                    style="width: 16px; height: 16px; border-radius: 4px;">
                                                Remember me
                                            </label>
                                            <a href="forgot-password"
                                                style="font-size: 0.875rem; color: #1877f2; text-decoration: none; font-weight: 600;">Forgot
                                                Password?</a>
                                        </div>
                                        <button type="submit" class="btn-primary"
                                            style="background: #1877f2; padding: 14px; width: 100%; display: flex; justify-content: center; font-size: 1rem; font-weight: 700; border-radius: 12px; border: none; color: white; cursor: pointer;">Sign
                                            in</button>
                                    </form>

                                    <p
                                        style="text-align: center; margin-top: 32px; color: #64748b; font-size: 0.95rem;">
                                        Don't have an account? <a href="Register.jsp"
                                            style="color: #1877f2; text-decoration: none; font-weight: 700;">Register
                                            here</a>
                                    </p>
                    </div>
                </div>
            </div>
        </main>
    </body>

    </html>
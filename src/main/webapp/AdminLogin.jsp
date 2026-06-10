<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Portal - LibriSphere</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            body {
                background-color: white;
                margin: 0;
                padding: 0;
                display: flex;
                min-height: 100vh;
                font-family: 'Inter', sans-serif;
                color: #0f172a;
            }

            .admin-left {
                display: none;
                width: 50%;
                background: #1a4b7c url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000&auto=format&fit=crop') center/cover;
                position: relative;
                padding: 48px;
                flex-direction: column;
                justify-content: space-between;
                color: white;
            }

            @media (min-width: 1024px) {
                .admin-left {
                    display: flex;
                }
            }

            .admin-overlay {
                position: absolute;
                inset: 0;
                background: rgba(26, 75, 124, 0.8);
                z-index: 1;
                mix-blend-mode: multiply;
            }

            .admin-left-content {
                position: relative;
                z-index: 10;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .admin-right {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 48px;
                background: white;
            }

            .admin-form-container {
                max-width: 400px;
                width: 100%;
            }

            .portal-badge {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 6px 12px;
                background: #f1f5f9;
                color: #1a4b7c;
                border-radius: 9999px;
                font-size: 0.75rem;
                font-weight: 700;
                margin-bottom: 24px;
                text-transform: uppercase;
                letter-spacing: 0.025em;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
                margin-bottom: 20px;
            }

            .form-label {
                font-size: 0.875rem;
                font-weight: 600;
                color: #0f172a;
            }

            .input-wrapper {
                position: relative;
                display: flex;
                align-items: center;
            }

            .input-icon {
                position: absolute;
                left: 14px;
                color: #94a3b8;
                font-size: 20px;
                transition: color 0.2s;
                pointer-events: none;
            }

            .input-wrapper:focus-within .input-icon {
                color: #1877f2;
            }

            .form-input {
                width: 100%;
                padding: 12px 14px 12px 44px;
                background: #f8fafc;
                border: 1px solid #e2e8f0;
                border-radius: 12px;
                font-size: 0.875rem;
                transition: all 0.2s;
                outline: none;
                color: #0f172a;
            }

            .form-input:focus {
                background: white;
                border-color: #1877f2;
                box-shadow: 0 0 0 4px rgba(24, 119, 242, 0.1);
            }

            .form-input::placeholder {
                color: #94a3b8;
            }

            .password-toggle {
                position: absolute;
                right: 14px;
                background: none;
                border: none;
                color: #94a3b8;
                cursor: pointer;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: color 0.2s;
            }

            .password-toggle:hover {
                color: #64748b;
            }

            .btn-primary {
                background: #1877f2;
                color: white;
                border: none;
                padding: 14px;
                width: 100%;
                border-radius: 12px;
                font-size: 0.875rem;
                font-weight: 700;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                transition: all 0.2s;
                margin-top: 8px;
            }

            .btn-primary:hover {
                background: #166fe5;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(24, 119, 242, 0.2);
            }

            .btn-primary:active {
                transform: translateY(0);
            }

            .checkbox-container {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 0.875rem;
                color: #64748b;
                cursor: pointer;
                user-select: none;
            }

            .checkbox-container input {
                width: 16px;
                height: 16px;
                accent-color: #1877f2;
                cursor: pointer;
            }

            .forgot-link {
                color: #1877f2;
                text-decoration: none;
                font-size: 0.875rem;
                font-weight: 600;
                transition: color 0.1s;
            }

            .forgot-link:hover {
                color: #166fe5;
                text-decoration: underline;
            }

            .divider {
                display: flex;
                align-items: center;
                width: 100%;
                margin: 40px 0 24px;
            }

            .divider::before,
            .divider::after {
                content: "";
                flex: 1;
                height: 1px;
                background: #e2e8f0;
            }

            .divider-text {
                padding: 0 16px;
                color: #94a3b8;
                font-size: 0.75rem;
                font-weight: 500;
            }

            .btn-secondary {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                padding: 10px 24px;
                border-radius: 9999px;
                border: 1px solid #e2e8f0;
                background: white;
                text-decoration: none;
                color: #475569;
                font-size: 0.875rem;
                font-weight: 600;
                transition: all 0.2s;
            }

            .btn-secondary:hover {
                background: #f8fafc;
                border-color: #cbd5e1;
                color: #1e293b;
            }

            .error-ribbon {
                background: #fef2f2;
                color: #991b1b;
                padding: 12px;
                border-radius: 12px;
                margin-bottom: 24px;
                font-size: 0.875rem;
                display: flex;
                align-items: center;
                gap: 8px;
                border: 1px solid #fee2e2;
            }
        </style>
    </head>

    <body>
        <div class="admin-left">
            <div class="admin-overlay"></div>
            <div class="admin-left-content">
                <div style="display: flex; align-items: center; gap: 12px;">
                    <div
                        style="background: rgba(255,255,255,0.2); padding: 10px; border-radius: 12px; backdrop-filter: blur(8px);">
                        <span class="material-symbols-outlined" style="color: white; font-size: 24px;">book_2</span>
                    </div>
                    <span style="font-size: 1.5rem; font-weight: 700;">LMS Pro</span>
                </div>

                <div style="margin-bottom: 120px;">
                    <h1
                        style="font-size: 3.5rem; font-weight: 800; line-height: 1.1; margin-bottom: 24px; letter-spacing: -0.02em;">
                        Empowering<br />Knowledge<br />Management</h1>
                    <p style="font-size: 1.125rem; color: rgba(255,255,255,0.9); max-width: 440px; line-height: 1.6;">
                        Access the central nervous system of your library. Manage collections, track circulations, and
                        support your community with our advanced administrative suite.
                    </p>
                </div>

                <div style="display: flex; gap: 24px; font-size: 0.875rem; font-weight: 500; opacity: 0.8;">
                    <span style="display: flex; align-items: center; gap: 8px;"><span class="material-symbols-outlined"
                            style="font-size: 18px;">verified_user</span> Secure SSL</span>
                    <span style="display: flex; align-items: center; gap: 8px;"><span class="material-symbols-outlined"
                            style="font-size: 18px;">database</span> Real-time Sync</span>
                </div>
            </div>
        </div>

        <div class="admin-right">
            <div class="admin-form-container">
                <div class="portal-badge">
                    <span class="material-symbols-outlined" style="font-size: 14px;">shield</span>
                    ADMIN PORTAL
                </div>
                <h2 style="font-size: 1.875rem; font-weight: 800; color: #0f172a; margin-bottom: 8px; letter-spacing: -0.01em;">Welcome Back</h2>
                <p style="color: #64748b; font-size: 0.875rem; margin-bottom: 32px;">Please enter your administrative
                    credentials to continue.</p>

                <% String error=(String) request.getAttribute("error"); %>
                    <% if (error !=null) { %>
                        <div class="error-ribbon">
                            <span class="material-symbols-outlined" style="font-size: 18px;">error</span>
                            <%= error %>
                        </div>
                        <% } %>

                            <form action="admin-login" method="post" style="display: flex; flex-direction: column;">
                                <div class="form-group">
                                    <label class="form-label" for="email">Admin ID or Email</label>
                                    <div class="input-wrapper">
                                        <span class="material-symbols-outlined input-icon">alternate_email</span>
                                        <input type="text" id="email" name="email" class="form-input"
                                            placeholder="admin@library.com" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="password">Password</label>
                                    <div class="input-wrapper">
                                        <span class="material-symbols-outlined input-icon">lock</span>
                                        <input type="password" id="password" name="password" class="form-input"
                                            placeholder="••••••••" required>
                                        <button type="button" class="password-toggle" id="togglePassword">
                                            <span class="material-symbols-outlined" style="font-size: 20px;">visibility</span>
                                        </button>
                                    </div>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; margin-top: 4px;">
                                    <label class="checkbox-container">
                                        <input type="checkbox" name="remember">
                                        Remember me
                                    </label>
                                    <a href="forgot-password" class="forgot-link">Forgot Password?</a>
                                </div>
                                <button type="submit" class="btn-primary">
                                    <span class="material-symbols-outlined" style="font-size: 18px; opacity: 0.7;">shield</span>
                                    Login as Admin
                                </button>
                            </form>

                            <div class="divider">
                                <span class="divider-text">Not an administrator?</span>
                            </div>

                            <a href="Login.jsp" class="btn-secondary">
                                Go to Member Login
                                <span class="material-symbols-outlined" style="font-size: 18px;">arrow_forward</span>
                            </a>

                            <p style="margin-top: 48px; text-align: center; font-size: 0.75rem; color: #94a3b8; line-height: 1.6;">
                                © 2024 Library Management System. All rights reserved.<br />
                                Unauthorized access is strictly prohibited.
                            </p>
            </div>
        </div>

        <script>
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#password');

            togglePassword.addEventListener('click', function (e) {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                
                this.querySelector('span').textContent = type === 'password' ? 'visibility' : 'visibility_off';
            });
        </script>
    </body>

    </html>
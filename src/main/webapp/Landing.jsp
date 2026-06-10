<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LMS Pro - Smart Library Management</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="landing.css">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>

    <body class="bg-slate-50 min-h-screen font-sans">
        <%-- Navbar --%>
            <header class="navbar">
                <div class="container nav-container">
                    <a href="Landing.jsp" class="nav-brand">
                        <span class="material-symbols-outlined">book_2</span>
                        <span style="color: #0f172a;">LMS Pro</span>
                    </a>
                    <nav class="nav-links">
                        <a href="#features" class="nav-link">Features</a>
                        <a href="#mission" class="nav-link">Mission</a>
                        <div class="nav-separator"></div>
                        <div style="display: flex; gap: 12px; align-items: center; margin-left: 12px;">
                            <a href="user-login" class="nav-btn-white">Sign In</a>
                            <a href="Register.jsp" class="nav-btn-primary" style="font-weight: 700;">Get Started</a>
                        </div>
                    </nav>
                </div>
            </header>

            <main>
                <%-- Hero Section --%>
                    <section class="container hero">
                        <div class="hero-content">
                            <div class="hero-badge">Empowering Lifelong Learning</div>
                            <h1 class="hero-title">
                                Unlock Your World <br />
                                of <span>Knowledge</span>
                            </h1>
                            <p class="hero-description">
                                Experience a seamless way to discover, manage, and enjoy our vast collection of books
                                and digital resources through our modern member portal.
                            </p>
                            <div class="hero-actions">
                                <a href="user-login" class="btn btn-blue"
                                    style="padding: 16px 32px; font-size: 1.125rem;">Sign In Now</a>
                                <a href="Register.jsp" class="btn btn-outline"
                                    style="padding: 16px 32px; font-size: 1.125rem;">Register Account</a>
                            </div>
                        </div>
                        <div class="hero-image">
                            <img src="https://images.unsplash.com/photo-1568667256549-094345857637?q=80&w=1000&auto=format&fit=crop"
                                alt="Library Interior">
                        </div>
                    </section>

                    <%-- Features Section --%>
                        <section id="features" class="features">
                            <div class="container">
                                <div class="section-header">
                                    <h2
                                        style="font-size: 2.25rem; font-weight: 800; color: #1e293b; margin-bottom: 16px;">
                                        Experience Smarter Reading</h2>
                                    <p style="color: #64748b; font-size: 1.125rem;">Our member portal is designed with
                                        you in mind, making library access more efficient and enjoyable than ever
                                        before.</p>
                                </div>

                                <div class="features-grid">
                                    <div class="feature-card">
                                        <div class="feature-icon"><span class="material-symbols-outlined">search</span>
                                        </div>
                                        <h3>Easy Discovery</h3>
                                        <p>Find your next favorite read in seconds with our powerful AI-driven search
                                            engine.</p>
                                    </div>
                                    <div class="feature-card">
                                        <div class="feature-icon"><span class="material-symbols-outlined">book</span>
                                        </div>
                                        <h3>Manage Loans</h3>
                                        <p>Keep track of due dates, renew books instantly, and manage holds with one
                                            tap.</p>
                                    </div>
                                    <div class="feature-card">
                                        <div class="feature-icon"><span
                                                class="material-symbols-outlined">cloud_download</span></div>
                                        <h3>Digital Assets</h3>
                                        <p>Access thousands of e-books, journals, and databases from any device,
                                            anywhere.</p>
                                    </div>
                                    <div class="feature-card">
                                        <div class="feature-icon"><span
                                                class="material-symbols-outlined">auto_awesome</span></div>
                                        <h3>Smart Suggestions</h3>
                                        <p>Get personalized recommendations based on your reading history and interests.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <%-- Mission Section --%>
                            <section id="mission" class="mission">
                                <div class="container">
                                    <div class="mission-box">
                                        <div class="mission-content">
                                            <h2>Our Mission</h2>
                                            <p>At LMS Pro, we are dedicated to empowering our community by providing
                                                equitable access to information. We believe that access to books and
                                                digital media is a fundamental right that fosters a love for reading and
                                                supports lifelong learning.</p>
                                            <p>Our portal bridges the gap between traditional library values and modern
                                                technology, ensuring that every member can navigate our vast collections
                                                with ease and inspiration.</p>
                                        </div>
                                        <div class="mission-visual">
                                            <div class="mission-card">
                                                <h3>OUR<br>COMMUNITY</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <%-- CTA Section --%>
                                <section class="cta">
                                    <div class="container">
                                        <div class="cta-box">
                                            <h2>Ready to start your journey?</h2>
                                            <p>Join thousands of readers today. Create your free account and get instant
                                                access to our entire digital catalog.</p>
                                            <div class="cta-actions">
                                                <a href="Register.jsp" class="btn btn-white"
                                                    style="padding: 14px 40px; font-size: 1.125rem;">Join Now</a>
                                                <a href="#" class="btn btn-ghost"
                                                    style="padding: 14px 40px; font-size: 1.125rem;">View Catalog</a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
            </main>

            <%-- Footer --%>
                <footer class="footer">
                    <div class="container">
                        <div class="footer-grid">
                            <div class="footer-brand">
                                <a href="#" class="brand-link">
                                    <span class="material-symbols-outlined">book_2</span>
                                    <span>LMS Pro</span>
                                </a>
                                <p>A complete solution for modern libraries and eager learners.</p>
                            </div>
                            <div class="footer-column">
                                <h4>Portal</h4>
                                <ul class="footer-links">
                                    <li><a href="#">Digital Books</a></li>
                                    <li><a href="#">Audiobooks</a></li>
                                    <li><a href="#">Research Papers</a></li>
                                </ul>
                            </div>
                            <div class="footer-column">
                                <h4>Support</h4>
                                <ul class="footer-links">
                                    <li><a href="#">Help Center</a></li>
                                    <li><a href="#">Loan Policy</a></li>
                                    <li><a href="#">Contact Support</a></li>
                                </ul>
                            </div>
                            <div class="footer-column">
                                <h4>Legal</h4>
                                <ul class="footer-links">
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Terms of Service</a></li>
                                    <li><a href="#">Admin Login</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <p>© 2024 LMS Pro Library Management. All rights reserved.</p>
                            <div class="footer-social">
                                <span class="material-symbols-outlined">globe</span>
                                <span class="material-symbols-outlined">mail</span>
                            </div>
                        </div>
                    </div>
                </footer>
    </body>

    </html>
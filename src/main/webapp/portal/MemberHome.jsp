<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, Models.Book, Models.BorrowRecordDTO, Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); List<Book> listBooks = (List<Book>)
                request.getAttribute("listBooks");
                List<BorrowRecordDTO> activeLoans = (List<BorrowRecordDTO>) request.getAttribute("activeLoans");
                        List<BorrowRecordDTO> memberRecords = (List<BorrowRecordDTO>)
                                request.getAttribute("memberRecords");
                                int pendingCount = (Integer) request.getAttribute("pendingCount");
                                int overdueCount = (Integer) request.getAttribute("overdueCount");
                                double finesBalance = (Double) request.getAttribute("finesBalance");
                                int currentLoansCount = (activeLoans != null) ? activeLoans.size() : 0;
                                String searchQuery = (String) request.getAttribute("searchQuery");
                                %>
                                <!DOCTYPE html>
                                <html lang="en">

                                <head>
                                    <meta charset="UTF-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <title>Library Portal - Home</title>
                                    <link rel="stylesheet"
                                        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                                    <link rel="stylesheet" href="member-portal.css">
                                </head>

                                <body class="mp-page">
                                    <jsp:include page="MemberHeader.jsp" />

                                    <main class="mp-container">
                                        <!-- Welcome -->
                                        <div class="mp-mb-8">
                                            <h1 style="font-size:1.875rem;font-weight:700;color:var(--mp-gray-900);">
                                                Welcome back, <%= user.getMember_name().split(" ")[0] %>!</h1>
            <p style=" color:var(--mp-gray-600);margin-top:8px;">Here's what's happening with your account and some new
                                                    recommendations.</p>
                                        </div>

                                        <!-- Quick Stats -->
                                        <div class="mp-stats-grid mp-mb-12">
                                            <a href="Portal?action=loans" class="mp-stat-card">
                                                <div class="mp-stat-icon blue"><span
                                                        class="material-symbols-outlined">menu_book</span></div>
                                                <div>
                                                    <p class="mp-stat-label">Current Loans</p>
                                                    <p class="mp-stat-value">
                                                        <%= currentLoansCount %><span class="mp-stat-max">/ 10
                                                                max</span>
                                                    </p>
                                                </div>
                                            </a>
                                            <a href="Portal?action=requests" class="mp-stat-card">
                                                <div class="mp-stat-icon orange"><span
                                                        class="material-symbols-outlined">hourglass_empty</span></div>
                                                <div>
                                                    <p class="mp-stat-label">Pending Holds</p>
                                                    <p class="mp-stat-value">
                                                        <%= pendingCount %>
                                                    </p>
                                                </div>
                                            </a>
                                            <a href="Portal?action=loans" class="mp-stat-card">
                                                <div class="mp-stat-icon red"><span
                                                        class="material-symbols-outlined">warning</span></div>
                                                <div>
                                                    <p class="mp-stat-label">Overdue Items</p>
                                                    <p class="mp-stat-value" style="color:var(--mp-red-600);">
                                                        <%= overdueCount %>
                                                    </p>
                                                </div>
                                            </a>
                                            <a href="Portal?action=fines" class="mp-stat-card">
                                                <div class="mp-stat-icon green"><span
                                                        class="material-symbols-outlined">payments</span></div>
                                                <div>
                                                    <p class="mp-stat-label">Fines Balance</p>
                                                    <p class="mp-stat-value" style="color:var(--mp-gray-900);">
                                                        $<%= String.format("%.2f", finesBalance) %>
                                                    </p>
                                                </div>
                                            </a>
                                        </div>

                                        <!-- Book Catalog (Recommended for You) -->
                                        <section class="mp-mb-12">
                                            <div class="mp-section-header">
                                                <div>
                                                    <h2 class="mp-section-title">
                                                        <span class="material-symbols-outlined"
                                                            style="color:var(--mp-primary)">auto_awesome</span>
                                                        Recommended for You
                                                    </h2>
                                                    <p class="mp-section-sub">Based on your recent borrowing history</p>
                                                </div>
                                                <a href="#" class="mp-view-all">
                                                    View all <span
                                                        class="material-symbols-outlined">arrow_forward</span>
                                                </a>
                                            </div>

                                            <% if (listBooks !=null && !listBooks.isEmpty()) { %>
                                                <div class="mp-book-grid">
                                                    <% int count=0; for (Book book : listBooks) { if (count>= 5) break;
                                                        count++; %>
                                                        <a href="Portal?action=bookDetail&id=<%= book.getBook_id() %>"
                                                            class="mp-book-card">
                                                            <div class="mp-book-cover">
                                                                <% if (book.getCover_image() !=null &&
                                                                    !book.getCover_image().isEmpty()) { %>
                                                                    <img src="<%= book.getCover_image() %>"
                                                                        alt="<%= book.getTitle() %>">
                                                                    <% } else { %>
                                                                        <span class="material-symbols-outlined"
                                                                            style="font-size:48px;color:var(--mp-gray-400);">menu_book</span>
                                                                        <% } %>
                                                                            <div class="mp-book-overlay">
                                                                                <button type="button"
                                                                                    class="mp-btn-view"
                                                                                    title="View Details">
                                                                                    <span
                                                                                        class="material-symbols-outlined">visibility</span>
                                                                                </button>
                                                                                <button type="button"
                                                                                    class="mp-btn-hold"
                                                                                    title="Place Hold"
                                                                                    onclick="event.preventDefault();event.stopPropagation();window.location.href='Portal?action=requestBook&book_id=<%= book.getBook_id() %>'">
                                                                                    <span
                                                                                        class="material-symbols-outlined">bookmark_add</span>
                                                                                </button>
                                                                            </div>
                                                            </div>
                                                            <h3 class="mp-book-title">
                                                                <%= book.getTitle() %>
                                                            </h3>
                                                            <p class="mp-book-author">
                                                                <%= book.getAuthor() %>
                                                            </p>
                                                        </a>
                                                        <% } %>
                                                </div>
                                                <% } else { %>
                                                    <div class="mp-card" style="padding:48px;text-align:center;">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size:48px;color:var(--mp-gray-300);">search_off</span>
                                                        <p style="margin-top:12px;color:var(--mp-gray-500);">No
                                                            recommendations available.</p>
                                                    </div>
                                                    <% } %>
                                        </section>

                                        <!-- New Arrivals -->
                                        <div class="mp-home-secondary">
                                            <section class="mp-card" style="padding:24px;">
                                                <div class="mp-section-header">
                                                    <h2 class="mp-section-title" style="font-size:1.25rem;">
                                                        <span class="material-symbols-outlined"
                                                            style="color:var(--mp-primary)">new_releases</span>
                                                        New Arrivals
                                                    </h2>
                                                    <a href="#" class="mp-view-all" style="font-size:0.875rem;">View
                                                        all</a>
                                                </div>

                                                <div class="mp-arrivals-list">
                                                    <% int arrivalsCount=0; if (listBooks !=null) { for (int
                                                        i=listBooks.size() - 1; i>= 0 && arrivalsCount < 3; i--) { Book
                                                            b=listBooks.get(i); arrivalsCount++; %>
                                                            <a href="Portal?action=bookDetail&id=<%= b.getBook_id() %>"
                                                                class="mp-arrival-item">
                                                                <div class="mp-arrival-thumb">
                                                                    <% if (b.getCover_image() !=null &&
                                                                        !b.getCover_image().isEmpty()) { %>
                                                                        <img src="<%= b.getCover_image() %>"
                                                                            alt="<%= b.getTitle() %>">
                                                                        <% } else { %>
                                                                            <div
                                                                                style="width:100%;height:100%;display:flex;align-items:center;justify-content:center;background:var(--mp-gray-100);">
                                                                                <span class="material-symbols-outlined"
                                                                                    style="font-size:32px;color:var(--mp-gray-300);">menu_book</span>
                                                                            </div>
                                                                            <% } %>
                                                                </div>
                                                                <div class="mp-arrival-info">
                                                                    <h3 class="mp-arrival-title">
                                                                        <%= b.getTitle() %>
                                                                    </h3>
                                                                    <span class="mp-arrival-author">
                                                                        <%= b.getAuthor() %>
                                                                    </span>
                                                                    <div class="mp-arrival-meta">
                                                                        <span
                                                                            class="mp-badge-arrival available">Available</span>
                                                                        <span
                                                                            style="font-size:0.75rem;color:var(--mp-gray-400);">Added
                                                                            recently</span>
                                                                    </div>
                                                                </div>
                                                                <div class="mp-arrival-action">
                                                                    <span
                                                                        class="material-symbols-outlined">bookmark_add</span>
                                                                </div>
                                                            </a>
                                                            <% } } %>
                                                </div>
                                            </section>
                                        </div>
                                    </main>
                                </body>

                                </html>
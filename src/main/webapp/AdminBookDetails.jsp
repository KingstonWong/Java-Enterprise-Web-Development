<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, Models.Book, Models.ReviewDTO" %>
<% 
    Book book = (Book) request.getAttribute("book");
    List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
    double avgRating = 0;
    if (reviews != null && !reviews.isEmpty()) {
        avgRating = reviews.stream().mapToInt(ReviewDTO::getRating).average().orElse(0);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= book != null ? book.getTitle() : "Book Details" %> - Admin View</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="member-portal.css">
    <style>
        .admin-back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background: #f1f5f9;
            color: #475569;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            margin-bottom: 24px;
            transition: all 0.2s;
        }
        .admin-back-btn:hover {
            background: #e2e8f0;
            color: #1e293b;
        }
    </style>
</head>
<body class="mp-page">
    <main class="mp-container" style="padding-top: 40px;">
        <a href="Books?action=list" class="admin-back-btn">
            <span class="material-symbols-outlined">arrow_back</span>
            Back to Inventory
        </a>

        <% if (book != null) { %>
            <div class="mp-card" style="margin-bottom:32px;">
                <div class="mp-book-detail">
                    <!-- Sidebar -->
                    <aside class="mp-book-detail-sidebar">
                        <div class="mp-book-detail-cover">
                            <% if (book.getCover_image() != null && !book.getCover_image().isEmpty()) { %>
                                <img src="<%= book.getCover_image() %>" alt="<%= book.getTitle() %>">
                            <% } else { %>
                                <div style="width:100%;height:100%;display:flex;align-items:center;justify-content:center;background:var(--mp-gray-100);">
                                    <span class="material-symbols-outlined" style="font-size:64px;color:var(--mp-gray-300);">menu_book</span>
                                </div>
                            <% } %>
                        </div>

                        <!-- Availability (Admin View) -->
                        <div class="mp-availability" style="margin-top: 24px;">
                            <h4>Inventory Status</h4>
                            <div class="mp-avail-row">
                                <span class="branch">Available Copies</span>
                                <span class="mp-badge <%= book.getAvailable_copies() > 0 ? "mp-badge-green" : "mp-badge-red" %>">
                                    <%= book.getAvailable_copies() %> / <%= book.getTotal_copies() %>
                                </span>
                            </div>
                            <div class="mp-avail-row" style="margin-top: 8px;">
                                <span class="branch">Location</span>
                                <span style="font-weight: 600; color: var(--mp-gray-700);">
                                    <%= book.getLocation() != null ? book.getLocation() : "Main Library" %>
                                </span>
                            </div>
                        </div>
                    </aside>

                    <!-- Main Content -->
                    <div class="mp-book-detail-main">
                        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 8px;">
                            <h1><%= book.getTitle() %></h1>
                            <div class="mp-rating-badge">
                                <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1;">star</span>
                                <span class="score"><%= String.format("%.1f", avgRating) %></span>
                                <span class="count">(<%= reviews != null ? reviews.size() : 0 %>)</span>
                            </div>
                        </div>
                        <p class="mp-book-detail-author">by <span style="color: var(--mp-blue-600); font-weight: 500;"><%= book.getAuthor() %></span></p>

                        <div class="mp-book-tags">
                            <span class="mp-book-tag"><%= book.getCategory() %></span>
                        </div>

                        <div class="mp-book-meta-grid">
                            <div><span class="mp-book-meta-label">ISBN</span><span class="mp-book-meta-value"><%= book.getIsbn() %></span></div>
                            <div><span class="mp-book-meta-label">Publisher</span><span class="mp-book-meta-value"><%= book.getPublisher() != null ? book.getPublisher() : "N/A" %></span></div>
                            <div><span class="mp-book-meta-label">Published</span><span class="mp-book-meta-value"><%= book.getPublication_year() %></span></div>
                            <div><span class="mp-book-meta-label">Total Copies</span><span class="mp-book-meta-value"><%= book.getTotal_copies() %></span></div>
                        </div>

                        <div class="mp-synopsis">
                            <h3>Synopsis</h3>
                            <p><%= book.getDescription() != null ? book.getDescription() : "No description available." %></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Reviews Section -->
            <div class="mp-card">
                <div class="mp-card-header">
                    <h2>Member Reviews (<%= reviews != null ? reviews.size() : 0 %>)</h2>
                </div>

                <div class="mp-card-body">
                    <% if (reviews != null && !reviews.isEmpty()) { 
                        for (ReviewDTO r : reviews) {
                            String initials = r.getMemberName() != null ? r.getMemberName().substring(0, 1).toUpperCase() : "?";
                            String[] bgColors = {"#dbeafe", "#fce7f3", "#d1fae5", "#fef3c7", "#e0e7ff"};
                            String bg = bgColors[Math.abs(r.getMemberName() != null ? r.getMemberName().hashCode() : 0) % bgColors.length];
                    %>
                        <div class="mp-review">
                            <div class="mp-review-header">
                                <div class="mp-reviewer">
                                    <div class="mp-reviewer-avatar" style="background:<%= bg %>;">
                                        <%= initials %>
                                    </div>
                                    <div>
                                        <div class="mp-reviewer-name"><%= r.getMemberName() %></div>
                                        <div class="mp-reviewer-date"><%= r.getCreated_at() != null ? r.getCreated_at() : "" %></div>
                                    </div>
                                </div>
                                <div class="mp-stars">
                                    <% for (int i = 1; i <= 5; i++) { %>
                                        <span class='material-symbols-outlined <%= i <= r.getRating() ? "" : "empty" %>' style='<%= i <= r.getRating() ? "font-variation-settings:\"FILL\" 1;" : "" %>'>star</span>
                                    <% } %>
                                </div>
                            </div>
                            <p><%= r.getComment() != null ? r.getComment() : "" %></p>
                        </div>
                    <% } } else { %>
                        <div style="text-align:center;padding:32px;color:var(--mp-gray-500);">
                            <span class="material-symbols-outlined" style="font-size:48px;color:var(--mp-gray-300);">rate_review</span>
                            <p style="margin-top:12px;">No reviews yet for this book.</p>
                        </div>
                    <% } %>
                </div>
            </div>
        <% } else { %>
            <div class="mp-card" style="padding:48px;text-align:center;">
                <span class="material-symbols-outlined" style="font-size:48px;color:var(--mp-gray-300);">error</span>
                <p style="margin-top:12px;color:var(--mp-gray-500);">Book not found.</p>
            </div>
        <% } %>
    </main>
</body>
</html>

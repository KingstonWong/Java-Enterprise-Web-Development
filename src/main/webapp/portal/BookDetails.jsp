<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, Models.Book, Models.ReviewDTO, Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); Book book=(Book) request.getAttribute("book");
            List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
                double avgRating = 0;
                if (reviews != null && !reviews.isEmpty()) {
                avgRating = reviews.stream().mapToInt(ReviewDTO::getRating).average().orElse(0);
                }
                String alertMsg = (String) session.getAttribute("alertMessage");
                if (alertMsg != null) {
                session.removeAttribute("alertMessage");
                session.removeAttribute("alertType");
                }
                %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>
                        <%= book !=null ? book.getTitle() : "Book Details" %> - Library Portal
                    </title>
                    <link rel="stylesheet"
                        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                    <link rel="stylesheet" href="member-portal.css">
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <% String reviewSuccess=(String) request.getAttribute("reviewSuccess"); if
                        ("true".equals(reviewSuccess)) { %>
                        <script>
                            window.onload = function () {
                                Swal.fire({
                                    title: 'Review Posted!',
                                    text: 'Thank you for sharing your thoughts with the community.',
                                    icon: 'success',
                                    confirmButtonColor: '#137fec'
                                }).then(() => {
                                    // Remove the parameter from URL without refreshing
                                    const url = new URL(window.location);
                                    url.searchParams.delete('reviewSuccess');
                                    window.history.replaceState({}, '', url);
                                });
                            };
                        </script>
                        <% } %>
                </head>

                <body class="mp-page">
                    <jsp:include page="MemberHeader.jsp" />
                    <main class="mp-container">
                        <% if (alertMsg !=null) { %>
                            <div
                                style="background:var(--mp-green-50);border:1px solid var(--mp-green-200);color:var(--mp-green-700);padding:12px 16px;border-radius:8px;margin-bottom:16px;font-size:0.875rem;display:flex;align-items:center;gap:8px;">
                                <span class="material-symbols-outlined" style="font-size:18px;">check_circle</span>
                                <%= alertMsg %>
                            </div>
                            <% } %>

                                <ol class="mp-breadcrumb">
                                    <li><a href="Portal?action=home"><span class="material-symbols-outlined">home</span>
                                            Home</a></li>
                                    <li><span class="material-symbols-outlined">chevron_right</span></li>
                                    <li><span class="current">
                                            <%= book !=null ? book.getTitle() : "Book Details" %>
                                        </span></li>
                                </ol>

                                <% if (book !=null) { %>
                                    <div class="mp-card" style="margin-bottom:32px;">
                                        <div class="mp-book-detail">
                                            <!-- Sidebar -->
                                            <aside class="mp-book-detail-sidebar">
                                                <div class="mp-book-detail-cover">
                                                    <% if (book.getCover_image() !=null &&
                                                        !book.getCover_image().isEmpty()) { %>
                                                        <img src="<%= book.getCover_image() %>"
                                                            alt="<%= book.getTitle() %>">
                                                        <% } else { %>
                                                            <div
                                                                style="width:100%;height:100%;display:flex;align-items:center;justify-content:center;background:var(--mp-gray-100);">
                                                                <span class="material-symbols-outlined"
                                                                    style="font-size:64px;color:var(--mp-gray-300);">menu_book</span>
                                                            </div>
                                                            <% } %>
                                                </div>

                                                <a href="Portal?action=requestBook&book_id=<%= book.getBook_id() %>"
                                                    class="mp-btn mp-btn-primary mp-btn-lg" style="margin-bottom:24px;">
                                                    <span class="material-symbols-outlined">bookmark_add</span> Place
                                                    Hold
                                                </a>

                                                <!-- Availability -->
                                                <div class="mp-availability">
                                                    <h4>Availability</h4>
                                                    <div class="mp-avail-row">
                                                        <span class="branch">
                                                            <%= book.getLocation() !=null ? book.getLocation()
                                                                : "Main Library" %>
                                                        </span>
                                                        <span
                                                            class='mp-badge <%= book.getAvailable_copies() > 0 ? "mp-badge-green" : "mp-badge-red" %>'>
                                                            <%= book.getAvailable_copies()> 0 ? "Available (" +
                                                                book.getAvailable_copies() + ")" : "Waitlist" %>
                                                        </span>
                                                    </div>
                                                </div>
                                            </aside>

                                            <!-- Main Content -->
                                            <div class="mp-book-detail-main">
                                                <div
                                                    style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 8px;">
                                                    <h1>
                                                        <%= book.getTitle() %>
                                                    </h1>
                                                    <div class="mp-rating-badge">
                                                        <span class="material-symbols-outlined"
                                                            style="font-variation-settings:'FILL' 1;">star</span>
                                                        <span class="score">
                                                            <%= String.format("%.1f", avgRating) %>
                                                        </span>
                                                        <span class="count">(<%= reviews !=null ? reviews.size() : 0 %>
                                                                )</span>
                                                    </div>
                                                </div>
                                                <p class="mp-book-detail-author">by <a href="#">
                                                        <%= book.getAuthor() %>
                                                    </a></p>

                                                <div class="mp-book-tags">
                                                    <span class="mp-book-tag">
                                                        <%= book.getCategory() %>
                                                    </span>
                                                </div>

                                                <div class="mp-book-meta-grid">
                                                    <div><span class="mp-book-meta-label">ISBN</span><span
                                                            class="mp-book-meta-value">
                                                            <%= book.getIsbn() %>
                                                        </span></div>
                                                    <div><span class="mp-book-meta-label">Publisher</span><span
                                                            class="mp-book-meta-value">
                                                            <%= book.getPublisher() !=null ? book.getPublisher() : "N/A"
                                                                %>
                                                        </span></div>
                                                    <div><span class="mp-book-meta-label">Published</span><span
                                                            class="mp-book-meta-value">
                                                            <%= book.getPublication_year() %>
                                                        </span></div>
                                                    <div><span class="mp-book-meta-label">Total Copies</span><span
                                                            class="mp-book-meta-value">
                                                            <%= book.getTotal_copies() %>
                                                        </span></div>
                                                </div>

                                                <div class="mp-synopsis">
                                                    <h3>Synopsis</h3>
                                                    <p>
                                                        <%= book.getDescription() !=null ? book.getDescription()
                                                            : "No description available." %>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Reviews Section -->
                                    <div class="mp-card">
                                        <div class="mp-card-header">
                                            <h2>Member Reviews (<%= reviews !=null ? reviews.size() : 0 %>)</h2>
                                            <a href="Portal?action=writeReview&book_id=<%= book.getBook_id() %>"
                                                class="mp-btn mp-btn-primary">
                                                <span class="material-symbols-outlined">rate_review</span> Write a
                                                Review
                                            </a>
                                        </div>

                                        <div class="mp-card-body">
                                            <% if (reviews !=null && !reviews.isEmpty()) { for (ReviewDTO r : reviews) {
                                                String initials=r.getMemberName() !=null ?
                                                r.getMemberName().substring(0, 1).toUpperCase() : "?" ; String[]
                                                bgColors={"#dbeafe", "#fce7f3" , "#d1fae5" , "#fef3c7" , "#e0e7ff" };
                                                String bg=bgColors[Math.abs(r.getMemberName() !=null ?
                                                r.getMemberName().hashCode() : 0) % bgColors.length]; %>
                                                <div class="mp-review">
                                                    <div class="mp-review-header">
                                                        <div class="mp-reviewer">
                                                            <div class="mp-reviewer-avatar"
                                                                style="background:<%= bg %>;">
                                                                <%= initials %>
                                                            </div>
                                                            <div>
                                                                <div class="mp-reviewer-name">
                                                                    <%= r.getMemberName() %>
                                                                </div>
                                                                <div class="mp-reviewer-date">
                                                                    <%= r.getCreated_at() !=null ? r.getCreated_at()
                                                                        : "" %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mp-stars">
                                                            <% for (int i=1; i <=5; i++) { %>
                                                                <span
                                                                    class='material-symbols-outlined <%= i <= r.getRating() ? "" : "empty" %>'
                                                                    style='<%= i <= r.getRating() ? "font-variation-settings:\"FILL\" 1;" : "" %>'>star</span>
                                                                <% } %>
                                                        </div>
                                                    </div>
                                                    <p>
                                                        <%= r.getComment() !=null ? r.getComment() : "" %>
                                                    </p>
                                                </div>
                                                <% } } else { %>
                                                    <div
                                                        style="text-align:center;padding:32px;color:var(--mp-gray-500);">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size:48px;color:var(--mp-gray-300);">rate_review</span>
                                                        <p style="margin-top:12px;">No reviews yet. Be the first to
                                                            review!</p>
                                                    </div>
                                                    <% } %>
                                        </div>
                                    </div>
                                    <% } else { %>
                                        <div class="mp-card" style="padding:48px;text-align:center;">
                                            <span class="material-symbols-outlined"
                                                style="font-size:48px;color:var(--mp-gray-300);">error</span>
                                            <p style="margin-top:12px;color:var(--mp-gray-500);">Book not found.</p>
                                        </div>
                                        <% } %>
                    </main>
                </body>

                </html>
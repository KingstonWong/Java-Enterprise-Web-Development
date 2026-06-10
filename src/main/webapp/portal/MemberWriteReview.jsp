<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="Models.Book, Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); Book book=(Book) request.getAttribute("book"); int
            bookId=0; if (request.getAttribute("book_id") !=null) {
            bookId=Integer.parseInt(request.getAttribute("book_id").toString()); } if (book !=null)
            bookId=book.getBook_id(); String error=(String) request.getAttribute("error"); boolean hasReviewed=false; if
            (request.getAttribute("hasReviewed") !=null) { hasReviewed=(boolean) request.getAttribute("hasReviewed"); }
            %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Write a Review - Library Portal</title>
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                <link rel="stylesheet" href="member-portal.css">
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <% String reviewSuccess=request.getParameter("reviewSuccess"); if ("true".equals(reviewSuccess)) { %>
                    <script>
                        window.onload = function () {
                            Swal.fire({
                                title: 'Success!',
                                text: 'Your review has been posted successfully.',
                                icon: 'success',
                                confirmButtonColor: '#137fec'
                            }).then((result) => {
                                window.location.href = 'Portal?action=bookDetail&id=<%= bookId %>';
                            });
                        };
                    </script>
                    <% } %>
            </head>

            <body class="mp-review-page">
                <main class="mp-review-card">
                    <div class="mp-review-card-header mp-review-header-gradient">
                        <div style="display: flex; align-items: center; gap: 12px;">
                            <span class="material-symbols-outlined" style="font-size: 28px;">rate_review</span>
                            <h1
                                style="font-size: 1.5rem; font-weight: 700; color: white; margin: 0; letter-spacing: -0.025em;">
                                Write your review</h1>
                        </div>
                        <a href="Portal?action=bookDetail&id=<%= bookId %>"
                            style="color: white; opacity: 0.8; height: 32px; width: 32px; display: flex; align-items: center; justify-content: center; border-radius: 50%; background: rgba(255,255,255,0.1); transition: all 0.2s;"
                            onmouseover="this.style.background='rgba(255,255,255,0.2)'"
                            onmouseout="this.style.background='rgba(255,255,255,0.1)'">
                            <span class="material-symbols-outlined" style="font-size: 20px;">close</span>
                        </a>
                    </div>

                    <div class="mp-review-card-body">
                        <% if (hasReviewed) { %>
                            <div class="mp-badge mp-badge-red"
                                style="width: 100%; box-sizing: border-box; justify-content: flex-start; margin-bottom: 24px; padding: 16px; border-radius: 12px; border: 1px solid #fee2e2;">
                                <span class="material-symbols-outlined"
                                    style="margin-right: 12px; font-size: 24px;">info</span>
                                <div style="display: flex; flex-direction: column;">
                                    <span style="font-weight: 800; font-size: 0.9375rem;">Already Reviewed</span>
                                    <span style="font-weight: 500; font-size: 0.8125rem; opacity: 0.9;">You can't review
                                        this book because you have already done it.</span>
                                </div>
                            </div>
                            <% } else if (error !=null) { %>
                                <div class="mp-badge mp-badge-red"
                                    style="width: 100%; justify-content: flex-start; margin-bottom: 24px; padding: 12px 16px; border-radius: 12px;">
                                    <span class="material-symbols-outlined" style="margin-right: 8px;">error</span>
                                    <%= error %>
                                </div>
                                <% } %>

                                    <form action="Reviews" method="post" id="reviewForm" class="mp-form-stack">
                                        <input type="hidden" name="book_id" value="<%= bookId %>">
                                        <input type="hidden" name="rating" id="ratingInput" value="0">

                                        <% if (book !=null) { %>
                                            <div class="mp-review-book-info">
                                                <div class="mp-review-book-cover">
                                                    <% if (book.getCover_image() !=null &&
                                                        !book.getCover_image().isEmpty()) { %>
                                                        <img src="<%= book.getCover_image() %>"
                                                            alt="<%= book.getTitle() %>">
                                                        <% } else { %>
                                                            <div
                                                                style="width:100%; height:100%; display:flex; align-items:center; justify-content:center;">
                                                                <span class="material-symbols-outlined"
                                                                    style="color:var(--mp-gray-400); font-size: 32px;">book</span>
                                                            </div>
                                                            <% } %>
                                                </div>
                                                <div
                                                    style="display: flex; flex-direction: column; justify-content: center;">
                                                    <h2
                                                        style="font-size: 1.25rem; font-weight: 800; color: var(--mp-gray-900); margin: 0; line-height: 1.2;">
                                                        <%= book.getTitle() %>
                                                    </h2>
                                                    <p
                                                        style="color: var(--mp-gray-500); margin: 4px 0 12px; font-size: 0.9375rem; font-weight: 500;">
                                                        by <span style="color: var(--mp-gray-700)">
                                                            <%= book.getAuthor() %>
                                                        </span>
                                                    </p>
                                                    <div
                                                        style="display: flex; align-items: center; gap: 6px; background: var(--mp-gray-50); padding: 4px 12px; border-radius: 999px; width: fit-content;">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size: 14px; color: var(--mp-primary);">category</span>
                                                        <span
                                                            style="font-size: 0.75rem; font-weight: 700; color: var(--mp-primary); text-transform: uppercase; letter-spacing: 0.05em;">
                                                            <%= book.getCategory() %>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>

                                                <div style="margin-bottom: 32px;">
                                                    <label class="mp-form-label"
                                                        style="font-size: 1rem; margin-bottom: 4px;">Overall
                                                        Rating</label>
                                                    <p
                                                        style="font-size: 0.8125rem; color: var(--mp-gray-400); margin-bottom: 16px;">
                                                        How would you rate your experience with this book?</p>
                                                    <div class="mp-star-rating" id="starRating">
                                                        <% for (int i=1; i <=5; i++) { %>
                                                            <button type="button" class="mp-star-btn"
                                                                data-star="<%= i %>" <%=hasReviewed
                                                                ? "disabled style='cursor: default; opacity: 0.5;'" : ""
                                                                %>>
                                                                <span class="material-symbols-outlined"
                                                                    id="star<%= i %>"
                                                                    style="font-size: 40px;">star</span>
                                                            </button>
                                                            <% } %>
                                                    </div>
                                                    <p id="ratingText"
                                                        style="margin-top: 8px; font-size: 0.875rem; color: var(--mp-primary); font-weight: 700; min-height: 20px;">
                                                        Click to rate</p>
                                                </div>

                                                <div style="margin-bottom: 32px;">
                                                    <label class="mp-form-label"
                                                        style="font-size: 1rem; margin-bottom: 4px;">Your Review</label>
                                                    <p
                                                        style="font-size: 0.8125rem; color: var(--mp-gray-400); margin-bottom: 12px;">
                                                        What did you like or dislike? What should other readers know?
                                                    </p>
                                                    <textarea name="comment" id="comment" rows="6"
                                                        class="mp-form-control" placeholder="Write your review here..."
                                                        style="resize:vertical; min-height: 140px; padding: 16px;"
                                                        <%=hasReviewed ? "disabled" : "" %>
                                                    required></textarea>
                                                    <div
                                                        style="display: flex; justify-content: space-between; align-items: center; margin-top: 12px;">
                                                        <span
                                                            style="font-size:0.75rem; color:var(--mp-gray-400); display: flex; align-items: center; gap: 4px;">
                                                            <span class="material-symbols-outlined"
                                                                style="font-size: 14px;">info</span>
                                                            Share your experience
                                                        </span>
                                                        <span
                                                            style="font-size:0.75rem; color:var(--mp-gray-400); font-weight: 500;"
                                                            id="charCount">0 / 2000</span>
                                                    </div>
                                                </div>

                                                <div
                                                    style="display: flex; justify-content: flex-end; align-items: center; gap: 16px; padding-top: 32px; border-top: 1px solid var(--mp-gray-100);">
                                                    <a href="Portal?action=bookDetail&id=<%= bookId %>"
                                                        style="font-size: 0.9375rem; font-weight: 700; color: var(--mp-gray-500); text-decoration: none; padding: 10px 20px; border-radius: 12px; transition: all 0.2s;"
                                                        onmouseover="this.style.color='var(--mp-gray-900)'; this.style.background='var(--mp-gray-50)'"
                                                        onmouseout="this.style.color='var(--mp-gray-500)'; this.style.background='transparent'">
                                                        Cancel
                                                    </a>
                                                    <button type="submit" class="mp-btn mp-btn-primary" id="submitBtn"
                                                        <% if (hasReviewed) { %>
                                                        disabled style="background: var(--mp-gray-300); border-color:
                                                        var(--mp-gray-300); cursor: not-allowed; opacity: 0.7;
                                                        box-shadow: none;"
                                                        <% } else { %>
                                                            style="padding: 12px 32px; border-radius: 12px; font-weight:
                                                            700; display: flex; align-items: center; gap: 8px;
                                                            box-shadow: 0 4px 12px rgba(19, 127, 236, 0.25);"
                                                            <% } %>>
                                                                Submit Review <span class="material-symbols-outlined"
                                                                    style="font-size: 18px;">send</span>
                                                    </button>
                                                </div>
                                    </form>
                    </div>
                </main>

                <div style="text-align: center; margin-top: 32px; padding-bottom: 40px;">
                    <p
                        style="font-size: 0.8125rem; color: var(--mp-gray-400); display: inline-flex; align-items: center; gap: 6px; background: white; padding: 8px 16px; border-radius: 999px; border: 1px solid var(--mp-gray-100);">
                        <span class="material-symbols-outlined"
                            style="font-size: 16px; color: var(--mp-primary);">verified_user</span>
                        Reviews are public and must follow our community guidelines.
                    </p>
                </div>


                <script>
                    var currentRating = 0;
                    var labels = ['', 'Poor', 'Fair', 'Good', 'Very Good', 'Excellent'];

                    const starContainer = document.getElementById('starRating');

                    starContainer.addEventListener('click', function (e) {
                        const btn = e.target.closest('.mp-star-btn');
                        if (btn) {
                            const starValue = parseInt(btn.dataset.star);
                            currentRating = starValue;
                            document.getElementById('ratingInput').value = starValue;
                            updateStars(starValue);
                            validateForm();
                        }
                    });

                    starContainer.addEventListener('mouseover', function (e) {
                        const btn = e.target.closest('.mp-star-btn');
                        if (btn) {
                            const starValue = parseInt(btn.dataset.star);
                            updateStars(starValue);
                            document.getElementById('ratingText').textContent = labels[starValue];
                        }
                    });

                    starContainer.addEventListener('mouseleave', function () {
                        updateStars(currentRating);
                        document.getElementById('ratingText').textContent = currentRating > 0 ? labels[currentRating] : 'Click to rate';
                    });

                    function updateStars(rating) {
                        for (var i = 1; i <= 5; i++) {
                            const icon = document.getElementById('star' + i);
                            const btn = icon.parentElement;
                            if (i <= rating) {
                                btn.classList.add('active');
                            } else {
                                btn.classList.remove('active');
                            }
                        }
                    }

                    const comment = document.getElementById('comment');
                    const submitBtn = document.getElementById('submitBtn');

                    function validateForm() {
                        const count = comment.value.length;
                        document.getElementById('charCount').textContent = count + ' / 2000';
                        
                        // Just update the count UI, don't silently disable the button
                        // unless the user has already reviewed (handled by JSP logic)
                    }

                    comment.addEventListener('input', validateForm);

                    document.getElementById('reviewForm').addEventListener('submit', function(e) {
                        if (currentRating === 0) {
                            e.preventDefault();
                            Swal.fire({
                                title: 'Rating Required',
                                text: 'Please select a star rating for this book.',
                                icon: 'warning',
                                confirmButtonColor: '#137fec'
                            });
                            return false;
                        }

                        if (comment.value.trim().length === 0) {
                            e.preventDefault();
                            Swal.fire({
                                title: 'Review Required',
                                text: 'Please write a brief review before submitting.',
                                icon: 'warning',
                                confirmButtonColor: '#137fec'
                            });
                            return false;
                        }

                        // If already reviewed (sanity check)
                        <% if (hasReviewed) { %>
                            e.preventDefault();
                            return false;
                        <% } %>
                    });

                    // Initial validation
                    validateForm();
                </script>
            </body>

            </html>
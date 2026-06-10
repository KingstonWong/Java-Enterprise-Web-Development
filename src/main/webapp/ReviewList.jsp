<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.ReviewDTO" %>

            <% List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
                    if (reviews != null && !reviews.isEmpty()) {
                    for (ReviewDTO review : reviews) {
                    %>
                    <div class="review-card" style="padding: 24px; border-bottom: 1px solid #f1f5f9;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                            <div style="font-weight: 700; color: #1c1e21;">
                                <%= review.getMemberName() %>
                            </div>
                            <div style="color: #fbbf24;">
                                <% for(int i=0; i<review.getRating(); i++) { %>★<% } %>
                            </div>
                        </div>
                        <p style="color: #4b5563; line-height: 1.6; margin: 0;">
                            <%= review.getComment() %>
                        </p>
                        <div style="font-size: 0.75rem; color: #94a3b8; margin-top: 12px;">Posted on <%=
                                review.getCreated_at() %>
                        </div>
                    </div>
                    <% } } else { %>
                        <div style="padding: 40px; text-align: center; color: #65676b;">
                            <span class="material-symbols-outlined"
                                style="font-size: 48px; color: #cbd5e1; margin-bottom: 12px;">chat_bubble_outline</span>
                            <p>No reviews yet for this book. Be the first to share your thoughts!</p>
                        </div>
                        <% } %>
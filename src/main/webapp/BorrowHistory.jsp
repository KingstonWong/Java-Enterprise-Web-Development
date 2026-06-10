<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.BorrowRecordDTO" %>
            <jsp:include page="Layout/header.jsp" />

            <div class="page-header" style="margin-bottom: 32px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">My Loan History</h1>
                    <p style="color: #65676b; font-size: 1.125rem;">Review all your past and current book borrowings.
                    </p>
                </div>
            </div>

            <div class="card"
                style="border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.06); border-radius: 20px; overflow: hidden; background: white;">
                <table class="data-table" style="border-collapse: separate; border-spacing: 0;">
                    <thead>
                        <tr style="background: #f8fafc;">
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                BOOK</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                REQUEST DATE</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                RETURN DATE</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                STATUS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<BorrowRecordDTO> history = (List<BorrowRecordDTO>) request.getAttribute("history");
                                if (history != null && !history.isEmpty()) {
                                for (BorrowRecordDTO record : history) {
                                %>
                                <tr style="transition: all 0.2s;" onmouseover="this.style.background='#f1f5f9'"
                                    onmouseout="this.style.background='white'">
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                        <div style="font-weight: 700; color: #1c1e21;">
                                            <%= record.getBook_title() %>
                                        </div>
                                        <div style="font-size: 0.875rem; color: #65676b;">ID: <%= record.getBook_id() %>
                                        </div>
                                    </td>
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                        <%= record.getRequest_date() %>
                                    </td>
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                        <%= record.getReturn_date() !=null ? record.getReturn_date() : "---" %>
                                    </td>
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                        <% String status=record.getStatus(); String
                                            badgeStyle="background: #f1f5f9; color: #475569;" ; if
                                            ("APPROVED".equalsIgnoreCase(status))
                                            badgeStyle="background: #e0f2fe; color: #0369a1;" ; else if
                                            ("RETURNED".equalsIgnoreCase(status))
                                            badgeStyle="background: #f0fdf4; color: #15803d;" ; else if
                                            ("BORROWED".equalsIgnoreCase(status))
                                            badgeStyle="background: #e0f2fe; color: #0369a1;" ; else if
                                            ("PENDING".equalsIgnoreCase(status))
                                            badgeStyle="background: #fefce8; color: #a16207;" ; %>
                                            <span
                                                style="<%= badgeStyle %> padding: 4px 12px; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase;">
                                                <%= status %>
                                            </span>
                                    </td>
                                </tr>
                                <% } } else { %>
                                    <tr>
                                        <td colspan="4" style="text-align: center; padding: 60px; color: #65676b;">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 48px; color: #cbd5e1;">history</span>
                                            <p style="margin-top: 16px;">You haven't borrowed any books yet.</p>
                                        </td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

            <jsp:include page="Layout/footer.jsp" />
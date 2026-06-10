<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.BorrowRecordDTO" %>
        <%@ page import="Models.Member" %>
            <%@ page import="Models.Book" %>
                <% BorrowRecordDTO record=(BorrowRecordDTO) request.getAttribute("record"); Member member=(Member)
                    request.getAttribute("member"); Book book=(Book) request.getAttribute("book"); if (record==null) {
                    response.sendRedirect("Borrow?action=list"); return; } %>
                    <jsp:include page="Layout/header.jsp" />

                    <div style="padding: 32px; max-width: 800px; margin: 0 auto;">
                        <!-- Header -->
                        <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 24px;">
                            <a href="Borrow?action=list"
                                style="padding: 8px; color: #94a3b8; border-radius: 8px; transition: all 0.2s;"
                                onmouseover="this.style.color='#475569'; this.style.backgroundColor='#f1f5f9'"
                                onmouseout="this.style.color='#94a3b8'; this.style.backgroundColor='transparent'">
                                <span class="material-symbols-outlined">arrow_back</span>
                            </a>
                            <div>
                                <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a; margin: 0;">Confirm
                                    Pickup</h1>
                                <p style="color: #64748b; font-size: 0.875rem; margin: 4px 0 0 0;">Verify member details
                                    and confirm the book handover.</p>
                            </div>
                        </div>

                        <!-- Main Card -->
                        <div
                            style="background-color: white; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); overflow: hidden;">

                            <!-- Top Bar -->
                            <div style="padding: 24px; border-bottom: 1px solid #e2e8f0; background-color: #f8fafc;">
                                <div style="display: flex; align-items: center; justify-content: space-between;">
                                    <div style="display: flex; align-items: center; gap: 12px;">
                                        <div
                                            style="width: 40px; height: 40px; border-radius: 9999px; background-color: #dbeafe; color: #2563eb; display: flex; align-items: center; justify-content: center;">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 20px;">menu_book</span>
                                        </div>
                                        <div>
                                            <p
                                                style="font-size: 0.875rem; font-weight: 500; color: #64748b; margin: 0;">
                                                Request ID</p>
                                            <p
                                                style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin: 0;">
                                                REQ-<%= String.format("%04d", record.getBorrow_id()) %>
                                            </p>
                                        </div>
                                    </div>
                                    <span
                                        style="display: inline-flex; align-items: center; padding: 4px 12px; border-radius: 9999px; font-size: 0.875rem; font-weight: 500; background-color: #d1fae5; color: #047857;">
                                        Ready for Pickup
                                    </span>
                                </div>
                            </div>

                            <!-- Details Area -->
                            <div style="padding: 24px;">
                                <div style="display: flex; flex-direction: column; gap: 32px; margin-bottom: 24px;">
                                    <!-- Split columns conditionally if screen allows, but grid is safer here -->
                                    <div
                                        style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 32px;">

                                        <!-- Member Details -->
                                        <div style="display: flex; flex-direction: column; gap: 16px;">
                                            <h3
                                                style="font-size: 0.875rem; font-weight: 600; color: #0f172a; text-transform: uppercase; letter-spacing: 0.05em; display: flex; align-items: center; gap: 8px; margin: 0;">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 16px; color: #94a3b8;">person</span>
                                                Member Details
                                            </h3>
                                            <div
                                                style="display: flex; align-items: center; gap: 16px; padding: 16px; border-radius: 12px; border: 1px solid #f1f5f9; background-color: #f8fafc;">
                                                <div
                                                    style="width: 48px; height: 48px; border-radius: 9999px; background-color: #e2e8f0; display: flex; align-items: center; justify-content: center; color: #64748b;">
                                                    <span class="material-symbols-outlined">account_circle</span>
                                                </div>
                                                <div>
                                                    <p style="font-weight: 700; color: #0f172a; margin: 0;">
                                                        <%= record.getMember_name() %>
                                                    </p>
                                                    <p style="font-size: 0.875rem; color: #64748b; margin: 4px 0 0 0;">
                                                        Member ID: <%= record.getMember_id() %>
                                                    </p>
                                                    <% if (member !=null && member.getEmail() !=null &&
                                                        !member.getEmail().isEmpty()) { %>
                                                        <p
                                                            style="font-size: 0.75rem; color: #94a3b8; margin: 4px 0 0 0;">
                                                            <%= member.getEmail() %>
                                                        </p>
                                                        <% } %>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Book Details -->
                                        <div style="display: flex; flex-direction: column; gap: 16px;">
                                            <h3
                                                style="font-size: 0.875rem; font-weight: 600; color: #0f172a; text-transform: uppercase; letter-spacing: 0.05em; display: flex; align-items: center; gap: 8px; margin: 0;">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 16px; color: #94a3b8;">import_contacts</span>
                                                Book Details
                                            </h3>
                                            <div
                                                style="display: flex; align-items: flex-start; gap: 16px; padding: 16px; border-radius: 12px; border: 1px solid #f1f5f9; background-color: #f8fafc;">
                                                <div
                                                    style="width: 48px; height: 64px; border-radius: 4px; background-color: #e2e8f0; display: flex; align-items: center; justify-content: center; color: #64748b;">
                                                    <span class="material-symbols-outlined">auto_stories</span>
                                                </div>
                                                <div>
                                                    <p style="font-weight: 700; color: #0f172a; margin: 0;">
                                                        <%= record.getBook_title() %>
                                                    </p>
                                                    <% if (book !=null) { %>
                                                        <p
                                                            style="font-size: 0.875rem; color: #64748b; margin: 4px 0 0 0;">
                                                            <%= book.getAuthor() !=null ? book.getAuthor()
                                                                : "Unknown Author" %>
                                                        </p>
                                                        <p
                                                            style="font-size: 0.75rem; color: #94a3b8; font-family: monospace; margin: 4px 0 0 0;">
                                                            ISBN: <%= book.getIsbn() !=null ? book.getIsbn() : "N/A" %>
                                                        </p>
                                                        <% } %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Instructions Box -->
                                <div style="border-top: 1px solid #e2e8f0; padding-top: 24px;">
                                    <div
                                        style="background-color: #eff6ff; border: 1px solid #dbeafe; border-radius: 12px; padding: 16px; display: flex; align-items: flex-start; gap: 12px;">
                                        <span class="material-symbols-outlined"
                                            style="color: #2563eb; margin-top: 2px;">info</span>
                                        <div>
                                            <p
                                                style="font-size: 0.875rem; font-weight: 600; color: #0f172a; margin: 0;">
                                                Pickup Instructions</p>
                                            <p
                                                style="font-size: 0.875rem; color: #475569; margin: 4px 0 0 0; line-height: 1.5;">
                                                Please verify the member's identity using their library card or a valid
                                                ID before handing over the book. The loan period will start immediately
                                                upon confirmation.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Footer Actions -->
                            <div
                                style="padding: 24px; border-top: 1px solid #e2e8f0; background-color: #f8fafc; display: flex; align-items: center; justify-content: flex-end; gap: 12px;">
                                <a href="Borrow?action=list"
                                    style="padding: 10px 20px; font-size: 0.875rem; font-weight: 600; color: #334155; background-color: white; border: 1px solid #cbd5e1; border-radius: 8px; text-decoration: none; transition: all 0.2s;"
                                    onmouseover="this.style.backgroundColor='#f1f5f9'"
                                    onmouseout="this.style.backgroundColor='white'">
                                    Cancel
                                </a>

                                <form action="Borrow" method="get" style="margin: 0;">
                                    <input type="hidden" name="action" value="pickup">
                                    <input type="hidden" name="id" value="<%= record.getBorrow_id() %>">
                                    <button type="submit"
                                        style="padding: 10px 20px; font-size: 0.875rem; font-weight: 600; color: white; background-color: #2563eb; border: none; border-radius: 8px; display: flex; align-items: center; gap: 8px; cursor: pointer; transition: background-color 0.2s; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);"
                                        onmouseover="this.style.backgroundColor='#1d4ed8'"
                                        onmouseout="this.style.backgroundColor='#2563eb'">
                                        <span class="material-symbols-outlined"
                                            style="font-size: 16px;">check_circle</span>
                                        Confirm Handover
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="Layout/footer.jsp" />
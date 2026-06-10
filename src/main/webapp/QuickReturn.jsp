<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.BorrowRecordDTO" %>
        <%@ page import="Models.Book" %>
            <jsp:include page="Layout/header.jsp" />

            <% BorrowRecordDTO record=(BorrowRecordDTO) request.getAttribute("previewRecord"); double fineAmount=0.0;
                long daysOverdue=0L; boolean isOverdue=false; /* Default Style Values */ String cardBorder="#a7f3d0" ;
                String cardBg="rgba(240,253,244,0.5)" ; String badgeBg="#d1fae5" ; String badgeCl="#047857" ; String
                badgeTxt="Returned On Time" ; String dueCl="#64748b" ; String dueWeight="400" ; String
                dueIco="calendar_today" ; String onTimeCnt="1" ; String overdueCnt="0" ; String fineCl="#0f172a" ; if
                (record !=null) { Object fineAttr=request.getAttribute("fineAmount"); Object
                daysAttr=request.getAttribute("daysOverdue"); if (fineAttr !=null) fineAmount=(Double) fineAttr; if
                (daysAttr !=null) daysOverdue=(Long) daysAttr; isOverdue=(daysOverdue> 0);
                if (isOverdue) {
                cardBorder = "#fecdd3";
                cardBg = "rgba(255,241,242,0.5)";
                badgeBg = "#ffe4e6";
                badgeCl = "#be123c";
                badgeTxt = "Overdue (" + daysOverdue + " days)";
                dueCl = "#e11d48";
                dueWeight = "500";
                dueIco = "schedule";
                onTimeCnt = "0";
                overdueCnt = "1";
                fineCl = "#e11d48";
                }
                }
                String formattedFine = String.format("%.2f", fineAmount);
                %>

                <div style="padding: 32px 40px; max-width: 1280px; margin: 0 auto;">
                    <!-- Header with Back Button -->
                    <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 32px;">
                        <a href="Borrow?action=list"
                            style="padding: 8px; color: #94a3b8; text-decoration: none; border-radius: 8px; transition: all 0.2s; display: flex; align-items: center; justify-content: center;"
                            onmouseover="this.style.color='#475569'; this.style.background='#f1f5f9'"
                            onmouseout="this.style.color='#94a3b8'; this.style.background='transparent'">
                            <span class="material-symbols-outlined" style="font-size: 20px;">arrow_back</span>
                        </a>
                        <div>
                            <h1
                                style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em; color: #0f172a; margin: 0;">
                                Process Returns</h1>
                            <p style="color: #64748b; font-size: 0.875rem; margin: 4px 0 0 0;">Scan returned items and
                                process any applicable fines.</p>
                        </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 32px; align-items: start;">
                        <!-- Left Column: Scan and Preview -->
                        <div style="display: flex; flex-direction: column; gap: 24px;">
                            <div
                                style="background: white; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 1px 3px rgba(0,0,0,0.04); padding: 24px;">
                                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin: 0 0 16px 0;">
                                    Enter
                                    Record ID</h2>

                                <form action="Borrow" method="get"
                                    style="display: flex; gap: 12px; align-items: center; margin-bottom: 0;">
                                    <input type="hidden" name="action" value="quickReturn">
                                    <div style="position: relative; flex: 1;">
                                        <span class="material-symbols-outlined"
                                            style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #94a3b8; font-size: 20px;">search</span>
                                        <input type="number" name="id" required placeholder="Enter Record ID..."
                                            autofocus
                                            style="width: 100%; padding: 12px 16px 12px 40px; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; font-size: 0.875rem; outline: none; transition: all 0.2s; color: #0f172a;"
                                            onfocus="this.style.boxShadow='0 0 0 2px #137fec'; this.style.borderColor='transparent'"
                                            onblur="this.style.boxShadow='none'; this.style.borderColor='#e2e8f0'">
                                    </div>
                                    <button type="submit"
                                        style="padding: 12px 24px; background: #137fec; color: white; font-size: 0.875rem; font-weight: 600; border: none; border-radius: 12px; cursor: pointer; transition: all 0.2s; white-space: nowrap; box-shadow: 0 1px 3px rgba(0,0,0,0.1);"
                                        onmouseover="this.style.background='#2563eb'"
                                        onmouseout="this.style.background='#137fec'">Process Return</button>
                                </form>

                                <% String error=(String) request.getAttribute("error"); %>
                                    <% if (error !=null) { %>
                                        <div
                                            style="margin-top: 16px; padding: 12px 16px; border-radius: 12px; background: #fef2f2; color: #dc2626; font-size: 0.875rem; display: flex; align-items: center; gap: 8px;">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 18px;">error</span>
                                            <%= error %>
                                        </div>
                                        <% } %>

                                            <% if (record !=null) { %>
                                                <div style="margin-top: 24px;">
                                                    <div
                                                        style="display: flex; align-items: flex-start; gap: 16px; padding: 16px; border-radius: 12px; border: 1px solid <%= cardBorder %>; background: <%= cardBg %>;">
                                                        <div
                                                            style="width: 64px; height: 96px; border-radius: 6px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.1); flex-shrink: 0; background: #e2e8f0; display: flex; align-items: center; justify-content: center;">
                                                            <% Book book=(Book) request.getAttribute("book"); if (book
                                                                !=null && book.getCover_image() !=null &&
                                                                !book.getCover_image().isEmpty()) { %>
                                                                <img src="<%= book.getCover_image() %>" alt="Book Cover"
                                                                    style="width: 100%; height: 100%; object-fit: cover;">
                                                                <% } else { %>
                                                                    <span class="material-symbols-outlined"
                                                                        style="font-size: 32px; color: #94a3b8;">auto_stories</span>
                                                                    <% } %>
                                                        </div>
                                                        <div style="flex: 1; min-width: 0;">
                                                            <div
                                                                style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
                                                                <div>
                                                                    <h3
                                                                        style="font-size: 1rem; font-weight: 700; color: #0f172a; margin: 0;">
                                                                        <%= record.getBook_title() %>
                                                                    </h3>
                                                                    <p
                                                                        style="font-size: 0.75rem; color: #94a3b8; font-family: monospace; margin: 4px 0 0 0;">
                                                                        Record #<%= record.getBorrow_id() %>
                                                                    </p>
                                                                </div>
                                                                <span
                                                                    style="display: inline-flex; align-items: center; border-radius: 9999px; padding: 4px 10px; font-size: 0.75rem; font-weight: 500; background: <%= badgeBg %>; color: <%= badgeCl %>; white-space: nowrap;">
                                                                    <%= badgeTxt %>
                                                                </span>
                                                            </div>
                                                            <div
                                                                style="margin-top: 16px; display: flex; align-items: center; gap: 24px;">
                                                                <div
                                                                    style="display: flex; align-items: center; gap: 8px;">
                                                                    <img src="https://i.pravatar.cc/150?u=<%= record.getMember_id() %>"
                                                                        style="width: 24px; height: 24px; border-radius: 50%;"
                                                                        referrerPolicy="no-referrer">
                                                                    <span
                                                                        style="font-size: 0.875rem; font-weight: 500; color: #334155;">
                                                                        <%= record.getMember_name() %>
                                                                    </span>
                                                                </div>
                                                                <div
                                                                    style="display: flex; align-items: center; gap: 6px; font-size: 0.875rem; color: <%= dueCl %>; font-weight: <%= dueWeight %>;">
                                                                    <span class="material-symbols-outlined"
                                                                        style="font-size: 16px;">
                                                                        <%= dueIco %>
                                                                    </span>
                                                                    Due: <%= record.getDue_date() %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% } %>
                            </div>
                        </div>

                        <!-- Right Column: Summary -->
                        <div style="display: flex; flex-direction: column; gap: 24px;">
                            <div
                                style="background: white; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 1px 3px rgba(0,0,0,0.04); padding: 24px; position: sticky; top: 96px;">
                                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin: 0 0 24px 0;">
                                    Return Summary</h2>

                                <% if (record !=null) { %>
                                    <div style="display: flex; flex-direction: column; gap: 16px; margin-bottom: 24px;">
                                        <div
                                            style="display: flex; align-items: center; justify-content: space-between; font-size: 0.875rem;">
                                            <span style="color: #64748b;">Items Scanned</span>
                                            <span style="font-weight: 600; color: #0f172a;">1</span>
                                        </div>
                                        <div
                                            style="display: flex; align-items: center; justify-content: space-between; font-size: 0.875rem;">
                                            <span style="color: #64748b;">On Time</span>
                                            <span style="font-weight: 600; color: #059669;">
                                                <%= onTimeCnt %>
                                            </span>
                                        </div>
                                        <div
                                            style="display: flex; align-items: center; justify-content: space-between; font-size: 0.875rem;">
                                            <span style="color: #64748b;">Overdue</span>
                                            <span style="font-weight: 600; color: #e11d48;">
                                                <%= overdueCnt %>
                                            </span>
                                        </div>
                                    </div>

                                    <div style="padding-top: 16px; border-top: 1px solid #e2e8f0; margin-bottom: 32px;">
                                        <div
                                            style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px;">
                                            <span style="font-size: 0.875rem; font-weight: 600; color: #0f172a;">Total
                                                Fines
                                                Generated</span>
                                            <span style="font-size: 1.25rem; font-weight: 700; color: <%= fineCl %>;">$
                                                <%= formattedFine %>
                                            </span>
                                        </div>
                                        <p style="font-size: 0.75rem; color: #64748b; margin: 0;">Fines will be
                                            automatically added to member accounts.</p>
                                    </div>

                                    <div style="display: flex; flex-direction: column; gap: 12px;">
                                        <form action="Borrow" method="get" style="margin: 0;">
                                            <input type="hidden" name="action" value="return">
                                            <input type="hidden" name="id" value="<%= record.getBorrow_id() %>">
                                            <button type="submit"
                                                style="width: 100%; padding: 12px 16px; background: #137fec; color: white; font-size: 0.875rem; font-weight: 600; border: none; border-radius: 12px; cursor: pointer; transition: all 0.2s; box-shadow: 0 1px 3px rgba(0,0,0,0.1);"
                                                onmouseover="this.style.background='#2563eb'"
                                                onmouseout="this.style.background='#137fec'">Complete Return
                                                Process</button>
                                        </form>
                                        <a href="Borrow?action=list"
                                            style="display: block; width: 100%; padding: 12px 16px; background: white; border: 1px solid #e2e8f0; color: #334155; font-size: 0.875rem; font-weight: 600; border-radius: 12px; text-align: center; text-decoration: none; transition: all 0.2s; box-sizing: border-box;"
                                            onmouseover="this.style.background='#f8fafc'"
                                            onmouseout="this.style.background='white'">Cancel</a>
                                    </div>
                                    <% } else { %>
                                        <div style="text-align: center; padding: 40px 0; color: #94a3b8;">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 48px; margin-bottom: 12px; display: block;">receipt_long</span>
                                            <p style="font-size: 0.875rem; margin: 0;">Scan a record ID to see the
                                                return
                                                summary.</p>
                                        </div>
                                        <a href="Borrow?action=list"
                                            style="display: block; width: 100%; padding: 12px 16px; background: white; border: 1px solid #e2e8f0; color: #334155; font-size: 0.875rem; font-weight: 600; border-radius: 12px; text-align: center; text-decoration: none; transition: all 0.2s; box-sizing: border-box; margin-top: 16px;"
                                            onmouseover="this.style.background='#f8fafc'"
                                            onmouseout="this.style.background='white'">Cancel</a>
                                        <% } %>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="Layout/footer.jsp" />
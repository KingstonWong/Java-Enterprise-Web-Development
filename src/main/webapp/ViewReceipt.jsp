<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.FineDTO" %>
        <%@ page import="java.text.SimpleDateFormat" %>
            <%@ page import="java.util.Date" %>
                <% Models.FineDTO fine=(Models.FineDTO) request.getAttribute("fine"); if (fine==null) {
                    response.sendRedirect("Fines?action=list"); return; } String today=new
                    java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date()); %>
                    <jsp:include page="Layout/header.jsp" />

                    <style>
                        @media print {

                            .sidebar,
                            .no-print,
                            .btn-logout,
                            .sidebar-footer {
                                display: none !important;
                            }

                            .main-content {
                                margin: 0 !important;
                                padding: 0 !important;
                            }

                            .app-layout {
                                display: block !important;
                            }

                            body {
                                background: white !important;
                            }

                            .receipt-container {
                                padding: 0 !important;
                                margin: 0 auto !important;
                                max-width: 100% !important;
                            }

                            .receipt-card {
                                border: 1px solid #eee !important;
                                box-shadow: none !important;
                                border-radius: 0 !important;
                            }
                        }
                    </style>

                    <div class="receipt-container" style="padding: 32px; max-width: 600px; margin: 0 auto;">
                        <!-- Header -->
                        <div class="no-print"
                            style="display: flex; align-items: center; gap: 16px; margin-bottom: 24px;">
                            <a href="Fines?action=list"
                                style="padding: 8px; color: #94a3b8; border-radius: 8px; transition: all 0.2s;"
                                onmouseover="this.style.color='#475569'; this.style.backgroundColor='#f1f5f9'"
                                onmouseout="this.style.color='#94a3b8'; this.style.backgroundColor='transparent'">
                                <span class="material-symbols-outlined">arrow_back</span>
                            </a>
                            <div>
                                <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a; margin: 0;">Payment
                                    Receipt</h1>
                                <p style="color: #64748b; font-size: 0.875rem; margin: 4px 0 0 0;">Official confirmation
                                    of fine settlement.</p>
                            </div>
                        </div>

                        <!-- Receipt Card -->
                        <div class="receipt-card"
                            style="background-color: white; border-radius: 20px; border: 1px solid #e2e8f0; box-shadow: 0 10px 30px rgba(0,0,0,0.08); overflow: hidden; position: relative;">
                            <!-- Success Banner -->
                            <div
                                style="background-color: #f0fdf4; padding: 20px; text-align: center; border-bottom: 1px dashed #bbf7d0;">
                                <div
                                    style="width: 56px; height: 56px; border-radius: 9999px; background-color: #dcfce7; color: #16a34a; display: flex; align-items: center; justify-content: center; margin: 0 auto 12px auto;">
                                    <span class="material-symbols-outlined" style="font-size: 32px;">check_circle</span>
                                </div>
                                <h2 style="font-size: 1.25rem; font-weight: 700; color: #166534; margin: 0;">Payment
                                    Successful</h2>
                                <p style="color: #15803d; font-size: 0.875rem; margin: 4px 0 0 0;">Transaction completed
                                    on <%= today %>
                                </p>
                            </div>

                            <div style="padding: 32px;">
                                <!-- Receipt Details -->
                                <div style="display: flex; flex-direction: column; gap: 20px;">
                                    <div style="display: flex; justify-content: space-between; align-items: center;">
                                        <span style="color: #64748b; font-size: 0.875rem; font-weight: 500;">Receipt
                                            Number</span>
                                        <span style="color: #0f172a; font-weight: 700; font-family: monospace;">RCP-<%=
                                                String.format("%06d", fine.getFine_id() + 1000) %></span>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; align-items: center;">
                                        <span style="color: #64748b; font-size: 0.875rem; font-weight: 500;">Member
                                            Name</span>
                                        <span style="color: #0f172a; font-weight: 600;">
                                            <%= fine.getMemberName() %>
                                        </span>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; align-items: center;">
                                        <span style="color: #64748b; font-size: 0.875rem; font-weight: 500;">Loan
                                            Reference</span>
                                        <span style="color: #0f172a; font-weight: 600;">REQ-<%= String.format("%04d",
                                                fine.getBorrow_id()) %></span>
                                    </div>

                                    <div style="border-top: 1px solid #f1f5f9; padding-top: 20px; margin-top: 8px;">
                                        <div
                                            style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
                                            <span style="color: #64748b; font-size: 0.875rem;">Days Overdue</span>
                                            <span style="color: #0f172a; font-weight: 600;">
                                                <%= fine.getOverdueDays() %> Days
                                            </span>
                                        </div>
                                    </div>

                                    <div
                                        style="background-color: #f8fafc; border-radius: 12px; padding: 20px; display: flex; justify-content: space-between; align-items: center; margin-top: 8px;">
                                        <span style="color: #0f172a; font-weight: 700; font-size: 1rem;">Total
                                            Paid</span>
                                        <span style="color: #16a34a; font-weight: 800; font-size: 1.5rem;">$<%=
                                                String.format("%.2f", fine.getAmount()) %></span>
                                    </div>
                                </div>

                                <!-- Footer Message -->
                                <div style="text-align: center; margin-top: 32px;">
                                    <p style="color: #94a3b8; font-size: 0.75rem; margin: 0;">Thank you for your
                                        payment.<br>Your account has been cleared of this fine.</p>
                                </div>
                            </div>

                            <!-- Decorative punch holes for receipt look -->
                            <div class="no-print"
                                style="position: absolute; bottom: -10px; left: 0; width: 100%; height: 20px; background-image: radial-gradient(circle, transparent 70%, #f1f5f9 70%); background-size: 20px 20px; background-position: 0 0;">
                            </div>
                        </div>

                        <!-- Actions -->
                        <div class="no-print"
                            style="margin-top: 32px; display: flex; gap: 12px; justify-content: center;">
                            <button onclick="window.print()"
                                style="padding: 12px 24px; border-radius: 12px; border: 1.5px solid #e2e8f0; background: white; color: #475569; font-weight: 700; display: flex; align-items: center; gap: 8px; cursor: pointer; transition: all 0.2s;">
                                <span class="material-symbols-outlined" style="font-size: 20px;">print</span>
                                Print Receipt
                            </button>
                            <a href="Fines?action=list"
                                style="padding: 12px 24px; border-radius: 12px; background: #1877f2; color: white; font-weight: 700; text-decoration: none; display: flex; align-items: center; gap: 8px; transition: all 0.2s;">
                                <span class="material-symbols-outlined" style="font-size: 20px;">list_alt</span>
                                Return to Fines
                            </a>
                        </div>
                    </div>

                    <jsp:include page="Layout/footer.jsp" />
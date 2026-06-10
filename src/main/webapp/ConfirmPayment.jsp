<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.FineDTO" %>
        <% FineDTO fine=(FineDTO) request.getAttribute("fine"); if (fine==null) {
            response.sendRedirect("Fines?action=list"); return; } %>
            <jsp:include page="Layout/header.jsp" />
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <div style="padding: 32px; max-width: 800px; margin: 0 auto;">
                <!-- Header -->
                <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 24px;">
                    <a href="Fines?action=list"
                        style="padding: 8px; color: #94a3b8; border-radius: 8px; transition: all 0.2s;"
                        onmouseover="this.style.color='#475569'; this.style.backgroundColor='#f1f5f9'"
                        onmouseout="this.style.color='#94a3b8'; this.style.backgroundColor='transparent'">
                        <span class="material-symbols-outlined">arrow_back</span>
                    </a>
                    <div>
                        <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a; margin: 0;">Collect
                            Payment</h1>
                        <p style="color: #64748b; font-size: 0.875rem; margin: 4px 0 0 0;">Review fine details
                            and confirm payment collection.</p>
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
                                    style="width: 40px; height: 40px; border-radius: 9999px; background-color: #fee2e2; color: #dc2626; display: flex; align-items: center; justify-content: center;">
                                    <span class="material-symbols-outlined" style="font-size: 20px;">payments</span>
                                </div>
                                <div>
                                    <p style="font-size: 0.875rem; font-weight: 500; color: #64748b; margin: 0;">
                                        Fine ID</p>
                                    <p style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin: 0;">
                                        FINE-<%= String.format("%04d", fine.getFine_id()) %>
                                    </p>
                                </div>
                            </div>
                            <span
                                style="display: inline-flex; align-items: center; padding: 4px 12px; border-radius: 9999px; font-size: 0.875rem; font-weight: 500; background-color: #fef3c7; color: #92400e;">
                                Payment Pending
                            </span>
                        </div>
                    </div>

                    <!-- Details Area -->
                    <div style="padding: 24px;">
                        <div
                            style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 32px; margin-bottom: 24px;">

                            <!-- Member Info -->
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
                                            <%= fine.getMemberName() !=null ? fine.getMemberName() : "N/A" %>
                                        </p>
                                        <p style="font-size: 0.875rem; color: #64748b; margin: 4px 0 0 0;">
                                            Loan ID: REQ-<%= String.format("%04d", fine.getBorrow_id()) %>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Fine Breakdown -->
                            <div style="display: flex; flex-direction: column; gap: 16px;">
                                <h3
                                    style="font-size: 0.875rem; font-weight: 600; color: #0f172a; text-transform: uppercase; letter-spacing: 0.05em; display: flex; align-items: center; gap: 8px; margin: 0;">
                                    <span class="material-symbols-outlined"
                                        style="font-size: 16px; color: #94a3b8;">receipt_long</span>
                                    Fine Breakdown
                                </h3>
                                <div
                                    style="padding: 16px; border-radius: 12px; border: 1px solid #f1f5f9; background-color: #f8fafc;">
                                    <div
                                        style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #e2e8f0;">
                                        <span style="color: #64748b; font-size: 0.875rem;">Due Date</span>
                                        <span style="font-weight: 600; color: #0f172a;">
                                            <%= fine.getDueDate() !=null ? fine.getDueDate() : "---" %>
                                        </span>
                                    </div>
                                    <div
                                        style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #e2e8f0;">
                                        <span style="color: #64748b; font-size: 0.875rem;">Return Date</span>
                                        <span style="font-weight: 600; color: #0f172a;">
                                            <%= fine.getReturnDate() !=null ? fine.getReturnDate() : "---" %>
                                        </span>
                                    </div>
                                    <div
                                        style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #e2e8f0;">
                                        <span style="color: #64748b; font-size: 0.875rem;">Days Overdue</span>
                                        <span style="font-weight: 700; color: #dc2626;">
                                            <%= fine.getOverdueDays() %> days
                                        </span>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; padding: 12px 0 4px 0;">
                                        <span style="font-weight: 700; color: #0f172a; font-size: 1rem;">Total
                                            Amount</span>
                                        <span style="font-weight: 800; color: #dc2626; font-size: 1.25rem;">$<%=
                                                String.format("%.2f", fine.getAmount()) %></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Info Box -->
                        <div style="border-top: 1px solid #e2e8f0; padding-top: 24px;">
                            <div
                                style="background-color: #fefce8; border: 1px solid #fde68a; border-radius: 12px; padding: 16px; display: flex; align-items: flex-start; gap: 12px;">
                                <span class="material-symbols-outlined"
                                    style="color: #d97706; margin-top: 2px;">info</span>
                                <div>
                                    <p style="font-size: 0.875rem; font-weight: 600; color: #0f172a; margin: 0;">
                                        Payment Notice</p>
                                    <p
                                        style="font-size: 0.875rem; color: #475569; margin: 4px 0 0 0; line-height: 1.5;">
                                        Please collect the total fine amount from the member before confirming
                                        payment. Once confirmed, this action cannot be undone.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Actions -->
                    <div
                        style="padding: 24px; border-top: 1px solid #e2e8f0; background-color: #f8fafc; display: flex; align-items: center; justify-content: flex-end; gap: 12px;">
                        <a href="Fines?action=list"
                            style="padding: 10px 20px; font-size: 0.875rem; font-weight: 600; color: #334155; background-color: white; border: 1px solid #cbd5e1; border-radius: 8px; text-decoration: none; transition: all 0.2s;"
                            onmouseover="this.style.backgroundColor='#f1f5f9'"
                            onmouseout="this.style.backgroundColor='white'">
                            Cancel
                        </a>

                        <button type="button" id="confirmPaymentBtn"
                            style="padding: 10px 20px; font-size: 0.875rem; font-weight: 600; color: white; background-color: #dc2626; border: none; border-radius: 8px; display: flex; align-items: center; gap: 8px; cursor: pointer; transition: background-color 0.2s; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);"
                            onmouseover="this.style.backgroundColor='#b91c1c'"
                            onmouseout="this.style.backgroundColor='#dc2626'">
                            <span class="material-symbols-outlined" style="font-size: 16px;">check_circle</span>
                            Confirm Payment
                        </button>
                    </div>
                </div>
            </div>

            <script>
                document.getElementById('confirmPaymentBtn').addEventListener('click', function () {
                    Swal.fire({
                        title: 'Confirm Payment?',
                        html: 'Collecting <strong>$<%= String.format("%.2f", fine.getAmount()) %></strong> from <strong><%= fine.getMemberName() %></strong>.',
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'Yes, Confirm Payment',
                        cancelButtonText: 'Cancel',
                        confirmButtonColor: '#dc2626',
                        cancelButtonColor: '#64748b',
                        reverseButtons: true
                    }).then(function (result) {
                        if (result.isConfirmed) {
                            window.location.href = 'Fines?action=pay&id=<%= fine.getFine_id() %>';
                        }
                    });
                });
            </script>

            <jsp:include page="Layout/footer.jsp" />
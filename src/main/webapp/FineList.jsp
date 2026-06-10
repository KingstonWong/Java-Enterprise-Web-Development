<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.FineDTO" %>
            <jsp:include page="Layout/header.jsp" />

            <div class="page-header" style="margin-bottom: 32px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">Fine Management</h1>
                    <p style="color: #65676b; font-size: 1.125rem;">Track and manage library fines for overdue books.
                    </p>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <!-- Search & Filter Section -->
            <div
                style="margin-bottom: 32px; background: white; padding: 24px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.06);">
                <div style="display: flex; gap: 12px; align-items: center; margin-bottom: 20px;">
                    <div style="position: relative; flex: 1;">
                        <span class="material-symbols-outlined"
                            style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b;">search</span>
                        <input type="text" id="searchInput" placeholder="Search by Member Name or Loan ID..."
                            style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 14px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 1rem; transition: all 0.2s; outline: none;"
                            onfocus="this.style.borderColor='#1877f2'; this.style.background='white'; this.style.boxShadow='0 0 0 4px rgba(24, 119, 242, 0.1)';"
                            onblur="this.style.borderColor='#eef2f6'; this.style.background='#f8fafc'; this.style.boxShadow='none';">
                    </div>
                    <button type="button" id="toggleFilters"
                        style="padding: 14px 20px; border-radius: 14px; font-weight: 700; background: #f8fafc; border: 1.5px solid #eef2f6; color: #475569; cursor: pointer; display: flex; align-items: center; gap: 8px; font-size: 0.875rem; transition: all 0.2s;"
                        onmouseover="this.style.borderColor='#1877f2'; this.style.color='#1877f2'"
                        onmouseout="this.style.borderColor='#eef2f6'; this.style.color='#475569'">
                        <span class="material-symbols-outlined" style="font-size: 20px;">tune</span>
                        <span>Filters</span>
                    </button>
                    <button type="button" id="clearAll"
                        style="padding: 14px 20px; border-radius: 14px; font-weight: 700; background: #fef2f2; border: 1.5px solid #fecaca; color: #dc2626; cursor: pointer; display: flex; align-items: center; gap: 8px; font-size: 0.875rem; transition: all 0.2s; display: none;"
                        onclick="clearAllFilters()">
                        <span class="material-symbols-outlined" style="font-size: 18px;">close</span>
                        <span>Clear All</span>
                    </button>
                </div>
                <div id="filterRow"
                    style="display: none; gap: 16px; align-items: end; padding-top: 20px; border-top: 1.5px solid #f1f5f9; flex-wrap: wrap;">
                    <div style="flex: 1; min-width: 150px;">
                        <label
                            style="display: block; font-size: 0.75rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">Status</label>
                        <select id="filterStatus"
                            style="width: 100%; padding: 10px 12px; border-radius: 10px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 0.875rem; color: #1c1e21; outline: none; cursor: pointer;">
                            <option value="">All Statuses</option>
                            <option value="Paid">Paid</option>
                            <option value="Pending">Pending</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="card"
                style="border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.06); border-radius: 20px; overflow: hidden; background: white;">
                <table class="data-table" id="fineTable" style="border-collapse: separate; border-spacing: 0;">
                    <thead>
                        <tr style="background: #f8fafc;">
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                MEMBER</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                AMOUNT</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                DAYS OVERDUE</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                STATUS</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb; text-align: right;">
                                ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody id="fineTableBody">
                        <% List<FineDTO> listFines = (List<FineDTO>) request.getAttribute("listFines");
                                if (listFines != null && !listFines.isEmpty()) {
                                for (FineDTO fine : listFines) {
                                String status = fine.getStatus() != null ? fine.getStatus() : "";
                                %>
                                <tr class="fine-row" data-member="<%= fine.getMemberName() %>"
                                    data-loan-id="REQ-<%= String.format(" %04d", fine.getBorrow_id()) %>"
                                    data-status="<%= status %>" style="transition: all 0.2s;"
                                        onmouseover="this.style.background='#f1f5f9'"
                                        onmouseout="this.style.background='white'">
                                        <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                            <div style="font-weight: 700; color: #1c1e21;">
                                                <%= fine.getMemberName() %>
                                            </div>
                                            <div style="font-size: 0.875rem; color: #65676b;">Loan ID: <%=
                                                    fine.getBorrow_id() %>
                                            </div>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; font-weight: 800; color: #d32f2f;">
                                            $<%= String.format("%.2f", fine.getAmount()) %>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                            <%= fine.getOverdueDays() %> days
                                        </td>
                                        <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                            <% String badgeStyle="background: #fefce8; color: #a16207;" ; if
                                                ("Paid".equals(status))
                                                badgeStyle="background: #f0fdf4; color: #15803d;" ; %>
                                                <span
                                                    style="<%= badgeStyle %> padding: 4px 12px; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase;">
                                                    <%= status %>
                                                </span>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; text-align: right;">
                                            <% if (!"Paid".equals(status)) { %>
                                                <a href="Fines?action=showConfirmPayment&id=<%= fine.getFine_id() %>"
                                                    class="btn-primary"
                                                    style="padding: 8px 16px; border-radius: 10px; font-weight: 700; background: #1877f2;">
                                                    <span class="material-symbols-outlined"
                                                        style="font-size: 18px;">payments</span>
                                                    <span>Collect Payment</span>
                                                </a>
                                                <% } else { %>
                                                    <a href="Fines?action=viewReceipt&id=<%= fine.getFine_id() %>"
                                                        class="btn-primary"
                                                        style="padding: 8px 16px; border-radius: 10px; font-weight: 700; background: #f8fafc; color: #475569; border: 1.5px solid #eef2f6;">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size: 18px; color: #16a34a;">receipt</span>
                                                        <span>View Receipt</span>
                                                    </a>
                                                    <% } %>
                                        </td>
                                </tr>
                                <% } } else { %>
                                    <tr id="noResultsRow">
                                        <td colspan="5" style="text-align: center; padding: 80px 40px; color: #65676b;">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 64px; color: #cbd5e1;">volunteer_activism</span>
                                            <div
                                                style="font-size: 1.25rem; font-weight: 700; color: #475569; margin-top: 16px;">
                                                No Fines Found</div>
                                            <p>All members are in good standing with the library.</p>
                                        </td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

            <script>
                var searchInput = document.getElementById('searchInput');
                var filterStatus = document.getElementById('filterStatus');
                var toggleBtn = document.getElementById('toggleFilters');
                var filterRow = document.getElementById('filterRow');
                var clearBtn = document.getElementById('clearAll');
                var rows = document.querySelectorAll('.fine-row');

                toggleBtn.addEventListener('click', function () {
                    if (filterRow.style.display === 'none' || filterRow.style.display === '') {
                        filterRow.style.display = 'flex';
                        toggleBtn.style.borderColor = '#1877f2';
                        toggleBtn.style.color = '#1877f2';
                        toggleBtn.style.background = '#eff6ff';
                    } else {
                        filterRow.style.display = 'none';
                        toggleBtn.style.borderColor = '#eef2f6';
                        toggleBtn.style.color = '#475569';
                        toggleBtn.style.background = '#f8fafc';
                    }
                });

                searchInput.addEventListener('input', applyFilters);
                filterStatus.addEventListener('change', applyFilters);

                function applyFilters() {
                    var query = searchInput.value.toLowerCase().trim();
                    var statusVal = filterStatus.value.toLowerCase();
                    var hasActiveFilter = query || statusVal;

                    clearBtn.style.display = hasActiveFilter ? 'flex' : 'none';
                    var visibleCount = 0;

                    rows.forEach(function (row) {
                        var member = row.getAttribute('data-member').toLowerCase();
                        var loanId = row.getAttribute('data-loan-id').toLowerCase();
                        var st = row.getAttribute('data-status').toLowerCase();

                        var matchSearch = !query || member.indexOf(query) !== -1 || loanId.indexOf(query) !== -1;
                        var matchStatus = !statusVal || st === statusVal;

                        if (matchSearch && matchStatus) {
                            row.style.display = '';
                            visibleCount++;
                        } else {
                            row.style.display = 'none';
                        }
                    });

                    var emptyRow = document.getElementById('noResultsRow');
                    if (visibleCount === 0 && rows.length > 0) {
                        if (!emptyRow) {
                            emptyRow = document.createElement('tr');
                            emptyRow.id = 'noResultsRow';
                            emptyRow.innerHTML = '<td colspan="5" style="text-align: center; padding: 60px; color: #65676b;"><span class="material-symbols-outlined" style="font-size: 48px; color: #cbd5e1;">search_off</span><p style="margin-top: 16px;">No fine records match your search.</p></td>';
                            document.getElementById('fineTableBody').appendChild(emptyRow);
                        }
                        emptyRow.style.display = '';
                    } else if (emptyRow) {
                        emptyRow.style.display = 'none';
                    }
                }

                function clearAllFilters() {
                    searchInput.value = '';
                    filterStatus.value = '';
                    clearBtn.style.display = 'none';
                    applyFilters();
                }

                // Run on load
                window.onload = function () {
                    applyFilters();
                };
            </script>

            <% String alertMessage=(String) session.getAttribute("alertMessage"); String alertType=(String)
                session.getAttribute("alertType"); if (alertMessage !=null) { %>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        Swal.fire({
                            title: '<%= "success".equals(alertType) ? "Success!" : "Notice" %>',
                            text: '<%= alertMessage %>',
                            icon: '<%= alertType != null ? alertType : "info" %>',
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#1877f2',
                            background: '#ffffff',
                            customClass: {
                                popup: 'rounded-xl shadow-lg',
                                title: 'text-xl font-bold text-gray-800',
                                confirmButton: 'px-6 py-2 rounded-lg font-semibold'
                            }
                        });
                    });
                </script>
                <% session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); } %>

                    <jsp:include page="Layout/footer.jsp" />
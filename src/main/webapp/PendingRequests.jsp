<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.BorrowRecordDTO" %>
            <jsp:include page="Layout/header.jsp" />

            <div class="page-header" style="margin-bottom: 32px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">Pending Requests</h1>
                    <p style="color: #65676b; font-size: 1.125rem;">Review and approve member borrow requests.</p>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <!-- Search & Filter Section -->
            <div
                style="margin-bottom: 32px; background: white; padding: 24px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.06);">
                <!-- Search Bar -->
                <div style="display: flex; gap: 12px; align-items: center; margin-bottom: 20px;">
                    <div style="position: relative; flex: 1;">
                        <span class="material-symbols-outlined"
                            style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b;">search</span>
                        <input type="text" id="searchInput"
                            placeholder="Search by Record ID, member name, or book title..."
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
                <!-- Filter Row (hidden by default) -->
                <div id="filterRow"
                    style="display: none; gap: 16px; align-items: end; padding-top: 20px; border-top: 1.5px solid #f1f5f9; flex-wrap: wrap;">
                    <div style="flex: 1; min-width: 150px;">
                        <label
                            style="display: block; font-size: 0.75rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">Status</label>
                        <select id="filterStatus"
                            style="width: 100%; padding: 10px 12px; border-radius: 10px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 0.875rem; color: #1c1e21; outline: none; cursor: pointer;">
                            <option value="">All Statuses</option>
                            <option value="PENDING">Pending</option>
                            <option value="APPROVED">Approved</option>
                        </select>
                    </div>
                    <div style="flex: 1; min-width: 150px;">
                        <label
                            style="display: block; font-size: 0.75rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">Request
                            Date</label>
                        <input type="date" id="filterRequestDate"
                            style="width: 100%; padding: 10px 12px; border-radius: 10px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 0.875rem; color: #1c1e21; outline: none;">
                    </div>
                    <div style="flex: 1; min-width: 150px;">
                        <label
                            style="display: block; font-size: 0.75rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">Borrow
                            Date</label>
                        <input type="date" id="filterBorrowDate"
                            style="width: 100%; padding: 10px 12px; border-radius: 10px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 0.875rem; color: #1c1e21; outline: none;">
                    </div>
                    <div style="flex: 1; min-width: 150px;">
                        <label
                            style="display: block; font-size: 0.75rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">Due
                            Date</label>
                        <input type="date" id="filterDueDate"
                            style="width: 100%; padding: 10px 12px; border-radius: 10px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 0.875rem; color: #1c1e21; outline: none;">
                    </div>
                    <div style="flex: 1; min-width: 150px;">
                        <label
                            style="display: block; font-size: 0.75rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">Return
                            Date</label>
                        <input type="date" id="filterReturnDate"
                            style="width: 100%; padding: 10px 12px; border-radius: 10px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 0.875rem; color: #1c1e21; outline: none;">
                    </div>
                </div>
            </div>

            <div class="card"
                style="border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.06); border-radius: 20px; overflow: hidden; background: white;">
                <table class="data-table" id="loanTable" style="border-collapse: separate; border-spacing: 0;">
                    <thead>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            RECORD ID</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            MEMBER NAME</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            BOOK TITLE</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            REQUEST DATE</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            BORROW DATE</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            DUE DATE</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            RETURN DATE</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                            STATUS</th>
                        <th
                            style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb; text-align: right;">
                            ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody id="loanTableBody">
                        <% List<BorrowRecordDTO> pendingRequests = (List<BorrowRecordDTO>)
                                request.getAttribute("pendingRequests");
                                if (pendingRequests != null && !pendingRequests.isEmpty()) {
                                for (BorrowRecordDTO record : pendingRequests) {
                                %>
                                <% String requestDate=record.getRequest_date() !=null ?
                                    record.getRequest_date().toString() : "---" ; String
                                    borrowDate=record.getPickup_date() !=null ? record.getPickup_date().toString()
                                    : "---" ; String dueDate=record.getDue_date() !=null ?
                                    record.getDue_date().toString() : "---" ; String returnDate=record.getReturn_date()
                                    !=null ? record.getReturn_date().toString() : "---" ; String
                                    status=record.getStatus(); String bg="#f1f5f9" , cl="#475569" ; if
                                    ("APPROVED".equalsIgnoreCase(status) || "BORROWED" .equalsIgnoreCase(status)) {
                                    bg="#e0f2fe" ; cl="#0369a1" ; } else if ("RETURNED".equalsIgnoreCase(status)) {
                                    bg="#f0fdf4" ; cl="#15803d" ; } else if ("PENDING".equalsIgnoreCase(status)) {
                                    bg="#fefce8" ; cl="#a16207" ; } String badgeStyle="background: " + bg + "; color: "
                                    + cl + ";" ; %>
                                    <tr class="loan-row" data-record-id="<%= record.getBorrow_id() %>"
                                        data-member="<%= record.getMember_name() %>"
                                        data-book="<%= record.getBook_title() %>" data-status="<%= status %>"
                                        data-request-date="<%= requestDate %>" data-borrow-date="<%= borrowDate %>"
                                        data-due-date="<%= dueDate %>" data-return-date="<%= returnDate %>"
                                        style="transition: all 0.2s;" onmouseover="this.style.background='#f1f5f9'"
                                        onmouseout="this.style.background='white'">
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #65676b; font-family: monospace;">
                                            <%= record.getBorrow_id() %>
                                        </td>
                                        <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                            <div style="font-weight: 600; color: #1c1e21;">
                                                <%= record.getMember_name() %>
                                            </div>
                                        </td>
                                        <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                            <div style="font-weight: 700; color: #1c1e21;">
                                                <%= record.getBook_title() %>
                                            </div>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                            <%= requestDate %>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                            <%= borrowDate %>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                            <%= dueDate %>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563;">
                                            <%= returnDate %>
                                        </td>
                                        <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                            <span
                                                style="<%= badgeStyle %> padding: 4px 12px; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase;">
                                                <%= status %>
                                            </span>
                                        </td>
                                        <td
                                            style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; text-align: right;">
                                            <% if ("PENDING".equalsIgnoreCase(record.getStatus())) { %>
                                                <a href="Borrow?action=approve&id=<%= record.getBorrow_id() %>"
                                                    class="btn-primary"
                                                    style="padding: 8px 20px; border-radius: 10px; font-weight: 700; background: #16a34a;">
                                                    <span class="material-symbols-outlined"
                                                        style="font-size: 18px;">check</span>
                                                    <span>Approve</span>
                                                </a>
                                                <% } else if ("APPROVED".equalsIgnoreCase(record.getStatus())) { %>
                                                    <a href="Borrow?action=showConfirmPickup&id=<%= record.getBorrow_id() %>"
                                                        class="btn-primary"
                                                        style="padding: 8px 20px; border-radius: 10px; font-weight: 700; background: #1877f2;">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size: 18px;">local_shipping</span>
                                                        <span>Confirm Pickup</span>
                                                    </a>
                                                    <% } %>
                                        </td>
                                    </tr>
                                    <% } } else { %>
                                        <tr id="emptyRow">
                                            <td colspan="9"
                                                style="text-align: center; padding: 80px 40px; color: #65676b;">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 64px; color: #cbd5e1;">rule</span>
                                                <div
                                                    style="font-size: 1.25rem; font-weight: 700; color: #475569; margin-top: 16px;">
                                                    All Caught Up!</div>
                                                <p>There are no pending borrow requests to review at this time.</p>
                                            </td>
                                        </tr>
                                        <% } %>
                    </tbody>
                </table>
            </div>

            <script>
                var searchInput = document.getElementById('searchInput');
                var filterStatus = document.getElementById('filterStatus');
                var filterRequestDate = document.getElementById('filterRequestDate');
                var filterBorrowDate = document.getElementById('filterBorrowDate');
                var filterDueDate = document.getElementById('filterDueDate');
                var filterReturnDate = document.getElementById('filterReturnDate');
                var toggleBtn = document.getElementById('toggleFilters');
                var filterRow = document.getElementById('filterRow');
                var clearBtn = document.getElementById('clearAll');
                var rows = document.querySelectorAll('.loan-row');

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
                filterRequestDate.addEventListener('change', applyFilters);
                filterBorrowDate.addEventListener('change', applyFilters);
                filterDueDate.addEventListener('change', applyFilters);
                filterReturnDate.addEventListener('change', applyFilters);

                function applyFilters() {
                    var query = searchInput.value.toLowerCase().trim();
                    var statusVal = filterStatus.value.toUpperCase();
                    var requestDateVal = filterRequestDate.value;
                    var borrowDateVal = filterBorrowDate.value;
                    var dueDateVal = filterDueDate.value;
                    var returnDateVal = filterReturnDate.value;
                    var hasActiveFilter = query || statusVal || requestDateVal || borrowDateVal || dueDateVal || returnDateVal;
                    clearBtn.style.display = hasActiveFilter ? 'flex' : 'none';
                    var visibleCount = 0;
                    rows.forEach(function (row) {
                        var rid = row.getAttribute('data-record-id').toLowerCase();
                        var member = row.getAttribute('data-member').toLowerCase();
                        var book = row.getAttribute('data-book').toLowerCase();
                        var st = row.getAttribute('data-status').toUpperCase();
                        var rqd = row.getAttribute('data-request-date');
                        var bd = row.getAttribute('data-borrow-date');
                        var dd = row.getAttribute('data-due-date');
                        var rd = row.getAttribute('data-return-date');
                        var matchSearch = !query || rid.indexOf(query) !== -1 || member.indexOf(query) !== -1 || book.indexOf(query) !== -1;
                        var matchStatus = !statusVal || st === statusVal;
                        var matchRequest = !requestDateVal || rqd === requestDateVal;
                        var matchBorrow = !borrowDateVal || bd === borrowDateVal;
                        var matchDue = !dueDateVal || dd === dueDateVal;
                        var matchReturn = !returnDateVal || rd === returnDateVal;
                        if (matchSearch && matchStatus && matchRequest && matchBorrow && matchDue && matchReturn) {
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
                            emptyRow.innerHTML = '<td colspan="9" style="text-align: center; padding: 60px; color: #65676b;"><span class="material-symbols-outlined" style="font-size: 48px; color: #cbd5e1;">search_off</span><p style="margin-top: 16px;">No records match your search or filters.</p></td>';
                            document.getElementById('loanTableBody').appendChild(emptyRow);
                        }
                        emptyRow.style.display = '';
                    } else if (emptyRow) {
                        emptyRow.style.display = 'none';
                    }
                }

                function clearAllFilters() {
                    searchInput.value = '';
                    filterStatus.value = '';
                    filterRequestDate.value = '';
                    filterBorrowDate.value = '';
                    filterDueDate.value = '';
                    filterReturnDate.value = '';
                    clearBtn.style.display = 'none';
                    applyFilters();
                }

                // Run on load if there's any pre-filled value
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
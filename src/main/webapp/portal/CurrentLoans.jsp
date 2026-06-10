<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, Models.BorrowRecordDTO, Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); List<BorrowRecordDTO> activeLoans = (List<BorrowRecordDTO>
                ) request.getAttribute("activeLoans");
                java.time.LocalDate today = java.time.LocalDate.now();
                %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Current Loans - Library Portal</title>
                    <link rel="stylesheet"
                        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                    <link rel="stylesheet" href="member-portal.css">
                </head>

                <body class="mp-page">
                    <jsp:include page="MemberHeader.jsp" />
                    <main class="mp-container">
                        <ol class="mp-breadcrumb">
                            <li><a href="Portal?action=home"><span class="material-symbols-outlined">home</span>
                                    Home</a></li>
                            <li><span class="material-symbols-outlined">chevron_right</span></li>
                            <li><a href="Portal?action=dashboard">Borrowing</a></li>
                            <li><span class="material-symbols-outlined">chevron_right</span></li>
                            <li><span class="current">Current Loans</span></li>
                        </ol>
                        <div class="mp-layout">
                            <aside class="mp-sidebar">
                                <div class="mp-sidebar-card">
                                    <nav class="mp-sidebar-nav">
                                        <a href="Portal?action=dashboard"><span
                                                class="material-symbols-outlined">dashboard</span> Overview</a>
                                        <a href="Portal?action=loans" class="active"><span
                                                class="material-symbols-outlined">book</span> Current Loans <span
                                                class="nav-badge">
                                                <%= activeLoans !=null ? activeLoans.size() : 0 %>
                                            </span></a>
                                        <a href="Portal?action=requests"><span
                                                class="material-symbols-outlined">hourglass_empty</span> Pending
                                            Requests</a>
                                        <a href="Portal?action=history"><span
                                                class="material-symbols-outlined">history</span> Borrowing History</a>
                                        <a href="Portal?action=fines"><span
                                                class="material-symbols-outlined">payments</span> Fines & Fees</a>
                                    </nav>
                                </div>
                            </aside>
                            <div class="mp-content">
                                <div class="mp-card">
                                    <div class="mp-card-header" style="flex-wrap: wrap; gap: 16px;">
                                        <div>
                                            <h2>Current Loans</h2>
                                            <p>Books you currently have on loan</p>
                                        </div>
                                        <div class="mp-filter-container">
                                            <select id="statusFilter" class="mp-filter-select">
                                                <option value="all">All Status</option>
                                                <option value="on-loan">On Loan</option>
                                                <option value="due-soon">Due Soon</option>
                                                <option value="overdue">Overdue</option>
                                            </select>
                                            <div class="mp-search" style="margin: 0; max-width: 300px;">
                                                <span class="material-symbols-outlined">search</span>
                                                <input type="text" id="loanSearch" placeholder="Search books...">
                                            </div>
                                        </div>
                                    </div>
                                    <% if (activeLoans !=null && !activeLoans.isEmpty()) { %>
                                        <div style="overflow-x:auto;">
                                            <table class="mp-table" id="loanTable">
                                                <thead>
                                                    <tr>
                                                        <th>Item Details</th>
                                                        <th>Borrowed Date</th>
                                                        <th>Due Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="loanTableBody">
                                                    <% for (BorrowRecordDTO r : activeLoans) { boolean
                                                        isOverdue=r.getDue_date() !=null &&
                                                        r.getDue_date().toLocalDate().isBefore(today); long
                                                        daysUntilDue=0; if (r.getDue_date() !=null) {
                                                        daysUntilDue=java.time.temporal.ChronoUnit.DAYS.between(today,
                                                        r.getDue_date().toLocalDate()); } String statusAttr=isOverdue
                                                        ? "overdue" : (daysUntilDue <=3 ? "due-soon" : "on-loan" ); %>
                                                        <tr class="loan-row"
                                                            data-title="<%= r.getBook_title().toLowerCase() %>"
                                                            data-id="<%= r.getBorrow_id() %>"
                                                            data-status="<%= statusAttr %>">
                                                            <td>
                                                                <div class="mp-item-cell">
                                                                    <div class="mp-item-thumb">
                                                                        <% if (r.getCoverImage() !=null &&
                                                                            !r.getCoverImage().isEmpty()) { %>
                                                                            <img src="<%= r.getCoverImage() %>"
                                                                                alt="<%= r.getBook_title() %>">
                                                                            <% } else { %>
                                                                                <span class="material-symbols-outlined"
                                                                                    style="color:var(--mp-gray-400);">menu_book</span>
                                                                                <% } %>
                                                                    </div>
                                                                    <div>
                                                                        <div class="mp-item-title">
                                                                            <%= r.getBook_title() %>
                                                                        </div>
                                                                        <div class="mp-item-isbn">Borrow #<%=
                                                                                r.getBorrow_id() %>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <%= r.getPickup_date() !=null ?
                                                                    r.getPickup_date().toString() : "N/A" %>
                                                            </td>
                                                            <td>
                                                                <%= r.getDue_date() !=null ? r.getDue_date().toString()
                                                                    : "N/A" %>
                                                            </td>
                                                            <td>
                                                                <% if (isOverdue) { %>
                                                                    <span class="mp-badge mp-badge-red"><span
                                                                            class="material-symbols-outlined">warning</span>
                                                                        Overdue</span>
                                                                    <% } else if (daysUntilDue <=3) { %>
                                                                        <span class="mp-badge mp-badge-yellow"><span
                                                                                class="material-symbols-outlined">schedule</span>
                                                                            Due Soon (<%= daysUntilDue %>d)</span>
                                                                        <% } else { %>
                                                                            <span class="mp-badge mp-badge-green"><span
                                                                                    class="material-symbols-outlined">check_circle</span>
                                                                                On Loan</span>
                                                                            <% } %>
                                                            </td>
                                                        </tr>
                                                        <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                        <script>
                                            const loanSearch = document.getElementById('loanSearch');
                                            const statusFilter = document.getElementById('statusFilter');
                                            const rows = document.querySelectorAll('.loan-row');

                                            function filterLoans() {
                                                const query = loanSearch.value.toLowerCase();
                                                const status = statusFilter.value;
                                                let visibleCount = 0;

                                                rows.forEach(row => {
                                                    const title = row.getAttribute('data-title');
                                                    const id = row.getAttribute('data-id');
                                                    const rowStatus = row.getAttribute('data-status');

                                                    const matchesQuery = title.includes(query) || id.includes(query);
                                                    const matchesStatus = status === 'all' || rowStatus === status;

                                                    if (matchesQuery && matchesStatus) {
                                                        row.style.display = '';
                                                        visibleCount++;
                                                    } else {
                                                        row.style.display = 'none';
                                                    }
                                                });

                                                let noResults = document.getElementById('noResultsRow');
                                                if (visibleCount === 0) {
                                                    if (!noResults) {
                                                        noResults = document.createElement('tr');
                                                        noResults.id = 'noResultsRow';
                                                        noResults.innerHTML = '<td colspan="4" style="text-align:center;padding:48px;color:var(--mp-gray-500);"><span class="material-symbols-outlined" style="font-size:48px;color:var(--mp-gray-300);">search_off</span><p style="margin-top:12px;">No matching loans found</p></td>';
                                                        document.getElementById('loanTableBody').appendChild(noResults);
                                                    } else {
                                                        noResults.style.display = '';
                                                    }
                                                } else if (noResults) {
                                                    noResults.style.display = 'none';
                                                }
                                            }

                                            loanSearch.addEventListener('input', filterLoans);
                                            statusFilter.addEventListener('change', filterLoans);
                                        </script>
                                        <% } else { %>
                                            <div style="padding:48px;text-align:center;color:var(--mp-gray-500);">
                                                <span class="material-symbols-outlined"
                                                    style="font-size:48px;color:var(--mp-gray-300);">menu_book</span>
                                                <p style="margin-top:12px;">No current loans</p>
                                                <a href="Portal?action=home" class="mp-btn mp-btn-primary"
                                                    style="margin-top:16px;">Browse Books</a>
                                            </div>
                                            <% } %>
                                </div>
                            </div>
                        </div>
                    </main>
                </body>

                </html>
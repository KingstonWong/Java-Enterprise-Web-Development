<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, java.util.Set, Models.BorrowRecordDTO, Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); List<BorrowRecordDTO> history = (List<BorrowRecordDTO>)
                request.getAttribute("history");
                Set<Integer> reviewedBookIds = (Set<Integer>) request.getAttribute("reviewedBookIds");
                        java.time.LocalDate today = java.time.LocalDate.now();
                        %>
                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Borrowing History - Library Portal</title>
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
                                    <li><span class="current">History</span></li>
                                </ol>
                                <div class="mp-layout">
                                    <aside class="mp-sidebar">
                                        <div class="mp-sidebar-card">
                                            <nav class="mp-sidebar-nav">
                                                <a href="Portal?action=dashboard"><span
                                                        class="material-symbols-outlined">dashboard</span> Overview</a>
                                                <a href="Portal?action=loans"><span
                                                        class="material-symbols-outlined">book</span> Current Loans</a>
                                                <a href="Portal?action=requests"><span
                                                        class="material-symbols-outlined">hourglass_empty</span> Pending
                                                    Requests</a>
                                                <a href="Portal?action=history" class="active"><span
                                                        class="material-symbols-outlined">history</span> Borrowing
                                                    History</a>
                                                <a href="Portal?action=fines"><span
                                                        class="material-symbols-outlined">payments</span> Fines &
                                                    Fees</a>
                                            </nav>
                                        </div>
                                    </aside>
                                    <div class="mp-content">
                                        <div class="mp-card">
                                            <div class="mp-card-header" style="flex-wrap: wrap; gap: 16px;">
                                                <div>
                                                    <h2>Borrowing History</h2>
                                                    <p>Complete record of all your borrowed items</p>
                                                </div>
                                                <div class="mp-filter-container">
                                                    <select id="statusFilter" class="mp-filter-select">
                                                        <option value="all">All Status</option>
                                                        <option value="pending">Pending</option>
                                                        <option value="approved">Ready for Pickup</option>
                                                        <option value="borrowed">Borrowed</option>
                                                        <option value="returned">Returned</option>
                                                        <option value="overdue">Overdue</option>
                                                    </select>
                                                    <div class="mp-search" style="margin: 0; max-width: 300px;">
                                                        <span class="material-symbols-outlined">search</span>
                                                        <input type="text" id="historySearch"
                                                            placeholder="Search history...">
                                                    </div>
                                                </div>
                                            </div>
                                            <% if (history !=null && !history.isEmpty()) { %>
                                                <div style="overflow-x:auto;">
                                                    <table class="mp-table">
                                                        <thead>
                                                            <tr>
                                                                <th>Item Details</th>
                                                                <th class="text-nowrap">Borrowed</th>
                                                                <th class="text-nowrap">Approved</th>
                                                                <th class="text-nowrap">Due Date</th>
                                                                <th class="text-nowrap">Returned</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="historyTableBody">
                                                            <% for (BorrowRecordDTO r : history) { boolean
                                                                isOverdue="BORROWED" .equalsIgnoreCase(r.getStatus()) &&
                                                                r.getReturn_date()==null && r.getDue_date() !=null &&
                                                                r.getDue_date().toLocalDate().isBefore(today); String
                                                                statusValue=isOverdue ? "overdue" :
                                                                r.getStatus().toLowerCase(); %>
                                                                <tr class="history-row"
                                                                    data-title="<%= r.getBook_title().toLowerCase() %>"
                                                                    data-id="<%= r.getBorrow_id() %>"
                                                                    data-status="<%= statusValue %>">
                                                                    <td>
                                                                        <div class="mp-item-cell">
                                                                            <div class="mp-item-thumb">
                                                                                <% if (r.getCoverImage() !=null &&
                                                                                    !r.getCoverImage().isEmpty()) { %>
                                                                                    <img src="<%= r.getCoverImage() %>"
                                                                                        alt="<%= r.getBook_title() %>">
                                                                                    <% } else { %>
                                                                                        <span
                                                                                            class="material-symbols-outlined"
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
                                                                    <td class="text-nowrap">
                                                                        <%= r.getPickup_date() !=null ?
                                                                            r.getPickup_date().toString() :
                                                                            (r.getRequest_date() !=null ?
                                                                            r.getRequest_date().toString() : "N/A" ) %>
                                                                    </td>
                                                                    <td class="text-nowrap">
                                                                        <%= r.getApproval_date() !=null ?
                                                                            r.getApproval_date().toString() : "—" %>
                                                                    </td>
                                                                    <td class="text-nowrap">
                                                                        <%= r.getDue_date() !=null ?
                                                                            r.getDue_date().toString() : "—" %>
                                                                    </td>
                                                                    <td class="text-nowrap">
                                                                        <%= r.getReturn_date() !=null ?
                                                                            r.getReturn_date().toString() : "—" %>
                                                                    </td>
                                                                    <td>
                                                                        <span class="mp-badge mp-badge-<%=
                                                                    isOverdue ? "red" :
                                                                            ("RETURNED".equalsIgnoreCase(r.getStatus())
                                                                            ? "green" :
                                                                            ("APPROVED".equalsIgnoreCase(r.getStatus())
                                                                            ? "green" :
                                                                            ("BORROWED".equalsIgnoreCase(r.getStatus())
                                                                            ? "blue" : "yellow" ))) %>">
                                                                            <% if (isOverdue) { %>
                                                                                <span class="material-symbols-outlined"
                                                                                    style="font-size:14px;">warning</span>
                                                                                <% } %>
                                                                                    <%= isOverdue ? "OVERDUE" :
                                                                                        ("APPROVED".equalsIgnoreCase(r.getStatus())
                                                                                        ? "READY FOR PICKUP" :
                                                                                        r.getStatus()) %>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <% if
                                                                            ("RETURNED".equalsIgnoreCase(r.getStatus())
                                                                            && (reviewedBookIds==null ||
                                                                            !reviewedBookIds.contains(r.getBook_id())))
                                                                            { %>
                                                                            <a href="Portal?action=writeReview&book_id=<%= r.getBook_id() %>"
                                                                                class="mp-btn mp-btn-ghost">
                                                                                <span
                                                                                    class="material-symbols-outlined">rate_review</span>
                                                                                Review
                                                                            </a>
                                                                            <% } else { %>
                                                                                <span
                                                                                    class="mp-btn mp-btn-ghost disabled">—</span>
                                                                                <% } %>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <script>
                                                    const historySearch = document.getElementById('historySearch');
                                                    const statusFilter = document.getElementById('statusFilter');
                                                    const rows = document.querySelectorAll('.history-row');

                                                    function filterHistory() {
                                                        const query = historySearch.value.toLowerCase();
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

                                                        let noResults = document.getElementById('noResultsRowHistory');
                                                        if (visibleCount === 0) {
                                                            if (!noResults) {
                                                                noResults = document.createElement('tr');
                                                                noResults.id = 'noResultsRowHistory';
                                                                noResults.innerHTML = '<td colspan="7" style="text-align:center;padding:48px;color:var(--mp-gray-500);"><span class="material-symbols-outlined" style="font-size:48px;color:var(--mp-gray-300);">search_off</span><p style="margin-top:12px;">No matching history found</p></td>';
                                                                document.getElementById('historyTableBody').appendChild(noResults);
                                                            } else {
                                                                noResults.style.display = '';
                                                            }
                                                        } else if (noResults) {
                                                            noResults.style.display = 'none';
                                                        }
                                                    }

                                                    historySearch.addEventListener('input', filterHistory);
                                                    statusFilter.addEventListener('change', filterHistory);
                                                </script>
                                                <% } else { %>
                                                    <div
                                                        style="padding:48px;text-align:center;color:var(--mp-gray-500);">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size:48px;color:var(--mp-gray-300);">history</span>
                                                        <p style="margin-top:12px;">No borrowing history yet</p>
                                                    </div>
                                                    <% } %>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </body>

                        </html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, Models.BorrowRecordDTO, Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); List<BorrowRecordDTO> pendingRequests = (List
            <BorrowRecordDTO>) request.getAttribute("pendingRequests");
                String alertMsg = (String) session.getAttribute("alertMessage");
                if (alertMsg != null) { session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); }
                %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Pending Requests - Library Portal</title>
                    <link rel="stylesheet"
                        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                    <link rel="stylesheet" href="member-portal.css">
                </head>

                <body class="mp-page">
                    <jsp:include page="MemberHeader.jsp" />
                    <main class="mp-container">
                        <% if (alertMsg !=null) { %>
                            <div
                                style="background:var(--mp-green-50);border:1px solid var(--mp-green-200);color:var(--mp-green-700);padding:12px 16px;border-radius:8px;margin-bottom:16px;font-size:0.875rem;display:flex;align-items:center;gap:8px;">
                                <span class="material-symbols-outlined" style="font-size:18px;">check_circle</span>
                                <%= alertMsg %>
                            </div>
                            <% } %>
                                <ol class="mp-breadcrumb">
                                    <li><a href="Portal?action=home"><span class="material-symbols-outlined">home</span>
                                            Home</a></li>
                                    <li><span class="material-symbols-outlined">chevron_right</span></li>
                                    <li><a href="Portal?action=dashboard">Borrowing</a></li>
                                    <li><span class="material-symbols-outlined">chevron_right</span></li>
                                    <li><span class="current">Pending Requests</span></li>
                                </ol>
                                <div class="mp-layout">
                                    <aside class="mp-sidebar">
                                        <div class="mp-sidebar-card">
                                            <nav class="mp-sidebar-nav">
                                                <a href="Portal?action=dashboard"><span
                                                        class="material-symbols-outlined">dashboard</span> Overview</a>
                                                <a href="Portal?action=loans"><span
                                                        class="material-symbols-outlined">book</span> Current Loans</a>
                                                <a href="Portal?action=requests" class="active"><span
                                                        class="material-symbols-outlined">hourglass_empty</span> Pending
                                                    Requests <span class="nav-badge">
                                                        <%= pendingRequests !=null ? pendingRequests.size() : 0 %>
                                                    </span></a>
                                                <a href="Portal?action=history"><span
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
                                                    <h2>Pending Requests</h2>
                                                    <p>Track the status of your book requests</p>
                                                </div>
                                                <div class="mp-filter-container">
                                                    <select id="statusFilter" class="mp-filter-select">
                                                        <option value="all">All Status</option>
                                                        <option value="pending">Processing</option>
                                                        <option value="approved">Ready for Pickup</option>
                                                    </select>
                                                    <div class="mp-search" style="margin: 0; max-width: 300px;">
                                                        <span class="material-symbols-outlined">search</span>
                                                        <input type="text" id="requestSearch"
                                                            placeholder="Search requests...">
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="requestListBody">
                                                <% if (pendingRequests !=null && !pendingRequests.isEmpty()) { for
                                                    (BorrowRecordDTO r : pendingRequests) { boolean isReady="APPROVED"
                                                    .equalsIgnoreCase(r.getStatus()); String badgeClass=isReady
                                                    ? "mp-badge-green" : "mp-badge-yellow" ; String statusLabel=isReady
                                                    ? "Ready for Pickup" : "Processing" ; String
                                                    statusValue=r.getStatus().toLowerCase(); %>
                                                    <div class="mp-request-item"
                                                        data-title="<%= r.getBook_title().toLowerCase() %>"
                                                        data-id="<%= r.getBorrow_id() %>"
                                                        data-status="<%= statusValue %>">
                                                        <div class="mp-request-content">
                                                            <div class="mp-request-cover">
                                                                <% if (r.getCoverImage() !=null &&
                                                                    !r.getCoverImage().isEmpty()) { %>
                                                                    <img src="<%= r.getCoverImage() %>"
                                                                        alt="<%= r.getBook_title() %>"
                                                                        style="width:100%;height:100%;object-fit:cover;border-radius:4px;">
                                                                    <% } else { %>
                                                                        <span class="material-symbols-outlined"
                                                                            style="font-size:40px;color:var(--mp-gray-400);">menu_book</span>
                                                                        <% } %>
                                                            </div>
                                                            <div class="mp-request-details">
                                                                <div class="mp-request-header">
                                                                    <div>
                                                                        <h3>
                                                                            <%= r.getBook_title() %>
                                                                        </h3>
                                                                        <p>Borrow #<%= r.getBorrow_id() %>
                                                                        </p>
                                                                    </div>
                                                                    <span class="mp-badge <%= badgeClass %>">
                                                                        <%= statusLabel %>
                                                                    </span>
                                                                </div>
                                                                <div class="mp-request-meta">
                                                                    <div><span class="meta-label">Requested
                                                                            On</span><span class="meta-value">
                                                                            <%= r.getRequest_date() !=null ?
                                                                                r.getRequest_date().toString() : "N/A"
                                                                                %>
                                                                        </span></div>
                                                                    <div><span class="meta-label">Location</span><span
                                                                            class="meta-value">
                                                                            <%= r.getLocation() !=null ? r.getLocation()
                                                                                : "Main Library" %>
                                                                        </span></div>
                                                                    <% if (r.getApproval_date() !=null) { %>
                                                                        <div><span class="meta-label">Approved
                                                                                On</span><span class="meta-value">
                                                                                <%= r.getApproval_date().toString() %>
                                                                            </span></div>
                                                                        <% } %>
                                                                </div>
                                                                <div class="mp-request-footer">
                                                                    <a href="Portal?action=bookDetail&id=<%= r.getBook_id() %>"
                                                                        class="mp-btn mp-btn-outline">
                                                                        View Details
                                                                    </a>
                                                                    <% if ("PENDING".equalsIgnoreCase(r.getStatus())) {
                                                                        %>
                                                                        <a href="Portal?action=cancelRequest&id=<%= r.getBorrow_id() %>"
                                                                            class="mp-btn mp-btn-danger"
                                                                            onclick="return confirm('Are you sure you want to cancel this request?')">
                                                                            Cancel Request
                                                                        </a>
                                                                        <% } %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } %>
                                            </div>
                                            <script>
                                                const requestSearch = document.getElementById('requestSearch');
                                                const statusFilter = document.getElementById('statusFilter');
                                                const items = document.querySelectorAll('.mp-request-item');

                                                function filterRequests() {
                                                    const query = requestSearch.value.toLowerCase();
                                                    const status = statusFilter.value;
                                                    let visibleCount = 0;

                                                    items.forEach(item => {
                                                        const title = item.getAttribute('data-title');
                                                        const id = item.getAttribute('data-id');
                                                        const rowStatus = item.getAttribute('data-status');

                                                        const matchesQuery = title.includes(query) || id.includes(query);
                                                        const matchesStatus = status === 'all' || rowStatus === status;

                                                        if (matchesQuery && matchesStatus) {
                                                            item.style.display = '';
                                                            visibleCount++;
                                                        } else {
                                                            item.style.display = 'none';
                                                        }
                                                    });

                                                    let noResults = document.getElementById('noResultsCard');
                                                    if (visibleCount === 0) {
                                                        if (!noResults) {
                                                            noResults = document.createElement('div');
                                                            noResults.id = 'noResultsCard';
                                                            noResults.style.padding = '48px';
                                                            noResults.style.textAlign = 'center';
                                                            noResults.style.color = 'var(--mp-gray-500)';
                                                            noResults.innerHTML = '<span class="material-symbols-outlined" style="font-size:48px;color:var(--mp-gray-300);">search_off</span><p style="margin-top:12px;">No matching requests found</p>';
                                                            document.getElementById('requestListBody').appendChild(noResults);
                                                        } else {
                                                            noResults.style.display = '';
                                                        }
                                                    } else if (noResults) {
                                                        noResults.style.display = 'none';
                                                    }
                                                }

                                                requestSearch.addEventListener('input', filterRequests);
                                                statusFilter.addEventListener('change', filterRequests);
                                            </script>
                                            <% } else { %>
                                                <div style="padding:48px;text-align:center;color:var(--mp-gray-500);">
                                                    <span class="material-symbols-outlined"
                                                        style="font-size:48px;color:var(--mp-gray-300);">hourglass_empty</span>
                                                    <p style="margin-top:12px;">No pending requests</p>
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
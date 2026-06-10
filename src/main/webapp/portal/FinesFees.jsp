<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, Models.FineDTO, Models.Member" %>

        <% Member user=(Member) session.getAttribute("user"); List<FineDTO> memberFines = (List<FineDTO>)
                request.getAttribute("memberFines");
                double totalBalance = (Double) request.getAttribute("totalBalance");
                %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Fines & Fees - Library Portal</title>

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
                            <li><span class="current">Fines & Fees</span></li>
                        </ol>

                        <div class="mp-layout">

                            <aside class="mp-sidebar">
                                <div class="mp-sidebar-card">
                                    <nav class="mp-sidebar-nav">

                                        <a href="Portal?action=dashboard">
                                            <span class="material-symbols-outlined">dashboard</span> Overview
                                        </a>

                                        <a href="Portal?action=loans">
                                            <span class="material-symbols-outlined">book</span> Current Loans
                                        </a>

                                        <a href="Portal?action=requests">
                                            <span class="material-symbols-outlined">hourglass_empty</span> Pending
                                            Requests
                                        </a>

                                        <a href="Portal?action=history">
                                            <span class="material-symbols-outlined">history</span> Borrowing History
                                        </a>

                                        <a href="Portal?action=fines" class="active">
                                            <span class="material-symbols-outlined">payments</span> Fines & Fees
                                        </a>

                                    </nav>
                                </div>
                            </aside>

                            <div class="mp-content">

                                <div class="mp-card">

                                    <div class="mp-card-header">
                                        <div>
                                            <h2>Fines & Fees</h2>
                                            <p>Manage your outstanding fines and payments</p>
                                        </div>

                                        <div class="mp-balance-header">
                                            <span class="mp-balance-label">Total Balance:</span>
                                            <span class="mp-balance-amount">
                                                $<%= String.format("%.2f", totalBalance) %>
                                            </span>
                                        </div>
                                    </div>

                                    <% if (memberFines !=null && !memberFines.isEmpty()) { %>

                                        <div style="overflow-x:auto;">

                                            <table class="mp-table">

                                                <thead>
                                                    <tr>
                                                        <th>Fine Details</th>
                                                        <th>Due Date</th>
                                                        <th>Return Date</th>
                                                        <th>Overdue Days</th>
                                                        <th>Amount</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <% for (FineDTO f : memberFines) { String
                                                        badgeClass="mp-badge-green" ; String icon="check_circle" ;
                                                        String iconBg="var(--mp-green-50)" ; String
                                                        iconColor="var(--mp-green-600)" ; if
                                                        ("Unpaid".equalsIgnoreCase(f.getStatus())) {
                                                        badgeClass="mp-badge-red" ; icon="warning" ;
                                                        iconBg="var(--mp-red-50)" ; iconColor="var(--mp-red-600)" ; }
                                                        else if ("Pending (Estimated)".equalsIgnoreCase(f.getStatus())
                                                        || "Pending" .equalsIgnoreCase(f.getStatus())) {
                                                        badgeClass="mp-badge-yellow" ; icon="schedule" ;
                                                        iconBg="var(--mp-yellow-50)" ; iconColor="var(--mp-yellow-600)"
                                                        ; } %>

                                                        <tr>

                                                            <td>
                                                                <div class="mp-item-cell">

                                                                    <div class="mp-fine-icon"
                                                                        style="background:<%= iconBg %>;">
                                                                        <span class="material-symbols-outlined"
                                                                            style="color:<%= iconColor %>; font-size:20px;">
                                                                            <%= icon %>
                                                                        </span>
                                                                    </div>

                                                                    <div>
                                                                        <div class="mp-item-title">
                                                                            <%= f.getMemberName() %>
                                                                        </div>

                                                                        <div class="mp-item-isbn">
                                                                            Fine #<%= f.getFine_id() %> |
                                                                                Borrow #<%= f.getBorrow_id() %>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </td>

                                                            <td>
                                                                <%= f.getDueDate() !=null ? f.getDueDate() : "N/A" %>
                                                            </td>

                                                            <td>
                                                                <%= f.getReturnDate() !=null ? f.getReturnDate() : "—"
                                                                    %>
                                                            </td>

                                                            <td class="text-bold text-red">
                                                                <%= f.getOverdueDays() %> days
                                                            </td>

                                                            <td class="text-bold">
                                                                $<%= String.format("%.2f", f.getAmount()) %>
                                                            </td>

                                                            <td>
                                                                <span class="mp-badge <%= badgeClass %>">
                                                                    <%= f.getStatus() %>
                                                                </span>
                                                            </td>

                                                        </tr>

                                                        <% } %>

                                                </tbody>

                                            </table>

                                        </div>

                                        <div
                                            style="margin-top:24px; padding:16px; background:var(--mp-gray-50); border-radius:12px; border:1px solid var(--mp-gray-100); display:flex; align-items:center; gap:12px;">
                                            <span class="material-symbols-outlined"
                                                style="color:var(--mp-gray-500);">info</span>

                                            <p style="font-size:0.875rem; color:var(--mp-gray-600); margin:0;">
                                                <strong>Note:</strong>
                                                "Pending (Estimated)" fines are calculated based on currently overdue
                                                books.
                                                These amounts will be finalized when you return the items.
                                            </p>
                                        </div>

                                        <% } else { %>

                                            <div style="padding:48px;text-align:center;color:var(--mp-gray-500);">

                                                <span class="material-symbols-outlined"
                                                    style="font-size:48px;color:var(--mp-green-600);">
                                                    check_circle
                                                </span>

                                                <p style="margin-top:12px;font-weight:600;color:var(--mp-green-700);">
                                                    All clear! No fines.
                                                </p>

                                                <p style="margin-top:4px;">
                                                    You have no outstanding fines or fees.
                                                </p>

                                            </div>

                                            <% } %>

                                </div>

                            </div>

                        </div>

                    </main>

                </body>

                </html>
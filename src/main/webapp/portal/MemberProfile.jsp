<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); Member member=(Member) request.getAttribute("member"); if
            (member==null) member=user; int activeLoansCount=(Integer) request.getAttribute("activeLoansCount"); int
            pendingCount=(Integer) request.getAttribute("pendingCount"); int historyCount=(Integer)
            request.getAttribute("historyCount"); String avatarUrl="https://ui-avatars.com/api/?name=" +
            java.net.URLEncoder.encode(member.getMember_name(), "UTF-8" ) + "&background=137fec&color=fff&size=128" ;
            String alertMsg=(String) session.getAttribute("alertMessage"); if (alertMsg !=null) {
            session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>My Profile - Library Portal</title>
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
                                <li><a href="Portal?action=profile">Profile</a></li>
                                <li><span class="material-symbols-outlined">chevron_right</span></li>
                                <li><span class="current">Overview</span></li>
                            </ol>

                            <div class="mp-layout">
                                <!-- Sidebar -->
                                <aside class="mp-sidebar">
                                    <div class="mp-sidebar-card">
                                        <div class="mp-sidebar-profile">
                                            <div class="mp-sidebar-avatar">
                                                <img src="<%= avatarUrl %>" alt="Profile">
                                            </div>
                                            <h2
                                                style="font-size: 1.125rem; font-weight: 700; color: var(--mp-gray-900); margin: 0;">
                                                <%= member.getMember_name() %>
                                            </h2>
                                            <p
                                                style="font-size: 0.8125rem; color: var(--mp-gray-500); margin: 4px 0 12px;">
                                                <%= member.getMembership_id() %>
                                            </p>
                                            <div class="mp-badge mp-badge-green"
                                                style="display: inline-flex; font-size: 0.75rem;">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 14px;">check_circle</span> Active Account
                                            </div>
                                        </div>
                                        <nav class="mp-sidebar-nav">
                                            <a href="Portal?action=profile" class="active"><span
                                                    class="material-symbols-outlined">person</span> Overview</a>
                                            <a href="Portal?action=updateProfile"><span
                                                    class="material-symbols-outlined">edit_square</span> Update
                                                Profile</a>
                                            <a href="Portal?action=changePassword"><span
                                                    class="material-symbols-outlined">lock</span> Change Password</a>
                                        </nav>
                                    </div>
                                </aside>

                                <!-- Content -->
                                <div class="mp-content">
                                    <!-- Quick Stats -->
                                    <div class="mp-stats-grid mp-stats-grid-3" style="margin-bottom:24px;">
                                        <div class="mp-stat-card">
                                            <div class="mp-stat-icon blue"><span
                                                    class="material-symbols-outlined">book</span></div>
                                            <div>
                                                <p class="mp-stat-label">Current Loans</p>
                                                <p class="mp-stat-value">
                                                    <%= activeLoansCount %>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="mp-stat-card">
                                            <div class="mp-stat-icon orange"><span
                                                    class="material-symbols-outlined">hourglass_empty</span></div>
                                            <div>
                                                <p class="mp-stat-label">Pending Requests</p>
                                                <p class="mp-stat-value">
                                                    <%= pendingCount %>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="mp-stat-card">
                                            <div class="mp-stat-icon green"><span
                                                    class="material-symbols-outlined">history</span></div>
                                            <div>
                                                <p class="mp-stat-label">Books Read</p>
                                                <p class="mp-stat-value">
                                                    <%= historyCount %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Personal Information -->
                                    <div class="mp-card" style="margin-bottom:24px;">
                                        <div class="mp-card-header">
                                            <h2>Personal Information</h2>
                                            <a href="Portal?action=updateProfile" class="mp-btn mp-btn-ghost"><span
                                                    class="material-symbols-outlined">edit</span> Edit</a>
                                        </div>
                                        <div class="mp-card-body">
                                            <dl class="mp-info-grid">
                                                <div>
                                                    <dt>Full Name</dt>
                                                    <dd>
                                                        <%= member.getMember_name() %>
                                                    </dd>
                                                </div>
                                                <div>
                                                    <dt>Membership ID</dt>
                                                    <dd>
                                                        <%= member.getMembership_id() !=null ? member.getMembership_id()
                                                            : "N/A" %>
                                                    </dd>
                                                </div>
                                                <div>
                                                    <dt>Email Address</dt>
                                                    <dd>
                                                        <%= member.getEmail() %>
                                                    </dd>
                                                </div>
                                                <div>
                                                    <dt>Phone Number</dt>
                                                    <dd>
                                                        <%= member.getPhone_number() !=null ? member.getPhone_number()
                                                            : "Not set" %>
                                                    </dd>
                                                </div>
                                            </dl>
                                        </div>
                                    </div>

                                    <!-- Library Card -->
                                    <div class="mp-card">
                                        <div class="mp-card-header">
                                            <h2>Library Card Details</h2>
                                        </div>
                                        <div class="mp-card-detail-row">
                                            <div class="mp-library-card">
                                                <div class="circle-1"></div>
                                                <div class="circle-2"></div>
                                                <div class="mp-library-card-content">
                                                    <div class="mp-library-card-top">
                                                        <div class="mp-library-card-logo">
                                                            <span class="material-symbols-outlined">menu_book</span>
                                                            LIBRARY PORTAL
                                                        </div>
                                                        <span class="material-symbols-outlined"
                                                            style="opacity:0.8;">contactless</span>
                                                    </div>
                                                    <div>
                                                        <p class="mp-library-card-name-label">Member Name</p>
                                                        <p class="mp-library-card-holder">
                                                            <%= member.getMember_name().toUpperCase() %>
                                                        </p>
                                                    </div>
                                                    <div class="mp-library-card-bottom">
                                                        <div>
                                                            <p class="mp-library-card-number-label">Card Number</p>
                                                            <p class="mp-library-card-number">
                                                                <%= member.getMembership_id() !=null ?
                                                                    member.getMembership_id() : "N/A" %>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mp-card-info" style="display: flex; gap: 24px;">
                                                <dl>
                                                    <div>
                                                        <dt>Card Status</dt>
                                                        <dd><span class="mp-badge mp-badge-green"><span
                                                                    class="material-symbols-outlined">check_circle</span>
                                                                Active</span></dd>
                                                    </div>
                                                    <div>
                                                        <dt>Member ID</dt>
                                                        <dd>
                                                            <%= member.getMembership_id() !=null ?
                                                                member.getMembership_id() : "N/A" %>
                                                        </dd>
                                                    </div>
                                                </dl>
                                                <% if (request.getAttribute("qrCodeBase64") != null) { %>
                                                <div style="text-align: center; background: white; padding: 8px; border-radius: 8px; border: 1px solid var(--mp-gray-200);">
                                                    <img src="data:image/png;base64,<%= request.getAttribute("qrCodeBase64") %>" alt="Digital Member Card QR Code" style="width: 120px; height: 120px;" />
                                                    <p style="font-size: 0.75rem; color: var(--mp-gray-500); margin-top: 4px; font-weight: 500;">Scan at Kiosk</p>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </main>
            </body>

            </html>
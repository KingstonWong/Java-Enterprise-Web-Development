<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); String alertMsg=(String)
            session.getAttribute("alertMessage"); String alertType=(String) session.getAttribute("alertType"); if
            (alertMsg !=null) { session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Profile - Library Portal</title>
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                <link rel="stylesheet" href="member-portal.css">
            </head>

            <body class="mp-page">
                <jsp:include page="MemberHeader.jsp" />

                <main class="mp-container">
                    <!-- Breadcrumb -->
                    <ol class="mp-breadcrumb">
                        <li><a href="Portal?action=home"><span class="material-symbols-outlined">home</span> Home</a>
                        </li>
                        <li><span class="material-symbols-outlined">chevron_right</span></li>
                        <li><a href="Portal?action=profile">Profile</a></li>
                        <li><span class="material-symbols-outlined">chevron_right</span></li>
                        <li><span class="current">Update Profile</span></li>
                    </ol>

                    <div class="mp-layout">
                        <!-- Sidebar -->
                        <aside class="mp-sidebar">
                            <div class="mp-card" style="border-radius: 12px; overflow: hidden;">
                                <div class="mp-sidebar-profile">
                                    <div class="mp-sidebar-avatar">
                                        <img src="https://ui-avatars.com/api/?name=<%= user.getMember_name().replace(" ", " +") %>&background=137fec&color=fff&size=128" alt="Profile Picture">
                                        <!-- <label class="mp-avatar-upload" title="Change Photo">
                                            <span class="material-symbols-outlined">photo_camera</span>
                                        </label> -->
                                    </div>
                                    <h2
                                        style="font-size: 1.125rem; font-weight: 700; color: var(--mp-gray-900); margin: 0;">
                                        <%= user.getMember_name() %>
                                    </h2>
                                    <p style="font-size: 0.8125rem; color: var(--mp-gray-500); margin: 4px 0 12px;">
                                        <%= user.getMembership_id() %>
                                    </p>
                                    <div class="mp-badge mp-badge-green"
                                        style="display: inline-flex; font-size: 0.75rem;">
                                        <span class="material-symbols-outlined"
                                            style="font-size: 14px;">check_circle</span> Active Account
                                    </div>
                                </div>
                                <nav class="mp-sidebar-nav" style="padding: 8px;">
                                    <a href="Portal?action=profile"><span
                                            class="material-symbols-outlined">person</span> Overview</a>
                                    <a href="Portal?action=updateProfile" class="active"><span
                                            class="material-symbols-outlined">edit_square</span> Update Profile</a>
                                    <a href="Portal?action=changePassword"><span
                                            class="material-symbols-outlined">lock</span> Change Password</a>
                                </nav>
                            </div>
                        </aside>

                        <!-- Main Content Form -->
                        <div class="mp-content">
                            <div class="mp-card">
                                <div class="mp-card-header">
                                    <div>
                                        <h2>Update Profile</h2>
                                        <p>Manage your personal information and contact details</p>
                                    </div>
                                </div>

                                <div class="mp-card-body">
                                    <% if (alertMsg !=null) { %>
                                        <div class="mp-badge mp-badge-<%= " success".equals(alertType) ? "green" : "red"
                                            %>"
                                            style="width: 100%; justify-content: flex-start; margin-bottom: 24px;
                                            padding: 12px 16px;">
                                            <span class="material-symbols-outlined">
                                                <%= "success" .equals(alertType) ? "check_circle" : "error" %>
                                            </span>
                                            <%= alertMsg %>
                                        </div>
                                        <% } %>

                                            <form action="Portal?action=doUpdateProfile" method="post"
                                                class="mp-form-stack">
                                                <!-- Personal Information Section -->
                                                <section style="margin-bottom: 32px;">
                                                    <h3
                                                        style="font-size: 1rem; font-weight: 700; color: var(--mp-gray-900); margin-bottom: 20px; display: flex; align-items: center; gap: 8px;">
                                                        <span class="material-symbols-outlined"
                                                            style="color: var(--mp-primary);">badge</span>
                                                        Personal Information
                                                    </h3>
                                                    <div class="mp-grid-2">
                                                        <div>
                                                            <label class="mp-form-label">Full Name</label>
                                                            <input type="text" name="member_name"
                                                                value="<%= user.getMember_name() %>"
                                                                class="mp-form-control" required>
                                                        </div>
                                                        <div>
                                                            <label class="mp-form-label">Phone Number</label>
                                                            <div style="position: relative;">
                                                                <span class="material-symbols-outlined"
                                                                    style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); font-size: 20px; color: var(--mp-gray-400);">call</span>
                                                                <input type="tel" name="phone_number"
                                                                    value="<%= user.getPhone_number() %>"
                                                                    class="mp-form-control" style="padding-left: 40px;"
                                                                    required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>

                                                <hr
                                                    style="border: 0; border-top: 1px solid var(--mp-gray-100); margin: 32px 0;">

                                                <!-- Contact Information Section -->
                                                <section style="margin-bottom: 32px;">
                                                    <h3
                                                        style="font-size: 1rem; font-weight: 700; color: var(--mp-gray-900); margin-bottom: 20px; display: flex; align-items: center; gap: 8px;">
                                                        <span class="material-symbols-outlined"
                                                            style="color: var(--mp-primary);">contact_mail</span>
                                                        Account Details
                                                    </h3>
                                                    <div class="mp-grid-2">
                                                        <div>
                                                            <label class="mp-form-label">Email Address</label>
                                                            <div style="position: relative;">
                                                                <span class="material-symbols-outlined"
                                                                    style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); font-size: 20px; color: var(--mp-gray-400);">mail</span>
                                                                <input type="email" name="email"
                                                                    value="<%= user.getEmail() %>"
                                                                    class="mp-form-control" style="padding-left: 40px;"
                                                                    required>
                                                            </div>
                                                            <p class="mp-form-hint">This email will be used for your
                                                                account notifications</p>
                                                        </div>
                                                        <div>
                                                            <label class="mp-form-label">Membership ID</label>
                                                            <div style="position: relative;">
                                                                <span class="material-symbols-outlined"
                                                                    style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); font-size: 20px; color: var(--mp-gray-400);">fingerprint</span>
                                                                <input type="text"
                                                                    value="<%= user.getMembership_id() %>"
                                                                    class="mp-form-control"
                                                                    style="padding-left: 40px; background: var(--mp-gray-50);"
                                                                    disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>

                                                <div
                                                    style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 40px; padding-top: 24px; border-top: 1px solid var(--mp-gray-100);">
                                                    <a href="Portal?action=dashboard"
                                                        class="mp-btn mp-btn-ghost">Discard Changes</a>
                                                    <button type="submit" class="mp-btn mp-btn-primary"
                                                        style="padding: 12px 32px;">
                                                        <span class="material-symbols-outlined"
                                                            style="font-size: 20px;">save</span> Save Changes
                                                    </button>
                                                </div>
                                            </form>
                                </div>
                            </div>

                            <!-- Security Tip -->
                            <div
                                style="margin-top: 24px; background: #eff6ff; border: 1px solid #dbeafe; border-radius: 12px; padding: 16px; display: flex; gap: 12px;">
                                <span class="material-symbols-outlined"
                                    style="color: var(--mp-primary);">security</span>
                                <div>
                                    <h4 style="font-size: 0.875rem; font-weight: 700; color: #1e3a8a; margin: 0;">
                                        Security Tip</h4>
                                    <p style="font-size: 0.8125rem; color: #1e40af; margin: 4px 0 0;">Keep your password
                                        strong and update it regularly to ensure your account remains secure.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </body>

            </html>
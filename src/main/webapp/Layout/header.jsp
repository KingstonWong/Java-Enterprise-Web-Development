<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.Member" %>
        <% Object userObj=session.getAttribute("user"); String role=(String) session.getAttribute("role"); String
            currentUserName="Guest" ; String currentUserEmail="" ; if (userObj !=null) { if (userObj instanceof
            Models.Member) { Models.Member m=(Models.Member) userObj; currentUserName=m.getMember_name();
            currentUserEmail=m.getEmail(); } else { currentUserName=userObj.toString(); } if ("admin".equals(role)) {
            currentUserEmail="admin@gmail.com" ; } } String initials="" ; if (currentUserName !=null &&
            !currentUserName.isEmpty()) { String[] parts=currentUserName.split(" ");
        for (int i = 0; i < parts.length && i < 2; i++) {
            if (!parts[i].isEmpty()) initials += parts[i].charAt(0);
        }
    }
    if (initials.isEmpty()) initials = " U"; initials=initials.toUpperCase(); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Library Management System</title>
                <link rel="stylesheet" href="styles.css">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
            </head>

            <body>
                <div class="app-layout">
                    <aside class="sidebar">
                        <div class="sidebar-header">
                            <div class="sidebar-logo">
                                <span class="material-symbols-outlined">book_2</span>
                            </div>
                            <span class="sidebar-title">LibriSphere</span>
                        </div>
                        <nav class="sidebar-nav">
                            <a class="nav-link <%= request.getRequestURI().endsWith(" Index") ||
                                request.getRequestURI().endsWith("AdminDashboard.jsp") ? "active" : "" %>"
                                href="Index">
                                <span class="material-symbols-outlined">dashboard</span>
                                <span>Dashboard</span>
                            </a>
                            <a class="nav-link <%= request.getRequestURI().contains(" Members") ? "active" : "" %>"
                                href="Members?action=list">
                                <span class="material-symbols-outlined">group</span>
                                <span>Members</span>
                            </a>
                            <a class="nav-link <%= request.getRequestURI().contains(" Books") ? "active" : "" %>"
                                href="Books?action=list">
                                <span class="material-symbols-outlined">library_books</span>
                                <span>Books</span>
                            </a>
                            <a class="nav-link <%= request.getRequestURI().contains(" Borrow") && "list"
                                .equals(request.getParameter("action")) ? "active" : "" %>"
                                href="Borrow?action=list">
                                <span class="material-symbols-outlined">book_2</span>
                                <span>Loans</span>
                            </a>
                            <a class="nav-link <%= request.getRequestURI().contains(" Borrow") && "pending"
                                .equals(request.getParameter("action")) ? "active" : "" %>"
                                href="Borrow?action=pending">
                                <span class="material-symbols-outlined">pending_actions</span>
                                <span>Pending Requests</span>
                            </a>
                            <a class="nav-link <%= request.getRequestURI().contains(" Fines") ? "active" : "" %>"
                                href="Fines?action=list">
                                <span class="material-symbols-outlined">payments</span>
                                <span>Fines</span>
                            </a>
                        </nav>
                        <div class="sidebar-footer">
                            <% if (userObj !=null) { %>
                                <div class="sidebar-user">
                                    <div class="sidebar-user-avatar">
                                        <%= initials %>
                                    </div>
                                    <div class="sidebar-user-info">
                                        <div class="sidebar-user-name">
                                            <%= currentUserName %>
                                        </div>
                                        <div class="sidebar-user-email">
                                            <%= currentUserEmail %>
                                        </div>
                                    </div>
                                </div>
                                <a href="Logout" class="btn-logout">
                                    <span class="material-symbols-outlined">logout</span>
                                    <span>Log Out</span>
                                </a>
                                <% } else { %>
                                    <a href="user-login" class="btn-primary"
                                        style="width: 100%; justify-content: center;">
                                        <span class="material-symbols-outlined">login</span>
                                        <span>Sign In</span>
                                    </a>
                                    <% } %>
                        </div>
                    </aside>
                    <main class="main-content">
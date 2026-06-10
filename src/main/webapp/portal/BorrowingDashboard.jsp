<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, Models.BorrowRecordDTO, Models.Member"%>

<%
Member user = (Member) session.getAttribute("user");

List<BorrowRecordDTO> activeLoans = (List<BorrowRecordDTO>) request.getAttribute("activeLoans");
List<BorrowRecordDTO> allRecords = (List<BorrowRecordDTO>) request.getAttribute("allRecords");
List<BorrowRecordDTO> history = (List<BorrowRecordDTO>) request.getAttribute("history");

Integer pendingObj = (Integer) request.getAttribute("pendingCount");
Integer overdueObj = (Integer) request.getAttribute("overdueCount");
Double finesObj = (Double) request.getAttribute("finesBalance");

int pendingCount = (pendingObj != null) ? pendingObj : 0;
int overdueCount = (overdueObj != null) ? overdueObj : 0;
double finesBalance = (finesObj != null) ? finesObj : 0.0;

int loansCount = (activeLoans != null) ? activeLoans.size() : 0;
int historyCount = (history != null) ? history.size() : 0;

String firstName = "Member";
if (user != null && user.getMember_name() != null) {
    String[] nameParts = user.getMember_name().split(" ");
    if (nameParts.length > 0) {
        firstName = nameParts[0];
    }
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Borrowing Dashboard - Library Portal</title>

<link rel="stylesheet"
href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

<link rel="stylesheet" href="member-portal.css">

</head>

<body class="mp-page">

<jsp:include page="MemberHeader.jsp"/>

<main class="mp-container">

<ol class="mp-breadcrumb">
<li>
<a href="Portal?action=home">
<span class="material-symbols-outlined">home</span> Home
</a>
</li>

<li><span class="material-symbols-outlined">chevron_right</span></li>
<li><span class="current">Borrowing</span></li>
<li><span class="material-symbols-outlined">chevron_right</span></li>

<li>
<span class="current" style="color:var(--mp-gray-900);font-weight:600;">
Dashboard
</span>
</li>
</ol>


<div class="mp-layout">

<!-- Sidebar -->
<aside class="mp-sidebar">

<div class="mp-sidebar-card">

<nav class="mp-sidebar-nav">

<a href="Portal?action=dashboard" class="active">
<span class="material-symbols-outlined">dashboard</span>
Overview
</a>

<a href="Portal?action=loans">
<span class="material-symbols-outlined">book</span>
Current Loans
</a>

<a href="Portal?action=requests">

<div style="display:flex;align-items:center;justify-content:space-between;width:100%;">

<div style="display:flex;align-items:center;gap:12px;">
<span class="material-symbols-outlined">hourglass_empty</span>
Pending Requests
</div>

<span class="nav-badge">
<%= pendingCount %>
</span>

</div>

</a>

<a href="Portal?action=history">
<span class="material-symbols-outlined">history</span>
Borrowing History
</a>

<a href="Portal?action=fines">
<span class="material-symbols-outlined">payments</span>
Fines & Fees
</a>

</nav>

</div>

</aside>


<!-- Main Content -->
<div class="mp-content">

<div class="mp-mb-8">

<h1 style="font-size:1.5rem;font-weight:700;color:var(--mp-gray-900);">
Borrowing Dashboard
</h1>

<p style="font-size:0.875rem;color:var(--mp-gray-500);margin-top:4px;">
Welcome back, <%= firstName %>! Here's an overview of your library activity.
</p>

</div>


<!-- Overview Cards -->
<div class="mp-stats-grid" style="margin-bottom:32px;">


<a href="Portal?action=loans" class="mp-stat-card">

<div class="mp-stat-card-header">

<div class="mp-stat-icon blue">
<span class="material-symbols-outlined">book</span>
</div>

<span class="mp-stat-value">
<%= loansCount %>
</span>

</div>

<h3 class="mp-stat-label">Current Loans</h3>

<p style="font-size:0.75rem;color:var(--mp-red-500);font-weight:600;margin-top:4px;">
<%= overdueCount %> Overdue
</p>

</a>


<a href="Portal?action=requests" class="mp-stat-card">

<div class="mp-stat-card-header">

<div class="mp-stat-icon purple">
<span class="material-symbols-outlined">hourglass_empty</span>
</div>

<span class="mp-stat-value">
<%= pendingCount %>
</span>

</div>

<h3 class="mp-stat-label">Pending Requests</h3>

<p style="font-size:0.75rem;color:var(--mp-gray-500);margin-top:4px;">
<%= (pendingCount > 0) ? pendingCount + " Ready for pickup" : "No active requests" %>
</p>

</a>


<a href="Portal?action=history" class="mp-stat-card">

<div class="mp-stat-card-header">

<div class="mp-stat-icon green">
<span class="material-symbols-outlined">history</span>
</div>

<span class="mp-stat-value">
<%= historyCount %>
</span>

</div>

<h3 class="mp-stat-label">Items Borrowed</h3>

<p style="font-size:0.75rem;color:var(--mp-gray-500);margin-top:4px;">
Lifetime total
</p>

</a>


<a href="Portal?action=fines" class="mp-stat-card">

<div class="mp-stat-card-header">

<div class="mp-stat-icon red">
<span class="material-symbols-outlined">payments</span>
</div>

<span class="mp-stat-value">
$<%= String.format("%.2f", finesBalance) %>
</span>

</div>

<h3 class="mp-stat-label">Fines & Fees</h3>

<p style="font-size:0.75rem;color:var(--mp-red-500);font-weight:600;margin-top:4px;">
<%= (finesBalance > 0) ? "Action required" : "Clear balance" %>
</p>

</a>

</div>



<!-- Recent Activity -->
<div class="mp-card" style="overflow:hidden;">

<div class="mp-card-header" style="border-bottom:1px solid var(--mp-gray-100);">

<h2 style="font-size:1.125rem;font-weight:700;">Recent Activity</h2>

<a href="Portal?action=history"
class="mp-view-all"
style="font-size:0.875rem;font-weight:500;color:var(--mp-primary);">
View All
</a>

</div>


<div class="mp-activity-list">

<%
List<BorrowRecordDTO> recentActivity =
(List<BorrowRecordDTO>) request.getAttribute("recentActivity");

if (recentActivity != null && !recentActivity.isEmpty()) {

int count = 0;

for (BorrowRecordDTO record : recentActivity) {

if (count >= 5) break;
count++;

String iconName = "book";
String iconBg = "blue";

String statusDesc = "You checked out \"" + record.getBook_title() + "\".";

java.util.Date displayDate = record.getRequest_date();


if ("RETURNED".equalsIgnoreCase(record.getStatus())) {

iconName = "check_circle";
iconBg = "green";

statusDesc = "You successfully returned \"" + record.getBook_title() + "\".";

if (record.getReturn_date() != null)
displayDate = record.getReturn_date();

}

else if ("PENDING".equalsIgnoreCase(record.getStatus())) {

iconName = "hourglass_empty";
iconBg = "orange";

statusDesc = "Your request for \"" + record.getBook_title() + "\" is being processed.";

}

else if ("APPROVED".equalsIgnoreCase(record.getStatus())) {

iconName = "check_circle";
iconBg = "purple";

statusDesc = "Book \"" + record.getBook_title() + "\" is ready for pickup.";

if (record.getApproval_date() != null)
displayDate = record.getApproval_date();

}

else if ("BORROWED".equalsIgnoreCase(record.getStatus())) {

if (record.getPickup_date() != null)
displayDate = record.getPickup_date();

if (record.getDue_date() != null &&
record.getDue_date().before(new java.util.Date())) {

iconName = "warning";
iconBg = "red";

statusDesc = "Item Overdue: \"" + record.getBook_title() + "\". Please return it as soon as possible.";

}

}
%>


<div class="mp-activity-item"
style="display:flex;align-items:flex-start;gap:16px;padding:24px;border-bottom:1px solid var(--mp-gray-50);">

<div class="mp-stat-icon <%= iconBg %>"
style="width:40px;height:40px;border-radius:50%;flex-shrink:0;margin-top:4px;">

<span class="material-symbols-outlined" style="font-size:18px;">
<%= iconName %>
</span>

</div>


<div style="flex:1;">

<p style="font-size:0.875rem;font-weight:600;color:var(--mp-gray-900);">
<%= "warning".equals(iconName) ? "Overdue: " : "" %>
<%= record.getBook_title() %>
</p>

<p style="font-size:0.875rem;color:var(--mp-gray-500);margin-top:4px;line-height:1.5;">
<%= statusDesc %>
</p>

<span style="font-size:0.75rem;color:var(--mp-gray-400);margin-top:8px;display:block;">
<%= (displayDate != null) ? displayDate.toString() : "" %>
</span>

</div>

</div>

<%
}
}
else {
%>

<div style="padding:48px;text-align:center;color:var(--mp-gray-500);">

<span class="material-symbols-outlined"
style="font-size:48px;color:var(--mp-gray-300);">
inbox
</span>

<p style="margin-top:12px;">No recent activity</p>

</div>

<%
}
%>

</div>

</div>

</div>

</div>

</main>

</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.*" %>
<%
    Member getMem = (Member) session.getAttribute("user");
    if (getMem == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<%-- 
    Document   : out
    Created on : 8/11/2019, 09:21:57 AM
    Author     : Jeobany
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession ss = request.getSession();
    ss.invalidate();
    response.sendRedirect("index.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>¡BYE!</h1>
    </body>
</html>

<%-- 
    Document   : cash1
    Created on : 20 Apr, 2017, 6:49:22 PM
    Author     : Ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% session.setAttribute("transaction","cash");; 
       response.sendRedirect("cash");
    %>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
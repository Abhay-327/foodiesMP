<%-- 
    Document   : end
    Created on : 23 Apr, 2017, 5:29:03 PM
    Author     : Ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank You</title>
    </head>
    <body>
        <%  String name = (String) session.getAttribute("name");
            int total =  (int) session.getAttribute("total");
            String transaction = (String) session.getAttribute("transaction");
        %>
        <h1> Thanks for your visit <%= name %>....Hope you visit again</h1>
        <br><br>
        <h2> Your total amount is Rs.<%= total %></h2>
        <br><br>
        <h3> Please note down your transaction id i.e <%= transaction %> and go to the cash counter </h3>>
        <% session.invalidate(); %>
        
    </body>
</html>

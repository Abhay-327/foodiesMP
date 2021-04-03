<%-- 
    Document   : check
    Created on : 20 Apr, 2017, 4:55:58 PM
    Author     : RAVI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection"%>
<%@page import="com.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%! // ResultSet rs=null;%>
           
         <%= request.getParameter("trans") %>
         <%
                   new connection();
                   try {
                 connection.st.executeUpdate("update kitchen set status='delivered' where transaction='"+request.getParameter("trans")+"'");
                //   rs=connection.st.executeQuery("select * from cashier where transaction='"+request.getParameter("trans")+"'");
                 //  while(rs.next())
               //                          {

         //out.println(rs.getString("name"));
         //out.println(rs.getInt("total"));
           //                              }
                  response.sendRedirect("kitchen.jsp");
                   
                   }
                   catch(Exception e)
                   {
                       
                   }
                   
         %>
    </body>
</html>

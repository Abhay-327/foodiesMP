

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
           
         <%= request.getParameter("trans1") %>
         <%
                   new connection();
                   try {
                 connection.st.executeUpdate("update payments set status='paid' where transaction='"+request.getParameter("trans1")+"'");
                                    //   rs=connection.st.executeQuery("select * from cashier where transaction='"+request.getParameter("trans")+"'");
                 //  while(rs.next())
               //                          {

         //out.println(rs.getString("name"));
         //out.println(rs.getInt("total"));
           //                              }
                  response.sendRedirect("cashcounter.jsp");
                   
                   }
                   catch(Exception e)
                   {
                       
                   }
                   
         %>
    </body>
</html>

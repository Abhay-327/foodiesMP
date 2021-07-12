

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
           
         <% String t=request.getParameter("trans");  %>
         <%
                   new connection();
                   try {
                       String str="Update orders set order_status='delivered' where cust_id IN"+"("+"Select cust_id from payments where transaction='"+t+"')";
                       //Update orders set order_status="delivered" where cust_id IN"+"("+"Select cust_id from payments where transaction='"+t+"')
                 connection.st.executeUpdate(str);
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

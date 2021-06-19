<%-- 
    Document   : CASH
    Created on : May 13, 2021, 12:09:16 PM
    Author     : Abhay
--%>
<%@page import="com.dbconnect"%>
<%@page import="java.sql.*,java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CASH</title>
    </head>
    <body>
        <%
            String name= (String)session.getAttribute("Name");
            String phone=(String)session.getAttribute("Phone");
            String email=(String)session.getAttribute("Email");
            String address=(String)session.getAttribute("Address");
            String tableno=(String)session.getAttribute("Table");
            int total=(int)session.getAttribute("total");
            String list=(String)session.getAttribute("list");
            String status="unpaid";
            Date dat=new Date();
            String date=dat.toString();
            String transaction="";
            String method=(String)session.getAttribute("transaction");
            long transac=(long) Math.ceil(Math.random()*10000+1000);
            switch (method) {
            case "creditcard":
                {
                    String k="CRE";
                    String l=Long.toString(transac);
                    transaction= k+l;
                    status="Paid";
                    break;
                }
            case "debitcard":
                {
                    String k="DB";
                    String l=Long.toString(transac);
                    transaction= k+l;
                    status="Paid";
                    break;
                }
            case "cash":
                {
                    String k="CA";
                    String l=Long.toString(transac);
                    transaction= k+l;
                    break;
                }
            case "paytm":
                {
                    String k="PAY";
                    String l=Long.toString(transac);
                    transaction= k+l;
                    break;
                }
        }
            
            
            
            out.print(" "+name);
            out.println(" "+phone);
            out.print(" "+email);
            out.print(" "+address);
            out.print(" "+tableno);
            
            out.print(" "+transaction);
            out.print(" "+total);
            out.print(" "+date);
            out.print(" "+status);
            
            out.print(" "+list);
            /*Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodies","root","root");
             PreparedStatement stmt = conn.prepareStatement("insert into customer (name,phone,email,address,table_no) values(?,?,?,?,?)");
            stmt.setString(1,name);
            stmt.setString(2,phone);
            stmt.setString(3,email);
            stmt.setString(4,address);
            stmt.setString(5,tableno);
            stmt.executeUpdate();*/
            
            Connection con1=(Connection)dbconnect.getConnect();
            Statement st=con1.createStatement();
            String sql="insert into customer (name,phone,email,address,table_no) values('"+name+"','"+phone+"','"+email+"','"+address+"','"+tableno+"')";
            String sql1="insert into payments (transaction,total,date,status) values('"+transaction+"',"+total+",'"+date+"','"+status+"')";
            String sql2="insert into orders (list,order_status) values('"+list+"','pending')";
            st.executeUpdate(sql);
            st.executeUpdate(sql1);
            st.executeUpdate(sql2);
            
            
            session.setAttribute("date", date);
            session.setAttribute("status", status);
            
            session.setAttribute("transaction", transaction);
            response.sendRedirect("end.jsp");
            
        %>
    </body>
</html>

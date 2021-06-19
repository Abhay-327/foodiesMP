/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abhay
 */
public class cass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session= request.getSession(false);
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
            
            Connection con1=(Connection)dbconnect.getConnect();
            Statement st=con1.createStatement();
            String sql="insert into customer (name,phone,email,address,table_no) values('"+name+"','"+phone+"','"+email+"','"+address+"',"+tableno+")";
            String sql1="insert into payments (transaction,total,date,status) values('"+transaction+"',"+total+",'"+date+"','"+status+"')";
            String sql2="insert into orders (list,order_status) values('"+list+",'pending')";
            st.executeUpdate(sql);
            st.executeUpdate(sql1);
            st.executeUpdate(sql2);
            
            
            session.setAttribute("date", date);
            session.setAttribute("status", status);
            
            session.setAttribute("transaction", transaction);
            response.sendRedirect("end.jsp");
            
         
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(cass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(cass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

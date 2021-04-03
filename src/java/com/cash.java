/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.util.Date;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ayush
 */
public class cash extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session= request.getSession(false);
        String name = (String) session.getAttribute("name");
        int total =  (int) session.getAttribute("total");
        request.setAttribute("name",name);
        request.setAttribute("total",total);
         
        String method=(String) session.getAttribute("transaction");
        String status="Unpaid";
        Date dat = new Date();
        String date=dat.toString();
        long transac=(long) Math.ceil(Math.random()*10000+1000);
        String transaction="";
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
         Connection con1=(Connection)dbconnect.getConnect();
         Statement st=con1.createStatement();
         out.print("f");
         String sql="insert into cashier (name,transaction,total,date,status) values('"+name+"','"+transaction+"',"+total+",'"+date+"','"+status+"')";
         st.executeUpdate(sql);
        session.setAttribute("transaction",transaction);
        String str1=(String) session.getAttribute("list");
         String sql1="insert into kitchen (name,transaction,list,status) values('"+name+"','"+transaction+"','"+str1+"','pending')";
         st.executeUpdate(sql1);
        
        
         
         response.sendRedirect("end.jsp");
        
            
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
            Logger.getLogger(cash.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cash.class.getName()).log(Level.SEVERE, null, ex);
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


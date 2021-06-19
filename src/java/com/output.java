/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;
import java.sql.*;

/**
 *
 * @author Ayush
 */
public class output {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        Connection con1=(Connection)dbconnect.getConnect();
         Statement st=con1.createStatement();
            ResultSet rs=st.executeQuery("select * from menu");
  
   
   int arr[]=new int[100];
   int i=1;
   while(rs.next()){
       System.out.println(rs.getInt(3));
   }
   //for(int j=1;j<=12;j++)
           // System.out.println(arr[j]);
        // TODO code application logic here
    }
    
}

package com;


import java.sql.*;
import java.sql.DriverManager;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NIKITA
 */
public class connection {
    public static Connection conn=null;
public static Statement st=null;
public static int s=0,reco=0;
public static String inum=null;
    public connection(){
    
            
     try{
            Class.forName("com.mysql.jdbc.Driver");
             conn=DriverManager.getConnection("jdbc:mysql://localhost/foodies","root","root");
            st = conn.createStatement();
     /*  st.execute("create table tcorders(Orderno Text,totalitems text,totalprice text,no text ,status text)");
            st.execute("create table corders(Orderno Text,totalitems text,totalprice text,no text ,status text)");
       st.execute("create table menu(Iname Text,Itype text,Price int,Remarks text,ino int)");
       st.execute("create table rec(Orderno Text,description text,totalprice text,no text,pmode text,status text,price text)");
       st.execute("create table kitchen(Orderno Text,totalitems text,no text,status text)");
       //st.execute("create table feedback()");
             System.out.println("ok");
              /*ResultSet rs=st.executeQuery("select * from tb2");
               int sr=1;         
            while(rs.next())
            {
            //model.addRow(new Object[]{sr++,rs.getString("SName"),rs.getString("Contact"),rs.getString("gender"),
               // rs.getString("age"),rs.getString("Address")});
            }*/
        }
          catch(Exception b)
          {
              System.out.println(b);
          }
         
    

}

public static void main(String args[])
{
new connection();
}
}

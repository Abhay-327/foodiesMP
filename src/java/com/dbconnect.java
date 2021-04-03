package com;

import java.sql.Connection;
import java.sql.DriverManager;
public class dbconnect
{
public static Connection getConnect()
{
  try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodies","root","root");
        return con;
    }catch(Exception e)
    {
        return null;
    }
    
}
}


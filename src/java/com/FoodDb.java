

package com;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class FoodDb {
   private HashMap database;
		private ArrayList al;
    private static FoodDb onlyInstance = null;
    
    public FoodDb() throws SQLException{
     
        database=new HashMap();
        Connection con1=(Connection)dbconnect.getConnect();
         Statement st=con1.createStatement();
            ResultSet rs=st.executeQuery("select * from menu");
            int i=1;
            while(rs.next()){
                
               FoodDetail foody= new FoodDetail(rs.getInt(1),rs.getString(2),rs.getInt(3));
               database.put(i,foody);
               i++;
               
            }
               al = new ArrayList(database.values());
                 
            
    }

    
    public static FoodDb instance ()  {
      if (onlyInstance == null)
        try {
            onlyInstance = new FoodDb();
      } catch (SQLException ex) {
          Logger.getLogger(FoodDb.class.getName()).log(Level.SEVERE, null, ex);
      }
      return onlyInstance;
   }


    public FoodDetail getFoodDetail(String foodId) {
        Integer key = new Integer(foodId);
        return (FoodDetail)database.get(key);
    }

    public Collection getFood() {
				return al;
    }

    public int getNumberOfFood() {
        return database.size();
    }
    
}

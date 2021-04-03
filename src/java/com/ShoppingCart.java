 
package com;

import java.util.*;
import com.FoodDetail;
import com.dbconnect.*;
 
public class ShoppingCart {
    
    HashMap items = null;
    int numberOfItems = 0;

    public ShoppingCart() {
        
        items = new HashMap();
    }
    

    public void add(String Id, FoodDetail food) {
        if(items.containsKey(Id)) {
            ShoppingCartItem scitem = (ShoppingCartItem) items.get(Id);
            scitem.incrementQuantity();
        } else {
            ShoppingCartItem newItem = new ShoppingCartItem(food);
            items.put(Id, newItem);
        }

        numberOfItems++;
    }

    public void remove(String Id) {
        if(items.containsKey(Id)) {
            ShoppingCartItem scitem = (ShoppingCartItem) items.get(Id);
            scitem.decrementQuantity();

            if(scitem.getQuantity() <= 0)
                items.remove(Id);

            numberOfItems--;
        }
    }

    public Collection getItems() {
        return items.values();
    }

    protected void finalize() throws Throwable {
        items.clear();
    }

    public int getNumberOfItems() {
        return numberOfItems;
    }
    public int getTotal() {
        int amount = 0;
      

        for(Iterator i = getItems().iterator(); i.hasNext(); ) {
            ShoppingCartItem item = (ShoppingCartItem) i.next();
            FoodDetail foodDetail = (FoodDetail) item.getItem();
           
            
            amount += item.getQuantity() * foodDetail.getPrice();
        }
        return amount;
    }

   // private double roundOff(double x) {
     //   long val = Math.round(x*100); // cents
       // return val/100.0;
    //}

    public void clear() {
        items.clear();
        numberOfItems = 0;
    }
}


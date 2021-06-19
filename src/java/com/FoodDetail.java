/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;





/**
 *
 * @author Ayush
 */
public class FoodDetail {
    private int s_no;
    private String name;
    private int price;
    

    public FoodDetail(int s_no, String name, int price) {
        this.s_no = s_no;
        this.name = name;
        this.price = price;
        
    }

    public int getS_no() {
        return s_no;
    }

    

    public String getName() {
        return name;
    }

    

    public int getPrice() {
        return price;
    }

    
}

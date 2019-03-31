//
//  Product.swift
//  ShoppingListApp
//
//  Created by Daphne Cheryl TAN (001034796) on 11/4/18.
//  Copyright © 2018 Daphne Cheryl TAN (001034796). All rights reserved.
//

import Foundation
public class Product {
    
    public var name: String
    public private(set)var price: Double
    public private(set)var type: String
    public private(set)var quantity: Int
    
    //default
    public init(){
        self.name = ""
        self.price = 0.00
        self.type = ""
        self.quantity = 0
    }
    
    public init(name: String, price: Double, type: String, quantity: Int){
        self.name = name
        self.price = price
        self.type = type
        self.quantity = quantity
    }
    
    func toString() ->String
    {
        return "Name: " + self.name + " Price: $" + String(format:"%0.1f", self.price) + " Type: " + self.type + " Quantity: " + String(format:"%d", self.quantity)
    }
    
    
}

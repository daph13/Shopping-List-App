//
//  SecondViewController.swift
//  ShoppingListApp
//
//  Created by Daphne Cheryl TAN (001034796) on 9/5/18.
//  Copyright © 2018 Daphne Cheryl TAN (001034796). All rights reserved.
//

import UIKit
import SQLite3

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var addItemLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var db: OpaquePointer? = nil
    
    func insertQuery(name:String, price:Double, type:String, quantity:Int){
        let insertSQL = "INSERT INTO productlist(name, price, type, quantity) VALUES ('\(name)', \(price), '\(type)', \(quantity))"
        print(insertSQL)
        var queryStatement: OpaquePointer? = nil
        if sqlite3_open(appDelegate.getDBPath(), &db) == SQLITE_OK
        {
            print("Sucessfully opened connection to database")
            
            if (sqlite3_prepare_v2(db, insertSQL, -1, &queryStatement, nil) == SQLITE_OK)
            {
                if sqlite3_step(queryStatement) == SQLITE_DONE
                {
                    print("Record Inserted!")
                    statusLabel.text = "Record Inserted!"
                }
                else
                {
                    print("Fail to Insert")
                }
                sqlite3_finalize(queryStatement)
            }
            else
            {
                print("Insert statement could not be prepared")
            }
            sqlite3_close(db)
        }
        else
        {
            print("Unable to open database")
        }
    }
    
    @IBAction func addItemClicked(_ sender: UIButton) {
        var productName:String?
        var productPrice:Double?
        var productType:String?
        var productQuantity:Int?
        productName = nameTextField.text
        productPrice = Double(priceTextField.text!)!
        productType = typeTextField.text
        productQuantity = NSString(string:quantityTextField.text!).integerValue
        if (nameTextField.text == ""){
            let alertController = UIAlertController (title:"Error", message: "The name of the product cannot be blank", preferredStyle:.alert)
            let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:nil)
        }
        else if (priceTextField.text == "" || productPrice! <= 0.00)
        {
            let alertController = UIAlertController (title:"Error", message: "Price must be a number", preferredStyle:.alert)
            let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:nil)
        }
       else if !(typeTextField.text == "Groceries" || typeTextField.text == "Electronics" || typeTextField.text == "Clothing" || typeTextField.text == "Other")
        {
            let alertController = UIAlertController (title:"Error", message: "Type must be 'Groceries', 'Electronics', 'Clothing' or 'Other'", preferredStyle:.alert)
            let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:nil)
        }
        else if(productQuantity! <= 0)
        {
            let alertController = UIAlertController (title:"Error", message: "Quantity must be more than 0", preferredStyle:.alert)
            let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:nil)
        }
        else {
        insertQuery(name: productName!, price: productPrice!, type: productType!, quantity: productQuantity!)
        let p = Product(name: productName!, price: productPrice!, type: productType!, quantity: productQuantity!)
        appDelegate.productArray.append(p)
        
        statusLabel.text = "Record Added"
        
        nameTextField.text = ""
        priceTextField.text = ""
        typeTextField.text = ""
        quantityTextField.text = ""
        }
    }
    
    //nameeofTextField.keyboardType = UIKeyboardType.decimalPad/alphabet
    
    override func viewDidLoad() {
        super.viewDidLoad()
         nameTextField.keyboardType = UIKeyboardType.alphabet
         priceTextField.keyboardType = UIKeyboardType.decimalPad
         typeTextField.keyboardType = UIKeyboardType.alphabet
         quantityTextField.keyboardType = UIKeyboardType.decimalPad
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Colour.sharedInstance.selectedColour
        addItemLabel.font = appDelegate.font
        addItemButton.titleLabel?.font = appDelegate.font
        statusLabel.font = appDelegate.font
    }

}


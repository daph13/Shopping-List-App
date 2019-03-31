//
//  FirstViewController.swift
//  ShoppingListApp
//
//  Created by Daphne Cheryl TAN (001034796) on 9/5/18.
//  Copyright © 2018 Daphne Cheryl TAN (001034796). All rights reserved.
//

import UIKit
import SQLite3

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var db: OpaquePointer? = nil
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let product:Product = appDelegate.productArray[indexPath.row]

        cell.textLabel!.text = product.name
        //cell.detailTextLabel!.numberOfLines = 2
        cell.detailTextLabel?.text = "Price: " + String(format:"$%.2f", product.price)
            + " Quantity: " + String(format:"%d", product.quantity) + " Category: " + product.type
        
        cell.textLabel!.font = appDelegate.font
        return cell

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if sqlite3_open(getDBPath(), &db) == SQLITE_OK{
            print("Sucessfully opened connection to database")
            //Run the select query
            selectQuery()
        }else{
            print("Unable to open database")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDBPath()->String
    {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDir = paths[0]
        let databasePath = (documentsDir as NSString).appendingPathComponent("product.db")
        return databasePath;
    }
    
    func selectQuery() {
        let selectQueryStatement = "SELECT * FROM productlist"
        var queryStatement: OpaquePointer? = nil
        if(sqlite3_prepare_v2(db, selectQueryStatement, -1, &queryStatement, nil) == SQLITE_OK)
        {
            print("Query Result:")
            while (sqlite3_step(queryStatement) == SQLITE_ROW)
            {
                let product_id = sqlite3_column_int(queryStatement, 0)
                let titleField = sqlite3_column_text(queryStatement, 1)
                let productName = String(cString: titleField!)
                let productPrice = Double(sqlite3_column_double(queryStatement, 2))
                let categoryField = sqlite3_column_text(queryStatement, 3)
                let productCategory = String(cString: categoryField!)
                let productQuantity = Int(sqlite3_column_int(queryStatement, 4))
                
                print("\(product_id) | \(productName) |\(productPrice)")
                let p = Product(name:productName, price:Double(productPrice), type:productCategory, quantity:Int(productQuantity))
                appDelegate.productArray.append(p)
            }
        }
        else
        {
            print("SELECT statement could not be prepared", terminator: "")
        }
        sqlite3_finalize(queryStatement)
        sqlite3_close(db)
    }
    
    func deleteQuery(name:String)
    {
        let deleteSQL = "DELETE FROM productlist WHERE name = ('\(name)')"
        print(deleteSQL)
        var queryStatement: OpaquePointer? = nil
        if sqlite3_open(appDelegate.getDBPath(), &db) == SQLITE_OK
        {
            print("Sucessfully opened connection to database", terminator: "")
            
            if(sqlite3_prepare_v2(db, deleteSQL, -1, &queryStatement, nil) == SQLITE_OK)
            {
                if sqlite3_step(queryStatement) == SQLITE_DONE
                {
                    print("Record Deleted!")
                }
                else
                {
                    print("Failed to Delete")
                }
                sqlite3_finalize(queryStatement)
            }
            else
            {
                print("Delete statement could not be prepared", terminator: "")
            }
            sqlite3_close(db)
        }
        else
        {
            print("Unable to open database", terminator: "")
        }
    }
    
    func updateQuery(newName:String, lookupName:String, price:Double, type:String, quantity:Int){
        //let updateSQL = "UPDATE productlist set('\(name)', \(price), '\(type)', \(quantity) WHERE name =  ('\(name)')"
        let updateSQL = "UPDATE productlist SET name ='\(newName)', price =\(price), type='\(type)', quantity=\(quantity) WHERE name=('\(lookupName)')"
        print(updateSQL)
        var queryStatement: OpaquePointer? = nil
        if sqlite3_open(appDelegate.getDBPath(), &db) == SQLITE_OK
        {
            print("Sucessfully opened connection to database")
            
            if (sqlite3_prepare_v2(db, updateSQL, -1, &queryStatement, nil) == SQLITE_OK)
            {
                if sqlite3_step(queryStatement) == SQLITE_DONE
                {
                    print("Record Updated!")
                }
                else
                {
                    print("Failed to Update")
                }
                sqlite3_finalize(queryStatement)
            }
            else
            {
                print("Update statement could not be prepared")
            }
            sqlite3_close(db)
        }
        else
        {
            print("Unable to open database")
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == UITableViewCellEditingStyle.delete){
            //Delete from DB
            let selectedItem: Product = appDelegate.productArray[indexPath.row]
            let name:String = selectedItem.name
            deleteQuery(name: name)
            //Remove from the array and the table
            appDelegate.productArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        var selectedValue: Int?
        selectedValue = indexPath.row
    
        let lookupProductName = self.appDelegate.productArray[selectedValue!].name
        let productPrice = String(format:"%.2f", self.appDelegate.productArray[selectedValue!].price)
        let type = self.appDelegate.productArray[selectedValue!].type
        let quantity = String(format:"%d", self.appDelegate.productArray[selectedValue!].quantity)
        
        let alertController = UIAlertController (title:"Your Selection", message: appDelegate.productArray[selectedValue!].name, preferredStyle:.alert)
        
        let alertAction = UIAlertAction(title: "Ok", style:.default) { (action: UIAlertAction) in
            let p = Product(name:alertController.textFields![0].text!, price:Double(alertController.textFields![1].text!)!,type: alertController.textFields![2].text!, quantity: Int(alertController.textFields![3].text!)!)
            
            if (p.name == ""){
                let alertController = UIAlertController (title:"Error", message: "The name of the product cannot be blank", preferredStyle:.alert)
                let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion:nil)
            }else if (p.price <= 0.00)
            {
                let alertController = UIAlertController (title:"Error", message: "Price must be a number", preferredStyle:.alert)
                let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion:nil)
            }
            else if !(p.type == "Groceries" || p.type == "Electronics" || p.type == "Clothing" || p.type == "Other")
            {
                let alertController = UIAlertController (title:"Error", message: "Type must be 'Groceries', 'Electronics', 'Clothing' or 'Other'", preferredStyle:.alert)
                let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion:nil)
            }
            else if( p.quantity <= 0)
            {
                let alertController = UIAlertController (title:"Error", message: "Quantity must be more than 0", preferredStyle:.alert)
                let alertAction = UIAlertAction(title:"Ok", style:.default, handler:nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion:nil)
            }else
            {
            self.appDelegate.productArray.remove(at: selectedValue!)
            self.appDelegate.productArray.insert(p, at: selectedValue!)
            self.updateQuery(newName: p.name, lookupName: lookupProductName, price: p.price, type: p.type, quantity: p.quantity)
            self.shoppingListTableView.reloadData()
            //let indexPath = NSIndexPath(row: 0, section: 0)
            }
            
        }
   
        alertController.addTextField{
            (nameTextField: UITextField) in nameTextField.text = lookupProductName
            nameTextField.keyboardType = UIKeyboardType.alphabet
        }
        alertController.addTextField{
            (priceTextField: UITextField) in priceTextField.text = productPrice
            priceTextField.keyboardType = UIKeyboardType.decimalPad
        }
        alertController.addTextField{
            (typeTextField: UITextField) in typeTextField.text = type
            typeTextField.keyboardType = UIKeyboardType.alphabet
        }
        alertController.addTextField{
            (quantityTextField: UITextField) in quantityTextField.text = quantity
            quantityTextField.keyboardType = UIKeyboardType.decimalPad
        }
    
        let cancelAction = UIAlertAction(title:"Close",style:.cancel){_ in}
        alertController.addAction(cancelAction)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    
    
    
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shoppingListTableView.reloadData()
        view.backgroundColor = Colour.sharedInstance.selectedColour
        
    }

}


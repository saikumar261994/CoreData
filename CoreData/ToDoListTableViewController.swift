//
//  ToDoListTableViewController.swift
//  CoreData
//
//  Created by Bobby on 10/18/19.
//  Copyright © 2019 Solweaver. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var itemArray = ["Find Mike","Buy Eggos","Destroy Demorgan"]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let items = UserDefaults.standard.array(forKey: "itemArray") as? [String]{
            itemArray = items
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
        
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
         var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
               
               let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                   //what will happen once the user clicks the Add Item button on our UIAlert
                
                self.itemArray.append(textField.text!)
                self.tableView.reloadData()
                
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
            
        }
        alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        
    }
    
}

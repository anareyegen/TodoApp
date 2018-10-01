//
//  ViewController.swift
//  TodoApp
//
//  Created by Анара on 23.09.2018.
//  Copyright © 2018 Анара. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
            itemArray = items
        }
        
        let newItem = Item()
        newItem.title = "Find Dumbledore"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Fight Dementors"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Go To Posions Class"
        itemArray.append(newItem2)
    }
    
    //MARK - TableView data source methods
    
    // How many rows should be
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //it counts length if array
        return itemArray.count
    }
    
    // Asks the data source for a cell to insert in a particular location of the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // we set our sell to be cell with reusableItentifier we gave it
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
       
        let item = itemArray[indexPath.row]
        // set label of each cell to each item in the array
        cell.textLabel?.text = item.title
        
      cell.accessoryType = item.isChecked ?.checkmark : .none
        return cell
    }
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked
        
        
    
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    //MARK - Add new Items
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item to ToDo List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks add item button on our UIALert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            textField = alertTextField
            textField.placeholder = "Create new item"
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
  
    
    
}


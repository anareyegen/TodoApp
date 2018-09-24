//
//  ViewController.swift
//  TodoApp
//
//  Created by Анара on 23.09.2018.
//  Copyright © 2018 Анара. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Find Dumbldore", "Go to Hogesmid", "Call Sirius"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
       
        // set label of each cell to each item in the array
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
    
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
            self.itemArray.append(textField.text!)
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


//
//  ItemTableViewController.swift
//  ToDoListApp
//
//  Created by Fatima Zahra SEDKI on 14/3/2023.
//

import UIKit

class ItemTableViewController: UITableViewController {
    var items  = [Item]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleItems()
        navigationItem.leftBarButtonItem = editButtonItem
        // Load saved items
         if let savedItems = loadItems() {
           items += savedItems
         }
    }
    
    func loadSampleItems() {
        items += []
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath)
        as! ItemTableViewCell
        // Configure the cell...
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        return cell
    }
    
    @IBAction func unwindToList(sender: UIStoryboardSegue) {
        let srcViewCon = sender.source as? ViewController
        let item = srcViewCon?.item
        if  (srcViewCon != nil && item?.name != "") {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                items[selectedIndexPath.row] = item!
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
              }
              else {
            // Add a new item
            let newIndexPath = IndexPath(row: items.count, section: 0)
            items.append(item!)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
          }
            saveItems()
        }
    }
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
         items.remove(at: indexPath.row)
         saveItems()
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     
    
     
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! ViewController
            
            // Get the cell that generated this segue.
            if let selectedCell = sender as? ItemTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedItem = items[indexPath.row]
                detailVC.item = selectedItem
            }
        }
        else if segue.identifier == "AddItem" {
            
        }
    }
    
    func saveItems() {
       let isSaved = NSKeyedArchiver.archiveRootObject(items, toFile: Item.ArchiveURL.path)
       if !isSaved {
         print("Failed to save items...")
       }
    }
     //loading items
    func loadItems() -> [Item]? {
        return NSKeyedUnarchiver.unarchiveObject(
          withFile: Item.ArchiveURL.path) as? [Item]
    }
}

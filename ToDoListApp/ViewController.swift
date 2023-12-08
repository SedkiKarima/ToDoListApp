//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Fatima Zahra SEDKI on 8/3/2023.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var saveButton: UIBarButtonItem!
   @IBOutlet weak var LabelName: UILabel!
   @IBOutlet weak var TextFieldName: UITextField!
    
    var item: Item?
    
    override func viewDidLoad() {
      super.viewDidLoad()
        if let item = item {
            TextFieldName.text = item.name
         }
  }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if sender as AnyObject? === saveButton {
        let name = TextFieldName.text ?? ""
        item = Item(name: name)
      }
     }

    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
      
        let isInAddMode = presentingViewController is UINavigationController
         
        if isInAddMode {
          dismiss(animated: true, completion: nil)
        }
        else {
          navigationController!.popViewController(animated: true)
        }
    }
}


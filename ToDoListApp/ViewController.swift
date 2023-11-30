//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Fatima Zahra SEDKI on 8/3/2023.
//

import UIKit

class ViewController: UIViewController {
   var item: Item?
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if sender as AnyObject? === saveButton {
       let name = TextFieldName.text ?? ""
       item = Item(name: name)
     }
    }
 

    @IBOutlet weak var saveButton: UIBarButtonItem!
   @IBOutlet weak var LabelName: UILabel!
   @IBOutlet weak var TextFieldName: UITextField!
    override func viewDidLoad() {
      super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let item = item {
            TextFieldName.text = item.name
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


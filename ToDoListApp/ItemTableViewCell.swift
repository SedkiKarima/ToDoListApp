//
//  ItemTableViewCell.swift
//  ToDoListApp
//
//  Created by Fatima Zahra SEDKI on 14/3/2023.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   @IBOutlet weak var nameLabel: UILabel!
}

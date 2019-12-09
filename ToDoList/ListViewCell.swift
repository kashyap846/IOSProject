//
//  ListViewCell.swift
//  ToDoList
//
//  Created by Likhith P.s. on 2019-12-06.
//  Copyright © 2019 Kashyap K. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var completeBy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        print("setSelected table view cell")
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }

}

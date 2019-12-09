//
//  ViewController.swift
//  ToDoList
//
//  Created by Likhith P.s. on 2019-12-06.
//  Copyright © 2019 Kashyap K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var allList: ListDetails!
    var recentViewController = ListTableViewController()
    @IBOutlet weak var listtTitleLabel: UITextField!
   
    @IBOutlet weak var completeByLabel: UITextField!
    
   // @IBOutlet weak var datePcikerLabel: UIDatePicker!
    
    @IBAction func saveList(_ sender: Any) {
       // listtTitleLabel.
        allList = ListDetails()
        var list = List()
        if let text = listtTitleLabel.text{
            list.listTitle = text
            if let completeBytext = completeByLabel.text{
             list.completeBy = completeBytext
                recentViewController.allList.listArray.append(list)
                recentViewController.tableView.reloadData()
                
                navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


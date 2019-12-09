//
//  ListTableViewController.swift
//  ToDoList
//
//  Created by Likhith P.s. on 2019-12-06.
//  Copyright © 2019 Kashyap K. All rights reserved.
//

import UIKit
typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void
class ListTableViewController: UITableViewController {
    var allList: ListDetails!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
        navigationItem.leftBarButtonItem = editButtonItem
        setEditing(false, animated: true)
        print(allList.listArray.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("numberOfSections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("allList count")
        return allList.listArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        let allList1 = allList.listArray[indexPath.row]
        let view: UIView
        //view.backgroundColor = UIColor.blue
                //UIView.animate(withDuration: 0.5, animations: {cell?.alpha = 1})
        //cell?.selectedBackgroundView = view
        
        print(allList1.isCrossedOut)
        if(allList1.isCrossedOut){
          cell.listTitle.text = "❌" + " "+allList1.listTitle
            //cell.setSelected(true, animated: true)
            cell.setHighlighted(true, animated: true)
           // view.backgroundColor = UIColor.gray
                           //UIView.animate(withDuration: 0.5, animations: {cell?.alpha = 1})
            //cell.selectedBackgroundView = view
            cell.selectionStyle = .gray
            
            //cell.alpha = 2
        }else{
         cell.listTitle.text = allList1.listTitle
           // cell.alpha = 1
        }
        
        cell.completeBy.text = allList1.completeBy
        // Configure the cell...
        print("cell.listTitle.text \(cell.listTitle.text)")
        print("cell.alpha::\(cell.alpha)")
        
        
        //navigationItem.leftBarButtonItem = editButtonItem

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //for deleting and editing
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           print(".delete")
            let allList1 = allList.listArray[indexPath.row]
            print(allList1.listTitle)
            let title = "Delete \(allList1.listTitle)"
            let message = "Are you sure you want to delete the list?"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
           
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           
            alert.addAction(cancelAction)
           
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action) -> Void in self.allList.removeList(allList1)
                tableView.deleteRows(at: [indexPath], with: .automatic)})
            
                alert.addAction(deleteAction)
           
                present(alert,animated: true,completion: nil)
                
            
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationRowAt: IndexPath) {
        print("move")
        allList.moveList(from: fromIndexPath.row, to: destinationRowAt.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
//    required init?(coder aDecode: NSCoder) {
//        super.init(coder: aDecode)
//
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("prepare")
        switch segue.identifier {
        case "newListItem":
            let detailViewController = segue.destination as! ViewController
            detailViewController.recentViewController = self
        default:
            preconditionFailure("segue error")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("row selected \(indexPath.row)")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
       // cell.backgroundColor = UIColor.blue
//
        let cell = tableView.cellForRow(at: indexPath) as! ListViewCell
        //print("cell \(cell?.setHighlighted(true, animated: true))")
        //cell.accessoryType = .checkmark
       let view = UIView()
        print((cell.alpha))
        var titleText: String = cell.listTitle.text!
        if(allList.listArray[indexPath.row].isCrossedOut){
            print("unselect")
            //cell.layer.add(CAAnimation, forKey: <#T##String?#>)
            cell.setHighlighted(false, animated: false)
            cell.setSelected(false, animated: false)
            //cell.alpha = 1
            allList.listArray[indexPath.row].isCrossedOut = false
            titleText = titleText.replacingOccurrences(of: "❌", with: "")
          //  titleText.removeAll(where: "❌")
            cell.listTitle.text = titleText
            }
            
    else{print("making selected")
           // cell.alpha = 2
            allList.listArray[indexPath.row].isCrossedOut = true
            cell.setHighlighted(true, animated: true)
   cell.listTitle.text = "❌" + " " + titleText
            //cell?.setSelected(true, animated: true)
            //view.backgroundColor = UIColor.blue
                    //UIView.animate(withDuration: 0.5, animations: {cell?.alpha = 1})
            //cell?.selectedBackgroundView = view
            cell.selectionStyle = .gray
            
          //make animations
            
             
           
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height )
            
            UIView.animate(
                withDuration: 0.8,
                delay: 0.03 * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        print("after setting ::\(cell.alpha)")

        
        //print(self.allList.listArray[indexPath].listTitle)
        //tableView.didS
       // Cell.AccessoryType.checkmark//
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
       
        // cell.selectionStyle = UITableViewCellSelectionStyle
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
    }
    

}

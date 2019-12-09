//
//  List.swift
//  ToDoList
//
//  Created by Likhith P.s. on 2019-12-06.
//  Copyright © 2019 Kashyap K. All rights reserved.
//

import UIKit
class List: NSObject{
    var listTitle: String = ""
    var completeBy: String = ""
    var isCrossedOut: Bool = false
    
    let dateFormatter: DateFormatter={
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    override init(){
        //super.init()
    }
    
    init(listTitle: String, completeBy:String){
        self.listTitle = listTitle
       // self.completeBy = completeBy
        self.completeBy = completeBy
        //super.init()
        }
    
}

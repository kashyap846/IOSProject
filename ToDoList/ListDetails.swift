//
//  ListDetails.swift
//  ToDoList
//
//  Created by Kashyap K on 2019-12-06.
//  Copyright © 2019 Kashyap K. All rights reserved.
//

import UIKit
class ListDetails{
    
    var listArray: [List] = []
    init(){
        listArray = [List(listTitle: "shopping",completeBy: "dec 7th"),List(listTitle: "swimming", completeBy: "dec 7th"),List(listTitle: "running",completeBy: "dec 7th")]
    }
    
    func createNewList(list: List){
        listArray.append(list)
    }
    
    func removeList(_ list1: List){
        if let index =  listArray.firstIndex(of: list1){
        listArray.remove(at: index)
        }
    }
    
    func moveList(from fromIndex: Int, to toIndex: Int){
        let temp = listArray[fromIndex]
        listArray.remove(at: fromIndex)
        
        listArray.insert(temp, at: toIndex)
    }
}

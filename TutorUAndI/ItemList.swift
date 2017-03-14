//
//  ItemList.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/9/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation


// This file is not for controller use!



class ItemQueue
{
    private var items : [Item]
    private var restNum : Int
    private var enlargeStandard: Int
    
    init() {
        items = []
        restNum = 0
        enlargeStandard = 10
        // the queue will be enlarge until the number of items is greater than enlargeStandard.
    }
    
    func enqueue(_ item: Item)
    {
        items.append(item)
        restNum += 1
    }
    
    func dequeue() -> Item?
    {
        if items.startIndex == items.endIndex
        {
            return nil
        }
        let item = items[items.startIndex]
        items.removeFirst()
        restNum -= 1
        return item
    }
    
    func checkIfqueueNeedEnlarge() -> Bool
    {
        return restNum < enlargeStandard
    }
    
    
    func getAsList() -> [Item]
    {
        return items
    }
    
}

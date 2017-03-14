//
//  ItemsManager.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/5/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


let itemRef = FIRDatabase.database().reference().child("items")
// itemRef show the path where items stored.


class ItemManager
{
    static var item_queue = ItemQueue()
    
    
    class func addItem(_ major: String, _ course: String,  _ topic: String, _ discription: String) -> Bool
    {
        if !ErrorChecker.checkLogInState()
        {
            return false
        }
        let id = FIRAuth.auth()?.currentUser?.uid
        addItem(major, course, topic, discription, id!)
        return true
    }
    
    
    private class func addItem(_ major: String, _ course: String,  _ topic: String, _ discription: String, _ tutorID: String)
    {
        let item = Item.init(major, course, topic, discription, tutorID)
        item.storeInDataBase()
            {
                (path, name, value) in
                path.child(name).setValue(value)
        }
    }
    
    
    // This function should be called immediately after the user login.
    class func downloadItems()
    {
        itemRef.observe(.childAdded, with: {(snapshot) -> Void in
            let value = snapshot.value as? NSDictionary
            let major = value?["major"] as! String?
            let course = value?["course"] as! String?
            let topic = value?["topic"] as! String?
            let discription = value?["discription"] as! String?
            let tutorID = value?["tutorID"] as! String?
            
            
            if major == nil || course == nil || topic == nil || discription == nil || tutorID == nil
            {
                return
            }
            
            let item = Item(major!, course!, topic!, discription!, tutorID!)
            item_queue.enqueue(item)
            //print("loading... \(course!)")
        })
    }
    
    
    class func getItemOneByOne() -> Item?
    {
        return item_queue.dequeue()
    }
    
    
    class func getCourseNameList() -> [(String, Int)]
    {
        var list:[(String, Int)] = []
        var num = 0
        for x in item_queue.getAsList()
        {
            list.append((x.get_course(), num))
            num += 1
        }
        
        return list
    }
    
    
    class func getItemByListNumber(_ number: Int) -> Item?
    {
        let list = item_queue.getAsList()
        return list[number]
    }
}





/*
 
 
 Examples to use this file:
 
    ItemManager.downloadItems();
    // this function should be called immedately after login.
 
    ItemManager.addItem("major", "course", "topic", "discription", "tutorID")
    // use this function to add Items in database.
 
    let item = ItemManager.getItem();
    // use this function to load item ordred.
 
 */



/*
 This function will return a tuple which contains a String as course name and a Integer as a unique ID 
 to get item back from list. The reason to use a unique ID is because one course name can exist mutiple times
 int different table bars.
 
 To use function getCourseList()
 
    let list = ItemManager.getCourseList()
    print(list[0].0) // this will out put the first node's string part in the list.
 
 
 */




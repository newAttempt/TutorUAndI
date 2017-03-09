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


class Item
{
    private var course: String
    private var major: String
    private var topic: String
    private var discription: String
    private var tutorID: String
    
    init(_ major: String, _ course: String,  _ topic: String, _ discription: String, _ tutorID: String) {
        self.course = course
        self.major = major
        self.topic = topic
        self.discription = discription
        self.tutorID = tutorID
    }
    
    
    func storeInDataBase(_ pathFunc:(_ id: FIRDatabaseReference, _ name: String, _ value: String) -> ())
    {
        let path = itemRef.childByAutoId()
        pathFunc(path, "course", course)
        pathFunc(path, "major", major)
        pathFunc(path, "topic", topic)
        pathFunc(path, "discription", discription)
        pathFunc(path, "tutorID", tutorID)
    }
    
    
    func display()
    {
        print("course: \(course)")
        print("major: \(major)")
        print("topic: \(topic)")
        print("discription: \(discription)")
        print("tutorID: \(tutorID)")
    }
}


class ItemManager
{
    static var item_queue = ItemQueue()
    
    class func addItem(_ major: String, _ course: String,  _ topic: String, _ discription: String, _ tutorID: String)
    {
        let item = Item.init(major, course, topic, discription, tutorID)
        item.storeInDataBase()
            {
                (path, name, value) in
                path.child(name).setValue(value)
        }
    }
    
    class func enlargeQueue()
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
    
    
    class func getItem() -> Item?
    {
        return item_queue.dequeue()
    }
}



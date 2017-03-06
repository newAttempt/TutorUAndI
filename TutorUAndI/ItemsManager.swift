//
//  ItemsManager.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/5/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


class Item
{
    private var path: FIRDatabaseReference
    private var course: String
    private var major: String
    private var topic: String
    private var discription: String
    private var tutorID: String
    
    init(path: FIRDatabaseReference, _ major: String, _ course: String,  _ topic: String, _ discription: String, _ tutorID: String) {
        self.path = path
        self.course = course
        self.major = major
        self.topic = topic
        self.discription = discription
        self.tutorID = tutorID
    }
    
    
    func storeInDataBase(_ pathFunc:(_ id: FIRDatabaseReference, _ name: String, _ value: String) -> ())
    {
        pathFunc(path, "course", course)
        pathFunc(path, "major", major)
        pathFunc(path, "topic", topic)
        pathFunc(path, "discription", discription)
        pathFunc(path, "tutorID", tutorID)
    }
}


class ItemContainer
{
    private var items:[AnyClass]
    private var currentObjNum:Int
    
    init() {
        items = []
        currentObjNum = 0
    }
    
    func append(item:AnyClass)
    {
        items.append(item)
    }
    
    func getItem() -> AnyClass
    {
        currentObjNum += 1
        return items[currentObjNum - 1]
    }
}


class ItemAdder
{
    class func addItem(_ major: String, _ course: String,  _ topic: String, _ discription: String, _ tutorID: String)
    {
        let item = Item.init(path: FIRDatabase.database().reference().child("items").childByAutoId(), major, course, topic, discription, tutorID)
        item.storeInDataBase()
            {
                (path, name, value) in
                path.child(name).setValue(value)
        }
    }
}



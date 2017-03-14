//
//  Item.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/14/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


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
    
    
    func get_course() -> String
    {
        return course
    }
    
    
    func getItemAsDinctionary() -> [ String : String ]
    {
        let dinc = [ "course" : course,
                     "major"  : major,
                     "topic"  : topic,
                     "discription": discription,
                     "tutorID": tutorID
        ]
        return dinc
    }
    
}




/*
 Example to use getItemAsDinctionary()
    
    the return value of this function is a Dinctionary.
    which contains course, major, topic, discription, tutorID as key words.
    
    let item = Item(........)       // means initialized.
    let info = item.getItemAsDincintionary()
    print(info["course"])
    // for getting the name of tutor :
 
 
    let result = AccountInfo.getUserNameWithID(info["tutorID"])
    {
        (name) in
        ...                 // code to use name
    }
 
 */










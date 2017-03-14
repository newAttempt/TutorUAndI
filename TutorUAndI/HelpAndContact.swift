//
//  Help & Contact.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/3/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


class HelpAndContract
{
    private static var ref = FIRDatabase.database().reference()
    private static var auth = FIRAuth.auth()
    
    
    // In the completionhandler, the first string? is used to store the information got from this function.
    // The second string? is used to store the error message. Only one of them can be not nil and another one has to be nil.
    class func getHelpMessageAndContractInfo(completionHandler: @escaping (String?, String?) ->())
    {
        var logInWithAdmin = false
        if (auth?.currentUser == nil)           // log in with the Admin account if their is no uesr log in.
        {
            AccountSetting.logInAdminAccount()
                { (error) in
                    if error == nil
                    {
                        logInWithAdmin = true       // use this variable to mark if it is loged in with the Admin Account.
                    }
                    else
                    {
                        completionHandler(nil, "No account currently and connot log in Admin account!\nAdmin Log In: \(error!)")
                    }
            }
        }
        
        // Get the help and contact information through this function call.
        ref.child("HelpAndContact").child("offical").observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let info = snapshot.value as! String?
            if(info == nil)
            {
                // The inforation cannot be found in the database!.
                completionHandler(nil, "Cannot find any help and contact information from the database!")
            }
            else{
                completionHandler(info, nil)
            }
        })
        
        if logInWithAdmin       // log out the admin account to make sure it will not influence the other operation.
        {
            AccountSetting.logOut()
                {
                    (result) in
                    if !result
                    {
                        completionHandler(nil, "log out Admin account failed!")
                    }
            }
        }
    }
    
    
    class func grabTheMessage(_ name:String, _ email: String, _ message: String)
    {
        var logInWithAdmin = false
        if (auth?.currentUser == nil)           // log in with the Admin account if their is no uesr log in.
        {
            AccountSetting.logInAdminAccount()
                { (error) in
            }
            logInWithAdmin = true
        }
        let messageRef = ref.child("HelpAndContact").child("messages").childByAutoId()
        messageRef.child("name").setValue(name)
        messageRef.child("email").setValue(email)
        messageRef.child("message").setValue(message)
        
        if logInWithAdmin       // log out the admin account to make sure it will not influence the other operation.
        {
            AccountSetting.logOut()
                {
                    (result) in
            }
        }
    }
    
}





/*
 Examples to using this function.
 
 
 HelpAndContract.getHelpMessageAndContractInfo()
 {
 (info, error) in
 if(error == nil)
 {
 print(info!)
 }else{
 print(error!)
 }
 }
 
 */




//
//  AccountInfo.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/1/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase





class AccountInfo
{
    /*
     Example to use this function
     
        -- Have to logIn before addNewAccInfo
        -- **It will auto log in the new account after Sign Up
     
        AccountSetting.logInWithEmail("shan27@pdx.edu", "BIANhao5213"){(error) in
            print(error ?? "log in successfully!")
        }
     
        -- call the function
        let result = AccountInfo.addNewAccountBasicInfo("ZeyongShan", 1, "19941223", "shan27@pdx.edu")
        print(result)
     
     */
    
    class public func addNewAccountBasicInfo(_ name: String, _ gender: Int, _ dob: String, _ email:String) -> Bool
    {
        let ref = FIRDatabase.database().reference()
        let user = FIRAuth.auth()?.currentUser
        
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("name").setValue(name)
        ref.child("accInfo").child(user!.uid).child("gender").setValue(gender)
        ref.child("accInfo").child(user!.uid).child("dob").setValue(dob)
        ref.child("accInfo").child(user!.uid).child("email").setValue(email)
        return true
    }
}

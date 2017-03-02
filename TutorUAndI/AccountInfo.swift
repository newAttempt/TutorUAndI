//
//  AccountInfo.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/1/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

// =============Details in the end of the page!!!!!===============

import Foundation
import Firebase


class AccountInfo
{
    
    
    private static let ref = FIRDatabase.database().reference()
    private static let user = FIRAuth.auth()?.currentUser
    
    
    class func addNewAccountBasicInfo(_ name: String, _ gender: Int, _ dob: String, _ email:String) -> Bool
    {
        
        
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
    
    
    class func addNewAccountAddressInfo(_ stNo:String, _ streetName: String, _ apt:String, _ city: String, _ state: String, _ zip: Int) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("address").child("StNo").setValue(stNo)
        ref.child("accInfo").child(user!.uid).child("address").child("StName").setValue(streetName)
        ref.child("accInfo").child(user!.uid).child("address").child("Apt").setValue(apt)
        ref.child("accInfo").child(user!.uid).child("address").child("City").setValue(city)
        ref.child("accInfo").child(user!.uid).child("address").child("State").setValue(state)
        ref.child("accInfo").child(user!.uid).child("address").child("Zip").setValue(zip)
        return true
    }
    
    
    class func addNewAccountBankInfo(_ cardNo:String, _ expireDate4Digit:String, _ cardHolder:String) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("bank").child("cardNo").setValue(cardNo)
        ref.child("accInfo").child(user!.uid).child("bank").child("expDate").setValue(expireDate4Digit)
        ref.child("accInfo").child(user!.uid).child("bank").child("holder").setValue(cardHolder)
        return true
    }
    
    
    class func getAccountBasicInfo(completionHandler: @escaping (_ name:String?, _ gender:Int?, _ dob:String?, _ email:String?) -> ()) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as! String?
            let gender = value?["gender"] as! Int?
            let dob = value?["dob"] as! String?
            let email = value?["email"] as! String?
            completionHandler(name, gender, dob, email)
        })
        return true
    }
    
    
    class func getAccountAddressInfo(completionHandler: @escaping (_ streetNo: String?, _ streetName: String?, _ apt:String?, _ city:String?, _ state: String?, _ zip: Int?) -> ()) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("address").observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let strNo = value?["StNo"] as! String?
            let strName = value?["StName"] as! String?
            let apt = value?["Apt"] as! String?
            let city = value?["City"] as! String?
            let state = value?["State"] as! String?
            let zip = value?["Zip"] as! Int?
            completionHandler(strNo, strName, apt, city, state, zip)
        })
        return true
    }
    
    
    class func getAccountBankInfo(completionHandler: @escaping (_ replacedCardNo:String?, _ expireDate:String?, _ cardHolder:String?) -> ()) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("bank").observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            var cardNo = value?["cardNo"] as! String?
            let expireDate = value?["expDate"] as! String?
            let cardHolder = value?["holder"] as! String?
            

            if cardNo != nil
            {
                //delete first 12 characters.
                for _ in 0..<12
                {
                    cardNo?.remove(at: (cardNo?.startIndex)!)
                }
                //Insert XXXXXXXXXXXX before numbers.
                let temp = cardNo
                cardNo = "XXXXXXXXXXXX"
                cardNo?.append(temp!)
            }
            
            completionHandler(cardNo, expireDate, cardHolder)
        })
        return true
    }
    
}
















/*
 
 =========important=========
 it may not work if writing the log in part and getAccountInfo part together!
 because it cannot ensure that log in will be implement first!
 But it will work if user log in before like 1 second.
 =========important=========
 
 ======================================================================================================
 1.Examples :  addNewAccountBasicInfo
 
 
 -- Have to logIn before addNewAccInfo
 -- **It will auto log in the new account after Sign Up
 
 AccountSetting.logInWithEmail("shan27@pdx.edu", "BIANhao5213"){(error) in
 print(error ?? "log in successfully!")
 }
 
 -- call the function
 let result = AccountInfo.addNewAccountBasicInfo("ZeyongShan", 1, "YYYYMMDD(has to be 8 digits)", "shan27@pdx.edu")
 print(result)
 
 ======================================================================================================
 2.Examples :  addNewAccountAddressInfo
 
 
 -- Have to logIn before addNewAccInfo
 let result = AccountInfo.addNewAccountAddressInfo("ex.No", "ex.St", "ex.no", "exCity", "exState", 000000)
 print(result)
 
 
 ======================================================================================================
 3.Examples :   addNewAccountBankInfo
 
 let result = AccountInfo.addNewAccountBankInfo("Example card number", "MMYY(has to be 4 digits)")
 print(result)
 
 
 
 ======================================================================================================
 4.Examples :   getAccountBasicInfo
 
 -- Have to logIn before getAccountBasicInfo
 -- *All the arguments for completionHandler is optional.
 
 let result = AccountInfo.getAccountBasicInfo(completionHandler:
 { (name, gender, dob, email) in
 if name != nil
 {
 print("name is: \(name!)")
 }
 if gender != nil
 {
 print("gender is: \(gender!)")
 }
 if dob != nil
 {
 print("dob is: \(dob!)")
 }
 if email != nil
 {
 print("email is: \(email!))")
 }
 
 })
 -- The return value doesn't means we get the value, it only means the user already log in
 print(result)
 
 
 ======================================================================================================
 5.Examples :   getAccountAddressInfo
 
 
 let result = AccountInfo.getAccountAddressInfo()
 {(stNo, stName, apt, city, state, zip) in
 print(stNo ?? "nothing")
 print(stName ?? "nothing")
 print(apt ?? "nothing")
 print(city ?? "nothing")
 print(state ?? "nothing")
 print(zip ?? "nothing")
 
 }
 print(result)
 
 
 ======================================================================================================
 6.Examples :   getAccountBankInfo
 
 
 let result = AccountInfo.getAccountBankInfo()
 { (cardNo, expDate, holder) in
 print(cardNo ?? "nothing!!!")  -- already replaced first 12 digits with XXXXXXXXXXXX
 print(expDate ?? "nothing!!!")
 print(holder ?? "nothing!!!")
 }
 print(result)
 
 */


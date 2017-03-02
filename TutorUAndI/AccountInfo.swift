//
//  AccountInfo.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/1/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

/*
======================================================================================================
Examples :  addNewAccountBasicInfo


-- Have to logIn before addNewAccInfo
-- **It will auto log in the new account after Sign Up

AccountSetting.logInWithEmail("shan27@pdx.edu", "BIANhao5213"){(error) in
    print(error ?? "log in successfully!")
    }
    
    -- call the function
let result = AccountInfo.addNewAccountBasicInfo("ZeyongShan", 1, "YYYYMMDD(has to be 8 digits)", "shan27@pdx.edu")
print(result)
    
======================================================================================================
Examples :  addNewAccountAddressInfo


-- Have to logIn before addNewAccInfo
let result = AccountInfo.addNewAccountAddressInfo("ex.No", "ex.St", "ex.no", "exCity", "exState", 000000)
print(result)
    
    
======================================================================================================
Examples :   addNewAccountBankInfo

let result = AccountInfo.addNewAccountBankInfo("Example card number", "MMYY(has to be 4 digits)")
print(result)
    
    
    
======================================================================================================
Examples :   getAccountBasicInfo

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

print(result)

*/




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
    
    
    class func addNewAccountAddressInfo(_ StNo:String, _ StreetName: String, _ Apt:String, _ City: String, _ State: String, _ Zip: Int) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("address").child("StNo").setValue(StNo)
        ref.child("accInfo").child(user!.uid).child("address").child("StName").setValue(StreetName)
        ref.child("accInfo").child(user!.uid).child("address").child("Apt").setValue(Apt)
        ref.child("accInfo").child(user!.uid).child("address").child("City").setValue(City)
        ref.child("accInfo").child(user!.uid).child("address").child("State").setValue(State)
        ref.child("accInfo").child(user!.uid).child("address").child("Zip").setValue(Zip)
        return true
    }
    
    
    class func addNewAccountBankInfo(_ cardNo:String, _ expireDate4Digit:String) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("bank").child("cardNo").setValue(cardNo)
        ref.child("accInfo").child(user!.uid).child("bank").child("expDate").setValue(expireDate4Digit)
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
            completionHandler(value?["name"] as! String?, value?["gender"] as! Int?, value?["dob"] as! String?, value?["email"] as! String?)
        })
        return true
    }
    
}






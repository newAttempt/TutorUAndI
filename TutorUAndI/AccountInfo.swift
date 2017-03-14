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
    
    
    class func addNewAccountBasicInfo(_ name: String, _ gender: Int, _ dob: String, _ email:String, _ school:String, _ major:String) -> String?
    {
        
        
        if  user == nil
        {
            //No user log in right now !!!
            return "No user log in right now !!!"
        }
        
        
        var error = ErrorChecker.checkIfDobValid(dob)
        if error != nil
        {
            return error
        }
        
        error = ErrorChecker.checkIfGenderValid(gender)
        if error != nil
        {
            return error
        }
        
        
        // call the firbase apt to store values in the database.
        ref.child("accInfo").child(user!.uid).child("name").setValue(name)
        ref.child("accInfo").child(user!.uid).child("gender").setValue(gender)
        ref.child("accInfo").child(user!.uid).child("dob").setValue(dob)
        ref.child("accInfo").child(user!.uid).child("email").setValue(email)
        ref.child("accInfo").child(user!.uid).child("school").setValue(school)
        ref.child("accInfo").child(user!.uid).child("major").setValue(major)
        return nil
    }
    
    
    class func addNewAccountAddressInfo(_ street:String, _ apt:String, _ city: String, _ state: String, _ zip: Int) -> String?
    {
        if  user == nil
        {
            //No user log in right now !!!
            return "No user log in right now !!!"
        }
        
        
        if  "\(zip)".characters.count != 5
        {
            return "worng zip code formet !!!"
        }
        
        // call the firbase apt to store values in the database.
        ref.child("accInfo").child(user!.uid).child("address").child("St").setValue(street)
        ref.child("accInfo").child(user!.uid).child("address").child("Apt").setValue(apt)
        ref.child("accInfo").child(user!.uid).child("address").child("City").setValue(city)
        ref.child("accInfo").child(user!.uid).child("address").child("State").setValue(state)
        ref.child("accInfo").child(user!.uid).child("address").child("Zip").setValue(zip)
        return nil
    }
    
    
    class func addNewAccountBankInfo(_ cardNo:String, _ expireDate4Digit:String, _ cardHolder:String) -> String?
    {
        if  user == nil
        {
            //No user log in right now !!!
            return "No user log in right now !!!"
        }
        
        
        if cardNo.characters.count != 16
        {
            return "worng card No. formet !!!"
        }
        
        if expireDate4Digit.characters.count != 4
        {
            return "wrong expire date formet !!!"
        }
        
        // call the firbase apt to store values in the database.
        ref.child("accInfo").child(user!.uid).child("bank").child("cardNo").setValue(cardNo)
        ref.child("accInfo").child(user!.uid).child("bank").child("expDate").setValue(expireDate4Digit)
        ref.child("accInfo").child(user!.uid).child("bank").child("holder").setValue(cardHolder)
        return nil
    }
    
    
    class func getAccountBasicInfo(completionHandler: @escaping (_ name:String?, _ gender:Int?, _ dob:String?, _ email:String?, _ school:String?, _ major:String?) -> ()) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary     // get the value from database and save them as NSDinctionary.
            let name = value?["name"] as! String?           // get those informaion.
            let gender = value?["gender"] as! Int?
            let dob = value?["dob"] as! String?
            let email = value?["email"] as! String?
            let school = value?["school"] as! String?
            let major = value?["major"] as! String?
            completionHandler(name, gender, dob, email, school, major)     // call the completionHandler which is a lamda experssion which passed in.
        })
        return true
    }
    
    
    class func getUserNameWithID(_ userID:String, completionHandler: @escaping (_ name:String?) -> ()) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary     // get the value from database and save them as NSDinctionary.
            let name = value?["name"] as! String?           // get those informaion.
            completionHandler(name)     // call the completionHandler which is a lamda experssion which passed in.
        })
        return true
    }
    
    
    class func getAccountAddressInfo(completionHandler: @escaping (_ street: String?, _ apt:String?, _ city:String?, _ state: String?, _ zip: Int?) -> ()) -> Bool
    {
        if  user == nil
        {
            //No user log in right now !!!
            return false
        }
        
        
        ref.child("accInfo").child(user!.uid).child("address").observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary     // get the value from database and save them as NSDinctionary.
            let st = value?["St"] as! String?          // get those informaion.
            let apt = value?["Apt"] as! String?
            let city = value?["City"] as! String?
            let state = value?["State"] as! String?
            let zip = value?["Zip"] as! Int?
            completionHandler(st, apt, city, state, zip)     // call the completionHandler which is a lamda experssion which passed in.
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
            let value = snapshot.value as? NSDictionary     // get the value from database and save them as NSDinctionary.
            var cardNo = value?["cardNo"] as! String?       // get those informaion.
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
            
            completionHandler(cardNo, expireDate, cardHolder)     // call the completionHandler which is a lamda experssion which passed in.
        })
        return true
    }
    
    
}




/*





=========important=========
it may not work if writing the log in part and getAccountInfo part together!
because it cannot ensure that log in will be implement first!
But it will work if user log in before like 1 second.
***The return values for the first three functions has been replaced to String.
=========important=========

======================================================================================================
1.Examples :  addNewAccountBasicInfo


-- Have to logIn before addNewAccInfo
-- **It will auto log in the new account after Sign Up

AccountSetting.logInWithEmail("shan27@pdx.edu", "BIANhao5213"){(error) in
    print(error ?? "log in successfully!")
    }
    
    -- call the function
let result = AccountInfo.addNewAccountBasicInfo("ZeyongShan", 1, "YYMMDD(has to be 8 digits)", "shan27@pdx.edu")
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

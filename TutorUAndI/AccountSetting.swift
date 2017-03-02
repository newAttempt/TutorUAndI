//
//  AccountMangement.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


/*
 -- one example for using these functions:
 
 AccountManagement.signUpWithEmail("example@pdx.edu", "examplepassword", completionHandler: {(error) in
 print(error ?? "sign up successfully!")
 })
 
 -- the completionHandler can also be took out from the argument list:
 
 AccountManagement.signUpWithEmail("sdfsdf@pdf.cd", "hahahaaha"){ (error) in
 print(error ?? "sign up successfully!")
 }
 
 
 -- pass in these functions with a completionHandler instead of catch the return value.
 -- the type of completionHandler is a function which take string as argument and return nothing.
 -- if the string is nil, which means the operation successful, if it is not, which means some error in there
 and the error message was stored in the string.
 
 */


class AccountSetting
{
    static private let emailListName = "emailList"
    
    
    class func signUpWithEmail(_ email: String, _ password: String, completionHandler: @escaping (String?) ->())
    {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in
            if error != nil
            {
                completionHandler("Email already been used!")
            }
            else
            {
                completionHandler(nil)
            }
        })
    }
    
    
    class func logInWithEmail(_ email: String, _ password: String, completionHandler: @escaping (String?) -> ())
    {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
            if error != nil
            {
                completionHandler("Account or password maybe worng!")
            }
            else
            {
                completionHandler(nil)
            }
        })
    }
    
    
    class func logOut(completionHandler: @escaping (Bool) -> ())
    {
        do
        {
            try FIRAuth.auth()?.signOut()
        } catch {
            completionHandler(false)
        }
        
    }
}

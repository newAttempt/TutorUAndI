//
//  AccountMangement.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase





class AccountManagement
{
    private var ref:FIRDatabaseReference
    private var emailList:[String]
    private let emailListName = "emailList"
    
    init()
    {
        ref = FIRDatabase.database().reference()
        emailList = []
    }
    
    func signUpWithEmail(_ email: String, _ password: String) -> Bool
    {
        if checkIfEmailAvaliable(email: email) == false
        {
            return false
        }
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in })
        storeEmailInDatabase(email: email)
        return true
    }
    
    private func storeEmailInDatabase(email: String)
    {
        ref.child(emailListName).observeSingleEvent(of: FIRDataEventType.value, with: {(snapshot) in
                var value = snapshot.value as? [String] ?? []
                value.append(email)
                self.ref.child(self.emailListName).setValue(value)
        })
    }
    
    private func checkIfEmailAvaliable(email: String) -> Bool
    {
        var return_value = true
        ref.child(emailListName).observeSingleEvent(of: FIRDataEventType.value, with: {(snapshot) in
            let value = snapshot.value as? [String] ?? []
            if value.contains(email){
                return_value = false
            }
        })
        return return_value;
    }
    
    
}

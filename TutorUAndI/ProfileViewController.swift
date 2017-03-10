//
//  EnterProfileViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/5/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class ProfileViewController:LogInController {
    
    
    @IBOutlet weak private var nameTextBox: UITextField!
    
    @IBOutlet weak private var genderTextBox: UITextField!
 
    @IBOutlet weak private var dobMMtextField: UITextField!
 
    @IBOutlet weak private var dobDDtextField: UITextField!
    @IBOutlet weak private var dobYYtextField: UITextField!

    @IBOutlet weak private var schoolTextField: UITextField!
    
    @IBOutlet weak private var majorTextField: UITextField!
    
    @IBOutlet weak private var streetTextField: UITextField!
    
    @IBOutlet weak private var unitNoTextField: UITextField!
   
    @IBOutlet weak private var cityTextField: UITextField!
    
    @IBOutlet weak private var stateTextField: UITextField!
    
    @IBOutlet weak private var zipCodeTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    
    @IBOutlet weak private var cardHolderTextField: UITextField!
    
    @IBOutlet weak private var cardNoTextField: UITextField!
    
    
    @IBOutlet weak private var expireMonthTextField: UITextField!
    @IBOutlet weak private var expireYearTextField: UITextField!
    

    
    
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
            }
    
    
    @IBAction func saveInfo(_ sender: UIButton) {
    
        var gender: Int = 0
        switch genderTextBox.text! {
        case "Female": gender = 0
        case "Male":   gender = 1
        default :      gender = 2
        }
        
        var dob = dobYYtextField.text!
        dob = dob.appending(dobMMtextField.text!)
        dob = dob.appending(dobDDtextField.text!)
        let error_1 = AccountInfo.addNewAccountBasicInfo(nameTextBox.text!, gender, dob, emailTextField.text!, schoolTextField.text!, majorTextField.text!)
        
        print(error_1 ?? "add basic info successfully!")
        let error_2 = AccountInfo.addNewAccountAddressInfo(streetTextField.text!, unitNoTextField.text!, cityTextField.text!, stateTextField.text!, Int(zipCodeTextField.text!)!)
        print(error_2 ?? "add address info successfully!")
        let error_3 = AccountInfo.addNewAccountBankInfo(cardNoTextField.text!, expireMonthTextField.text!.appending(expireYearTextField.text!), "card holder")
        print(error_3 ?? "add bank info successfully!")
        
        if error_1 == nil && error_2 == nil && error_3 == nil{
            self.performSegue(withIdentifier: "signUpInfoToHomePage", sender: self)
        }
        
        
    }
    
    
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    @IBAction func saveButton(_ sender: UIButton) {
        
    }
    
    @IBAction func backToSignUpButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backToSignUp", sender: self)
    }

    */
    
    
}


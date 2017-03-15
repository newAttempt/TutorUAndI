//
//  PersonalInfoViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/14/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit
import Foundation

class PersonalInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        _ = AccountInfo.getAccountBasicInfo(completionHandler:
        { (name, gender, dob, email, school,major) in
            if name != nil
            {
               self.nameTextField.text! = name!.capitalized
            }
            if gender != nil
            {
                if(gender == 1)
                {
                    self.genderTextField.text = "Male"
                }
                if gender == 0 {
                    self.genderTextField.text = "Female"
                }
                if gender == 2 {
                    self.genderTextField.text = "Other"
                }
            }
            if dob != nil
            {
                
                let year = dob![dob!.startIndex..<dob!.index(dob!.startIndex, offsetBy: 2)]
                
                let month = dob![dob!.index(dob!.startIndex, offsetBy: 2)..<dob!.index(dob!.startIndex, offsetBy: 4)]
                
                let day = dob![dob!.index(dob!.startIndex, offsetBy: 4)..<dob!.endIndex]
                
                self.bodTextField.text = month + "-" + day + "-" + year

            }
            if email != nil
            {
                self.emailTextField.text = email!
            }
            if school != nil{
                self.schoolTextField.text = school!.capitalized
            }
            if major != nil{
               self.majorTextField.text = major!.capitalized
            }
          
        })
        
        _ = AccountInfo.getAccountAddressInfo { (street, apt, city, state, zip) in
            
            if street != nil{
                self.add1TextField.text! = street!
            }
            if apt != nil{
                self.add2TextField.text! = apt!
            }
            if city != nil{
                self.cityTextField.text! = city!
            }
            if state != nil{
                self.stateTextField.text! = state!
            }
            if zip != nil{
                self.zipTextField.text! = String(zip!)
            }
        }
        
        _ = AccountInfo.getAccountBankInfo()
        { (cardNo, expDate, holder) in
            print(cardNo ?? "nothing!!!")
            print(expDate ?? "nothing!!!")
            print(holder ?? "nothing!!!")
            if cardNo != nil{
                self.bankTextField.text! = cardNo!
            }
        }
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var genderTextField: UILabel!
    @IBOutlet weak var bodTextField: UILabel!
    @IBOutlet weak var emailTextField: UILabel!
    
    @IBOutlet weak var add1TextField: UILabel!
    @IBOutlet weak var add2TextField: UILabel!
    @IBOutlet weak var cityTextField: UILabel!
    @IBOutlet weak var stateTextField: UILabel!
    @IBOutlet weak var zipTextField: UILabel!
    
    @IBOutlet weak var bankTextField: UILabel!
    @IBOutlet weak var schoolTextField: UILabel!
    @IBOutlet weak var majorTextField: UILabel!
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

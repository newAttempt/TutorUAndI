//
//  ViewController.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class LogInController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func logIn() {
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        AccountSetting.logInWithEmail(username!, password!)
        {
            
            //AccountSetting.logInWithEmail("shan27@pdx.edu", "BIANhao5213")
            (error) in
            //print(error ?? "Log in successfully!!")
            //print(username ?? "NO username")
            //print(password ?? "NO password")
            if error == nil
            {
                self.temp.textColor = UIColor.blue
                self.temp.text = "Log in successfully!"
            }
            
            if error != nil
            {
                self.temp.textColor = UIColor.red
                self.temp.text = error
                self.logIn()
            }
        }
    }
    
    @IBAction func signUp() {
        print("go to sign up page!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var temp: UILabel!
    
    // keyboard shows
    func textFieldDidBeginEditing(_ textField: UITextField){
        moveTextField(textField: textField, moveDistance: -250, up: true)
        print("begin editing!!!!!")
    }
    
    // keyboard hidden
    func textFieldDidEndEditing(_ textField: UITextField) {
            moveTextField(textField: textField, moveDistance: -250, up: false)
            print("end editing!!!!!")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool){
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0,dy: movement)
        UIView.commitAnimations()
    }

}


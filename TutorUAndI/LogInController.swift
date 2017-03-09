//
//  ViewController.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class LogInController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak private var userNameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction private func logIn() {
        let username = userNameTextField.text
        let password = passwordTextField.text

        AccountSetting.logInWithEmail(username!, password!)
        {
            (error) in
            if error == nil
            {
                self.errorLabel.textColor = UIColor.blue
                self.errorLabel.text = "Log in successfully!"
                return
            }
            self.errorLabel.textColor = UIColor.red
            self.errorLabel.text = error
        }
    }
    
    @IBAction private func signUp() {
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


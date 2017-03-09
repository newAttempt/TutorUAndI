//
//  SignUpViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/4/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class SignUpViewController:LogInController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField.text != nil) {
            textField.text = ""
        }
       
    }
    
    @IBOutlet weak private var testerlabel: UILabel!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var password: UITextField!
    @IBOutlet weak private var confirm: UITextField!
    
    
    @IBAction func signUpButton(_ sender: UIButton) {

        if self.password.text == nil || self.confirm.text == nil || self.emailTextField.text == nil
        {
            testerlabel.text = "Please fill the blanks."
            return
        }   // Check if any text field is empty.
        
        if self.password.text! != self.confirm.text!
        {
            testerlabel.text = "passwords don't match!"
            return
        }   // Check if the passwords don't match.
        
        AccountSetting.signUpWithEmail(emailTextField.text!, password.text!, completionHandler: {
            (error) in
            if(error == nil)
            {
                
                self.testerlabel.textColor = UIColor.cyan
                self.testerlabel.text = "Sign Up successfully!"

                self.performSegue(withIdentifier: "testToSegue", sender: self)
                
            }
            else{

                self.testerlabel.textColor = UIColor.red
                self.testerlabel.text = error
                // self.textFieldDidBeginEditing(self.emailTextField)
                // self.textFieldDidBeginEditing(self.passwordTestField)
                //self.emailTextField.text = ""
                //self.passwordTestField.text = ""
                //self.passwordComfirmTestField.text = ""
            }
            
            
        })

    }
    
    
    override func textFieldDidBeginEditing(_ textField: UITextField){
        moveTextField(textField: textField, moveDistance: -250, up: true)
    }
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func moveTextField(textField: UITextField, moveDistance: Int, up: Bool){
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0,dy: movement)
        UIView.commitAnimations()
    }
 
    
    
    
    
    
    
    

}

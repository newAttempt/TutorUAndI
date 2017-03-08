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
    
    @IBOutlet weak var testerlabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var passwordComfirmTestField: UITextField!
    
    @IBAction func signUpButton(_ sender: UIButton) {

        
        AccountSetting.signUpWithEmail(emailTextField.text!, passwordTestField.text!, completionHandler: {
            (error) in
            if(error == nil)
            {
                //print(error ?? "sign up successfully!")
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

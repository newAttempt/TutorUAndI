//
//  ViewController.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardShow(){
        UIView.animate(withDuration: 0.5, animations:{
            
        }, completion : nil)
    }

    fileprivate var loginManager = AccountManagement()
    @IBOutlet weak var _usernameText: UITextField!
    @IBOutlet weak var _passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func LoginButton(_ sender: Any) {
     
        let username = _usernameText.text
        let password = _passwordText.text
        
        if(loginManager.signUpWithEmail(username!, password!)){
            // Login successfully
            
            
        }else {
            // Login failed, repeat the login step
            
        }
        
    }
    
}


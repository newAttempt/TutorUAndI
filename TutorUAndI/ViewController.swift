//
//  ViewController.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var userNameTextField: UILabel!
    
    @IBOutlet weak var passwordTextField: UILabel!
    
    
    @IBAction func logIn() {
        AccountSetting.logInWithEmail("shan27@pdx.edu", "BIANhao5213")
        {
            (error) in
            print(error ?? "Log in successfully!!")
            if error == nil
            {
                self.temp.text = "XXXXXXXXXXXXXX"
            }
        }
    }
    
    @IBAction func signUp() {
        
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

}


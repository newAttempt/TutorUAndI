//
//  ContactUsViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/13/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController, UITextViewDelegate {

    
    
    @IBOutlet weak var myTextView: UITextView!
    //var placeHolderLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTextView.delegate = self
        
        myTextView.text = "leave your message ... "
        myTextView.backgroundColor = UIColor.white
        myTextView.textColor = UIColor.lightGray
        myTextView.isEditable = true
        myTextView.layer.cornerRadius = 5
        myTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        myTextView.layer.borderWidth = 1.0;
       // myTextView.layer.cornerRadius = 5.0;
        
        self.textViewDidBeginEditing(myTextView)
        self.textViewDidEndEditing(myTextView)
  
        
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        textView.textColor = UIColor.black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = "leave your message..."
        textView.textColor = UIColor.lightGray
    }
    
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBAction func sendButton(_ sender: UIButton) {
        HelpAndContract.grabTheMessage(nameTextField.text!, emailTextField.text!, myTextView.text!)
        alertLabel.text = "Message sent successfully."
        
        nameTextField.text = nil
        emailTextField.text = nil
        myTextView.text = "leave your message..."
        myTextView.textColor = UIColor.lightGray
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

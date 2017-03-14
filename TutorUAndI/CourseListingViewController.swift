//
//  CourseListingViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/14/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class CourseListingViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var desTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        desTextView.delegate = self
        desTextView.text = "descroption ..."
        desTextView.textColor = UIColor.lightGray
        desTextView.layer.borderWidth = 1.0
        desTextView.layer.cornerRadius = 5
        desTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = UIColor.black
        textView.text = nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = "description ..."
        textView.textColor = UIColor.lightGray
    }
    

    
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var alertButton: UILabel!
    
  
    @IBAction func postButton(_ sender: UIButton) {
        if(ItemManager.addItem(majorTextField.text!, nameTextField.text!, topicTextField.text!, desTextView.text!)){
            alertButton.text = "Successfully posted your course listing."
            majorTextField.text = nil
            nameTextField.text = nil
            topicTextField.text = nil
            desTextView.textColor = UIColor.lightGray
            desTextView.text = "description ..."
        }else{
            alertButton.text = "Something went wrong with your course listing."
        }
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

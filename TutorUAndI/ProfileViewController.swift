//
//  EnterProfileViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/5/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class ProfileViewController:LogInController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    @IBOutlet weak var genderTextBox: UITextField!
    @IBOutlet weak var dobTextBox: UITextField!
    
    @IBOutlet weak var genderDropDown: UIPickerView!
    @IBOutlet weak var dobDropDown: UIPickerView!
    
    var dob = ["Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"]
    var gender = ["Female", "Male", "Other"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        var countrows : Int = gender.count
        if pickerView == dobDropDown {
            countrows = self.dob.count
        }
        return countrows
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderDropDown{
            let titleRow = gender[row]
            return titleRow
        }
        else if pickerView == dobDropDown{
            let titleRow = dob[row]
            return titleRow
        }
        
        return  ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderDropDown{
            self.genderTextBox.text = self.gender[row]
            self.genderDropDown.isHidden = true
            
        }else if pickerView == dobDropDown{
            self.dobTextBox.text = self.dob[row]
            self.dobDropDown.isHidden = true
        }
    }
    
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.genderTextBox){
            self.genderDropDown.isHidden = false
        }else if(textField == self.dobTextBox){
            self.dobDropDown.isHidden = false
        }
    }
    
    
    
    
    
    
    
//UITableViewDelegate, UITableViewDataSource{

    /*let list = ["Name", "D.O.B", "Gender", "Email", "Address", "Bank Acc.", "School", "Major"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       
        return (list.count)
        
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
        cell.textLabel?.text = list[indexPath.row]
        
        return (cell)
    }*/
    

    
    
    
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


//
//  PageTableViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/10/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class PageTableViewController: UITableViewController {
   
    
    var data = ["Profile", "Transactions Overview", "Calendar / Reminder", "Messages", "Help & Contact"]
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 180
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            self.performSegue(withIdentifier: "segueToOne", sender: nil)
        }
        if(indexPath.row==4){
            self.performSegue(withIdentifier: "accountToHelp", sender: nil)
        }
        
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
 */
    
    
    
    
    
}

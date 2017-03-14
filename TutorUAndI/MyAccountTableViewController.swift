//
//  MyAccountTableViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/10/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class MyAccountTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    var data = [String] ()
    weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = ["PROFILE", "TRANSACTIONS OVERVIEW", "CALENDAR/REMIDER","MESSAGES","HELP & CONTACT","LOGOUT"]
        
        //let tableView = UITableView(frame:view.bounds)
        let tableView = UITableView(frame:view.bounds)

        tableView.separatorStyle = .none
        
        
        view.addSubview(tableView)
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        // getting the right element
        let element = data[indexPath.row]
        
        //Instantiate a cell
       
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
                // Adding the right information
        
        cell.textLabel?.text = element
        cell.textLabel?.textColor = UIColor.darkGray
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    
    //set Hearder section's bg color
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.orange
        return headerView
    }*/
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

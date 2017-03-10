//
//  MyProfileViewController.swift
//  TutorUAndI
//
//  Created by Tutu Wei on 3/9/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    


    var elements = ["PROFILE", "CALENDER/REMINDER","TRANSACTIONS OVERVIEW", "MESSAGES","HELP & CONTACT","LOG OUT"]
    
    weak var tableView: UITableView!
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Getting the right element
        let element = elements[indexPath.row]
        
        
        // Instantiate a cell
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "ElementCell")
        
        let cellIdentifier = "ElementCell"
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
        cell.accessoryType = .disclosureIndicator

        
        //Adding the right informations
        cell.textLabel?.text = element
        
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(elements)
        self.navigationController?.navigationBar.isTranslucent = false
        
        let tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        self.tableView = tableView
        
        tableView.dataSource = self
        tableView.delegate = self
       
        let rect = CGRect(origin: CGPoint(x:100,y :0), size: CGSize(width: 50, height: 140))
        let headerImageView = UIImageView(frame: rect)
        let image: UIImage = UIImage(named: "account_upper_BG-1")!
        headerImageView.image = image
        tableView.tableHeaderView = headerImageView
 
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "ShowProfileInfoSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        //var image = UIImage(named: "accountIcon.png");
        //header.contentView.addSubview(image)

        return 20.0
    }
    
    
    
    //var imageViewGame = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    //imageViewGame?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
   // imageViewGame.image = image;
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let cell = sender as? UITableViewCell {
     
        if segue.identifier == "ShowProfileInfoSegue" {
                    let vc = segue.destination as! AccountProfileViewController
                    
                }
            }
        
    }
    */
    
}


















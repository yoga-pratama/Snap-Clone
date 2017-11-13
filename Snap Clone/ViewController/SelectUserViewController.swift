//
//  SelectUserViewController.swift
//  Snap Clone
//
//  Created by Yoga Pratama on 13/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit
import Firebase

class SelectUserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var userTableView: UITableView!
    
    var users : [User] = []
    var imageURL = ""
    var descrip = ""
    var uuid = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        
        Database.database().reference().child("users").observe(DataEventType.childAdded) { (snapshot) in
            
        
            let user = User()
          //  user.email = snapshot.value!["email"] as! String
            
            user.uid = snapshot.key
            user.email = (snapshot.value as? NSDictionary)?["email"] as? String ?? ""
            
            self.users.append(user)
            self.userTableView.reloadData()
        }
        /* Database.database().reference().child("users").observe(DataEventType.childAdded, with: {(snapshot) in
         print(snapshot["email"] as! String)
         }) */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        cell.textLabel?.text = user.email
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let currentUser = Auth.auth().currentUser?.email
        let snap = ["from" : currentUser, "description" : descrip  , "imageURL" : imageURL , "uuid" : uuid]
        Database.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}

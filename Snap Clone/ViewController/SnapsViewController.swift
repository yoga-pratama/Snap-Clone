//
//  SnapsViewController.swift
//  Snap Clone
//
//  Created by Yoga Pratama on 13/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit
import Firebase
class SnapsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var snaps : [Snap] = []
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //if data added from firebase
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childAdded) { (snapshot) in
            //print(snapshot)
            
            let snap = Snap()
            print((snapshot.value as? NSDictionary)?["from"] as? String ?? "")
            snap.imageURL =  (snapshot.value as? NSDictionary)?["imageURL"] as? String ?? ""
            snap.from = (snapshot.value as? NSDictionary)?["from"] as? String ?? ""
            snap.descrip = (snapshot.value as? NSDictionary)?["description"] as? String ?? ""
            snap.key = snapshot.key
            snap.uuid = (snapshot.value as? NSDictionary)?["uuid"] as? String ?? ""
            self.snaps.append(snap)
            
            self.tableView.reloadData()
            
        }
        //if delete
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childRemoved) { (snapshot) in
            //print(snapshot)
            var idx = 0
            for snap in self.snaps{
                if  snap.key == snapshot.key{
                    self.snaps.remove(at: idx)
                }
                idx += 1
            }
             self.tableView.reloadData()
        }
        
        
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  snaps.count == 0 {
            return 1
        }else{
                return snaps.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        if  snaps.count == 0 {
            cell.textLabel?.text = "You have no snaps ☹️"
        }else{
                let snap = snaps[indexPath.row]
                cell.textLabel?.text = snap.from
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snap = snaps[indexPath.row]
        performSegue(withIdentifier: "viewSnapSegue", sender: snap)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "viewSnapSegue"{
            let nextVC = segue.destination as! ViewSnapViewController
            nextVC.snap = sender as! Snap
        }
        
    }
    
}

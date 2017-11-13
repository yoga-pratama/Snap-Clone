//
//  SelectUserViewController.swift
//  Snap Clone
//
//  Created by Yoga Pratama on 13/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    

}

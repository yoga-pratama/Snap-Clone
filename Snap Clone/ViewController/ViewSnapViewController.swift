//
//  ViewSnapViewController.swift
//  Snap Clone
//
//  Created by Yoga Pratama on 13/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDesc: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelDesc.text = snap.descrip
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

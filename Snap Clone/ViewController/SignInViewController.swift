//
//  ViewController.swift
//  Snap Clone
//
//  Created by Yoga Pratama on 13/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            print("try to sign in")
            if error != nil{
                print("error found:\(error)")
                self.createUser(Email: self.emailTextfield.text!, Password: self.passwordTextfield.text!)
                
            }else{
                
                print("login success")
                 self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        }
    }
    
    
    func createUser(Email:String , Password:String){
        Auth.auth().createUser(withEmail: Email, password: Password) { (user, error) in
            if error  != nil{
                print("create user fail:\(error)")
            }else{
                print("crate user success")
        Database.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        }
    }
    
}


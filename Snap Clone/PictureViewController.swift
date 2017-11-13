//
//  PictureViewController.swift
//  Snap Clone
//
//  Created by Yoga Pratama on 13/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit
import Firebase
class PictureViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        pictureImageView.image = image
        pictureImageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func NextButtonTapped(_ sender: Any) {
        nextButton.isEnabled = false
        let imagesFolder =  Storage.storage().reference().child("images")
        let imageData =  UIImageJPEGRepresentation(pictureImageView.image!, 0.1)!
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil) { (metadata, error) in
            print("uploading....")
            if  error != nil {
                print("An error accour: \(error)")
            }else{
                print("upload success...")
                print(metadata?.downloadURL())
                self.performSegue(withIdentifier: "nextStepSegue", sender: nil)
            }
        }
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

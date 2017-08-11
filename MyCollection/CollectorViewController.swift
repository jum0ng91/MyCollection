//
//  CollectorViewController.swift
//  MyCollection
//
//  Created by GREED on 8/5/17.
//  Copyright © 2017 GREED. All rights reserved.
//

import UIKit

class CollectorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self;
    }

    // Photos Bar Button Item has been tapped
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary; // Pick image from photo library
        
        present(imagePicker, animated: true, completion: nil); // Show the photo library
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
        
        itemImageView.image = image;
        
        imagePicker.dismiss(animated: true, completion: nil); // Dismiss photo library after picking
    }
    // Camera Bar Button Item has been tapped
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    // Add button has been tapped
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        
        let collect = Collection(context: context);
        
        collect.title = titleTextField.text;
        
        collect.image = UIImagePNGRepresentation(itemImageView.image!) as NSData?;
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext();
        
        navigationController?.popViewController(animated: true);
    }

}

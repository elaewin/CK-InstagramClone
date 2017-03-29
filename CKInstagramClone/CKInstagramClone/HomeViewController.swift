//
//  HomeViewController.swift
//  CKInstagramClone
//
//  Created by Erica Winberry on 3/28/17.
//  Copyright © 2017 Erica Winberry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func presentImagePicker(sourceType: UIImagePickerControllerSourceType) {
        
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = sourceType
        self.imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true, completion: nil)
    }
   
    func presentActionSheet() {
        
        let actionSheet = UIAlertController(title: "", message: "Please select Source Type", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.presentImagePicker(sourceType: .camera)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.presentImagePicker(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    // Use the UIImagePickerController and its delegate to use the camera to set the image view's image.
    
    // Your UIImagePickerController should allow editing. Also, the edited image should be assigned to the image view.
    
    //MARK: Actions
    
    @IBAction func imageTapped(_ sender: Any) {
        presentActionSheet()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //create outlet to image view
            //put on image view
        }
    }
}

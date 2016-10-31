//
//  AddPostTableViewController.swift
//  Timeline_PT2
//
//  Created by Martin Kirke on 10/31/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    var image: UIImage?

    @IBOutlet weak var addPostImageView: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    
    
    @IBAction func addImageTapped(_ sender: Any) {
        
        let localImage = UIImage(named: "nes-classic-edition")
        
        addPostImageView.image = localImage
        self.image = localImage
        
    }
    
    
    @IBAction func addPostTapped(_ sender: Any) {
        if let image = image,
            let caption = captionTextField.text {
            
            PostController.shared.createPost(photo: image, caption: caption)
            dismiss(animated: true, completion: nil)

        } else {
        
            let alertController = UIAlertController(title: "Missing Information", message: "Please check your image and caption.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

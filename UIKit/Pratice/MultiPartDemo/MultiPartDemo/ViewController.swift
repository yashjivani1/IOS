//
//  ViewController.swift
//  MultiPartDemo
//
//  Created by Yash on 01/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet var imageUpload: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func photoAlbumTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func uploadBtnTapped(_ sender: Any) {
        let url =  "http://localhost:3000/upload/single"
        let image = self.imageUpload.image!
        AF.upload(multipartFormData: { (multipartFormData) in
              let data = (image).jpegData(compressionQuality: 1)
                      multipartFormData.append(data!, withName: "file", fileName: "meet",mimeType: "image/jpeg")
        }, to: url,method: .post).response{ response in
            print(response)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageUpload.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
}


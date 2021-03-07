//
//  ViewController.swift
//  ImageUpload
//
//  Created by Haco on 07/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageUpload: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func didTapToUpload(_ sender: Any) {
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imagecontroller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageUpload.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        let url = "http://localhost:3000/upload-avatar"
        
      
        
        let image = self.imageUpload.image!
        Alamofire.upload(multipartFormData: { (multipartFormData) in




            let data = (image).jpegData(compressionQuality: 1)
            multipartFormData.append(data!, withName: "avatar", fileName: "meet",mimeType: "image/jpeg")

        }, usingThreshold: UInt64.init(),
         to: url,
         method: .post,
         encodingCompletion: { encodingResult in
         switch encodingResult {
           case .success(let upload, _, _):
            upload.responseJSON{ response in
                print(response.description)
                 }
           case .failure(let encodingError):
                print(encodingError)
           }
         })
       
     
//        let newPost = POST(name: "Yash", age: 10)
//
//        do{
//            let jsonBody = try JSONEncoder().encode(newPost)
//            print(jsonBody)
//        }catch{}
//
//
        
    }
}




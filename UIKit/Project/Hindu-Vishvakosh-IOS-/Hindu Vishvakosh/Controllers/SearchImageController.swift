//
//  SearchImageController.swift
//  Hindu Vishvakosh
//
//  Created by haco on 13/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit
import Alamofire

class SearchImageController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var imagePrv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func searchImage(_ sender: Any) {
        
        let image = self.imagePrv.image
        
        AF.upload(multipartFormData: { (multipartFormData) in
            let data = (image)!.jpegData(compressionQuality: 1)
            multipartFormData.append(data!, withName: "image", fileName: "demo",mimeType: "image/jpeg")
        }, to: URL_IMAGE_UPLOAD, usingThreshold: UInt64.init(),
           method: .post).response{ response in
            print(response)
        }
        let result = self.storyboard?.instantiateViewController(identifier: "searchResult") as! ResultController
        
        self.navigationController?.pushViewController(result, animated: true)
        
    }
    
    @IBAction func didTapCamera(_ sender: Any) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.camera
        self.present(imageController, animated: true, completion: nil)
    }
    
    @IBAction func didTapGallery(_ sender: Any) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePrv.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
}

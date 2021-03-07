//
//  StorageManager.swift
//  Instagram-Clone(Firebase)
//
//  Created by haco on 08/11/20.
//  Copyright © 2020 haco. All rights reserved.
//

import Foundation
import FirebaseStorage

public class StorageManager{
    
    static let shared = StorageManager()
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error{
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPost, completion: @escaping(Result<URL, Error>) -> Void){
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping(Result<URL, IGStorageManagerError>) -> Void){
        bucket.child(reference).downloadURL { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
        
        
    }
}


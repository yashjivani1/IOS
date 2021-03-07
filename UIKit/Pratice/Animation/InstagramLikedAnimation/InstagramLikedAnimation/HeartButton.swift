//
//  HeartButton.swift
//  InstagramLikedAnimation
//
//  Created by haco on 14/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class HeartButton: UIButton {
    
    private var isLiked = false
    
    private let likedImage = UIImage(named: "liked")
    private let unlikedImage = UIImage(named: "unliked")
    
    
    private let unlikedScale: CGFloat = 0.7
    private let likedScale: CGFloat = 1.3
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(unlikedImage, for: .normal)
        self.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func flipLikedState(){
        isLiked = !isLiked
        animate()
    }
    
    private func animate(){
        UIView.animate(withDuration: 0.1, animations: {
            let newImage = self.isLiked ? self.likedImage : self.unlikedImage
            let newScale = self.isLiked ? self.likedScale : self.unlikedScale
            
            self.transform = self.transform.scaledBy(x: newScale, y: newScale)
            self.setImage(newImage, for: .normal)
        } ,completion: { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
    
    @objc func buttonClick(_ sender: UIButton){
        flipLikedState()
    }
    
}



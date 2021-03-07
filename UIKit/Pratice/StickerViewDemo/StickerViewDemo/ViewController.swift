//
//  ViewController.swift
//  StickerViewDemo
//
//  Created by Yash Jivani on 24/02/21.
//

import UIKit
import IRSticker_swift

class ViewController: UIViewController {
    
   
    var selectedSticker: IRStickerView?
    var position : CATransform3D?
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Converted to Swift 5.3 by Swiftify v5.3.17740 - https://swiftify.com/
        let label = UILabel()
        label.text = "rgerg"
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let stickerView = IRStickerView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100), contentImage: #imageLiteral(resourceName: "bg_splash"))
        //        stickerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100 )
        //        stickerView.contentImage = #imageLiteral(resourceName: "bg_splash")
        stickerView.center = view.center
        stickerView.enabledControl = true
        stickerView.enabledBorder = true
        
        stickerView.tag = 1
        stickerView.delegate = self
        
        self.view.addSubview(stickerView)
        stickerView.performTapOperation()
    }
    
    @IBAction func slider1ValueChanged(_ sender: UISlider) {
        
        let image = selectedSticker?.subviews[0] as! UIImageView
        print(sender.value)
        image.layer.transform = CATransform3DRotate(position!, CGFloat(sender.value) / 100, 1, 0, 0)
    }
    
}

extension ViewController: IRStickerViewDelegate{
    func ir_StickerViewDidTapContentView(stickerView: IRStickerView){
        if let selectedSticker = self.selectedSticker {
            selectedSticker.enabledBorder = false
            selectedSticker.enabledControl = false
        }
        
        self.selectedSticker = stickerView
        self.selectedSticker!.enabledBorder = true
        self.selectedSticker!.enabledControl = true
        position = selectedSticker?.layer.transform
    }
    
    
    func ir_StickerViewDidTapLeftTopControl(stickerView: IRStickerView) {
        NSLog("Tap[%zd] DeleteControl", stickerView.tag);
        stickerView.removeFromSuperview()
        for subView in self.view.subviews {
            if subView.isKind(of: IRStickerView.self)  {
                let sticker = subView as! IRStickerView
                sticker.performTapOperation()
                break
            }
        }
    }
    
    func ir_StickerViewDidTapRightTopControl(stickerView: IRStickerView) {
       
    }
    
    
    
    func ir_StickerViewDidTapLeftBottomControl(stickerView: IRStickerView) {
        NSLog("Tap[%zd] LeftBottomControl", stickerView.tag);
                let targetOrientation = (stickerView.contentImage?.imageOrientation == UIImage.Orientation.up ? UIImage.Orientation.upMirrored : UIImage.Orientation.up)
                let invertImage = UIImage.init(cgImage: (stickerView.contentImage?.cgImage)!, scale: 1.0, orientation: targetOrientation)
                stickerView.contentImage = invertImage
    }
    
    
    func ir_StickerViewDidTapRightBottomControl(stickerView: IRStickerView){
        
    }
}

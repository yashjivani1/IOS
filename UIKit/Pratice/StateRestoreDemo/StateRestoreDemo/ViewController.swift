//
//  ViewController.swift
//  StateRestoreDemo
//
//  Created by Yash Jivani on 04/03/21.
//

import UIKit
import StickerView

class ViewController: UIViewController {
 
    
    @IBOutlet weak var stickBgView: UIView!
    private var _selectedStickerView:StickerView?
    var selectedStickerView:StickerView? {
        get {
            return _selectedStickerView
        }
        set {
            // if other sticker choosed then resign the handler
            if _selectedStickerView != newValue {
                if let selectedStickerView = _selectedStickerView {
                    selectedStickerView.showEditingHandlers = false
                }
                _selectedStickerView = newValue
            }
            // assign handler to new sticker added
            if let selectedStickerView = _selectedStickerView {
                selectedStickerView.showEditingHandlers = true
                selectedStickerView.superview?.bringSubviewToFront(selectedStickerView)
            }
        }
    }
    override func viewDidLoad() {
        addImage(img: UIImageView(image: #imageLiteral(resourceName: "bg_splash")))
        
    }
    
    func addImage(img: UIImageView){
        let testImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        testImage.image = img.image
            testImage.contentMode = .scaleAspectFit
            let stickerView3 = StickerView.init(contentView: testImage)
            stickerView3.center = CGPoint.init(x: 150, y: 150)
            stickerView3.delegate = self
            stickerView3.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
            stickerView3.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
            stickerView3.setImage(UIImage.init(named: "Flip")!, forHandler: StickerViewHandler.flip)
            stickerView3.showEditingHandlers = false
            stickerView3.tag = 999
            self.stickBgView.addSubview(stickerView3)
            self.selectedStickerView = stickerView3
    }
    
    
}




extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}



extension ViewController: StickerViewDelegate{
    func stickerViewDidBeginMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidChangeMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidBeginRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidChangeRotating(_ stickerView: StickerView) {
        print(selectedStickerView?.frame.size.height)
    }
    
    func stickerViewDidEndRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidClose(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidTap(_ stickerView: StickerView) {
        
    }
    
}

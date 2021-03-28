//
//  ViewController.swift
//  DemoRealm
//
//  Created by Yash Jivani on 04/03/21.
//

import UIKit
import RealmSwift
import StickerView

class ViewController: UIViewController{
    
    @IBOutlet weak var stickerBgView: UIView!
    var stickerArray = [StickerView]()
    var count = 0
    private var _selectedStickerView:StickerView?
    var currentId : Int?
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
    var realm : Realm!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addImage(img: UIImageView(image: #imageLiteral(resourceName: "Art - Watermark - 1")), id: "1")
       
        
        selectedStickerView?.layer.borderWidth = 2
        let image = selectedStickerView?.subviews[0] as! UIImageView
        
        realm = try! Realm()
        let frame1 = realm.objects(ModelFrame.self)
        if frame1.count != 0 {
            DispatchQueue.main.async { [self] in
                for (index, _) in frame1.enumerated() {
                    print(stickerArray[index].frame)
                    
                    stickerArray[index].transform = stickerArray[index].transform.rotated(by: CGFloat(frame1[index].angleInDegree) * .pi/180)
                    stickerArray[index].center.x = CGFloat(frame1[index].x)
                    stickerArray[index].center.y = CGFloat(frame1[index].y)
                    stickerArray[index].bounds.size.width = CGFloat(frame1[index].width)
                    stickerArray[index].bounds.size.height = CGFloat(frame1[index].height)
                    image.layer.transform.m11 = CGFloat(frame1[index].m11)
                    image.layer.transform.m12 = CGFloat(frame1[index].m12)
                    image.layer.transform.m13 = CGFloat(frame1[index].m13)
                    image.layer.transform.m14 = CGFloat(frame1[index].m14)
                    image.layer.transform.m21 = CGFloat(frame1[index].m21)
                    image.layer.transform.m22 = CGFloat(frame1[index].m22)
                    image.layer.transform.m23 = CGFloat(frame1[index].m23)
                    image.layer.transform.m24 = CGFloat(frame1[index].m24)
                    image.layer.transform.m31 = CGFloat(frame1[index].m31)
                    image.layer.transform.m32 = CGFloat(frame1[index].m32)
                    image.layer.transform.m33 = CGFloat(frame1[index].m33)
                    image.layer.transform.m34 = CGFloat(frame1[index].m34)
                    image.layer.transform.m41 = CGFloat(frame1[index].m41)
                    image.layer.transform.m42 = CGFloat(frame1[index].m42)
                    image.layer.transform.m43 = CGFloat(frame1[index].m43)
                    image.layer.transform.m44 = CGFloat(frame1[index].m44)
                    
                    
                    _ = stickerArray[index].subviews[0] as! UIImageView
                    print(stickerArray[index].bounds)
                    print(frame1[index])
                }
            }
        }else{
            for sticker in stickerArray{
                let frame = ModelFrame()
                frame.id = String(sticker.tag)
                frame.height = Float(sticker.frame.height)
                frame.width = Float(sticker.frame.width)
                frame.x = Float(sticker.frame.origin.x)
                frame.y = Float(sticker.frame.origin.y)
                frame.m11 = Float(image.layer.transform.m11)
                frame.m12 = Float(image.layer.transform.m12)
                frame.m13 = Float(image.layer.transform.m13)
                frame.m14 = Float(image.layer.transform.m14)
                frame.m21 = Float(image.layer.transform.m21)
                frame.m22 = Float(image.layer.transform.m22)
                frame.m23 = Float(image.layer.transform.m23)
                frame.m24 = Float(image.layer.transform.m24)
                frame.m31 = Float(image.layer.transform.m31)
                frame.m32 = Float(image.layer.transform.m32)
                frame.m33 = Float(image.layer.transform.m33)
                frame.m34 = Float(image.layer.transform.m34)
                frame.m41 = Float(image.layer.transform.m41)
                frame.m42 = Float(image.layer.transform.m42)
                frame.m43 = Float(image.layer.transform.m43)
                frame.m44 = Float(image.layer.transform.m44)
                
                try! realm.write{
                    realm.add(frame)
                }
            }
        }
        
        
        
        
    }
    
    func addImage(img: UIImageView, id: String){
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
        stickerView3.tag = count
        self.stickerBgView.addSubview(stickerView3)
        stickerArray.append(stickerView3)
        count += 1
        self.selectedStickerView = stickerView3
    }
    
    
}

extension ViewController: StickerViewDelegate{
    func stickerViewDidBeginMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidChangeMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndMoving(_ stickerView: StickerView) {
        
        let stickerFrame = realm.objects(ModelFrame.self).filter("id == %@", String(stickerView.tag))
        print(stickerView.frame)
        let demo = stickerFrame.first
        
        try! realm.write{
            demo?.x = Float(stickerView.center.x)
            demo?.y = Float(stickerView.center.y)
            
        }
    }
    
    func stickerViewDidBeginRotating(_ stickerView: StickerView) {
       
    }
    
    func stickerViewDidChangeRotating(_ stickerView: StickerView) {
        let stickerFrame = realm.objects(ModelFrame.self).filter("id == %@", String(stickerView.tag))
        print(stickerView.frame)
        let demo = stickerFrame.first
        let image = stickerView.subviews[0] as! UIImageView
        image.layer.transform = CATransform3DRotate(image.layer.transform, 1, 1, 0, 0 )
        image.bounds = stickerView.bounds
        
        
       
    }
    
    func stickerViewDidEndRotating(_ stickerView: StickerView) {
       

        let stickerFrame = realm.objects(ModelFrame.self).filter("id == %@", String(stickerView.tag))
        print(stickerView.frame)
        let demo = stickerFrame.first
        let image = stickerView.subviews[0] as! UIImageView
        image.bounds = stickerView.bounds
        try! realm.write{
            demo?.x = Float(stickerView.center.x)
            demo?.y = Float(stickerView.center.y)
            demo?.height = Float(stickerView.bounds.height)
            demo?.width = Float(stickerView.bounds.width)
            demo?.angleInDegree = Float(stickerView.transform.angleInDegrees)
          
                demo?.m11 = Float(image.layer.transform.m11)
                demo?.m12 = Float(image.layer.transform.m12)
                demo?.m13 = Float(image.layer.transform.m13)
                demo?.m14 = Float(image.layer.transform.m14)
                demo?.m21 = Float(image.layer.transform.m21)
                demo?.m22 = Float(image.layer.transform.m22)
                demo?.m23 = Float(image.layer.transform.m23)
                demo?.m24 = Float(image.layer.transform.m24)
                demo?.m31 = Float(image.layer.transform.m31)
                demo?.m32 = Float(image.layer.transform.m32)
                demo?.m33 = Float(image.layer.transform.m33)
                demo?.m34 = Float(image.layer.transform.m34)
                demo?.m41 = Float(image.layer.transform.m41)
                demo?.m42 = Float(image.layer.transform.m42)
                demo?.m43 = Float(image.layer.transform.m43)
                demo?.m44 = Float(image.layer.transform.m44)

           
        }
        
    }
    
    func stickerViewDidClose(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidTap(_ stickerView: StickerView) {
        currentId = stickerView.tag
    }
    
    
    func setPostionRealm(modelFrame: ModelFrame,stickerView: StickerView){
        
       
    }
    
    func setPositionStickerView(modelFrame: ModelFrame,stickerView: StickerView){
       
    }
}

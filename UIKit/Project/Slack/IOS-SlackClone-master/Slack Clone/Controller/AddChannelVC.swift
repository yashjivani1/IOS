//
//  AddChannelVC.swift
//  Slack Clone
//
//  Created by haco on 28/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
       
    }

    @IBAction func closedModelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else {return}
        guard let channelDesc = chanDesc.text, chanDesc.text != "" else {return}
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : smackePurplePlaceholder])
        
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : smackePurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        //dismiss(animated: true, completion: nil)
    }
    
}

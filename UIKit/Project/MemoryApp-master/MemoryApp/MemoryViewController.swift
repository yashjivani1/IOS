//
//  MemoryViewController.swift
//  MemoryApp
//
//  Created by Haco on 14/03/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var item : MemoryItem!
    var blankCounter = 0
    
    let visibleText : [NSAttributedString.Key : Any] = [
        .font: UIFont(name: "Georgia", size: 30)!,
        .foregroundColor: UIColor.black
    ]
    
    let invisibleText : [NSAttributedString.Key : Any] = [
        .font : UIFont(name: "Georgia", size: 30)!,
        .foregroundColor : UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.black
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "You must provide a memory item before trying to show this view controller.")
        showText()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    func showText(){
        let words = item.text.components(separatedBy: " ")
        let output = NSMutableAttributedString()
        
        let space = NSAttributedString(string: " ", attributes: visibleText)
        
        for (index, word) in words.enumerated(){
            if index  < blankCounter{
                let attributedWord = NSAttributedString(string: word, attributes: visibleText)
                output.append(attributedWord)
            }else{
                var strippedWord = word
                var puncutation : String?
                if ".,".contains(word.last!){
                    puncutation = String(strippedWord.removeLast())
                }
                let attributedWord = NSAttributedString(string: strippedWord, attributes: invisibleText)
                output.append(attributedWord)
                
                if let symbol = puncutation {
                    let attributedPuncutation = NSAttributedString(string: symbol, attributes: visibleText)
                    output.append(attributedPuncutation)
                }
            }
            output.append(space)
        }
        
        textView.attributedText = output
    }
    
    @objc func wordTapped(){
        blankCounter += 1
        showText()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

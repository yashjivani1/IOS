//
//  ModelFrame.swift
//  DemoRealm
//
//  Created by Yash Jivani on 04/03/21.
//

import Foundation
import RealmSwift

class ModelFrame : Object{
    @objc dynamic var id: String = ""
    @objc dynamic var x: Float = 0
    @objc dynamic var y: Float = 0
    @objc dynamic var width: Float = 0
    @objc dynamic var height: Float = 0
    @objc dynamic var angleInDegree: Float = 0

   
    @objc dynamic var m11: Float = 0
    @objc dynamic var m12: Float = 0
    @objc dynamic var m13: Float = 0
    @objc dynamic var m14: Float = 0
    @objc dynamic var m21: Float = 0
    @objc dynamic var m22: Float = 0
    @objc dynamic var m23: Float = 0
    @objc dynamic var m24: Float = 0
    @objc dynamic var m31: Float = 0
    @objc dynamic var m32: Float = 0
    @objc dynamic var m33: Float = 0
    @objc dynamic var m34: Float = 0
    @objc dynamic var m41: Float = 0
    @objc dynamic var m42: Float = 0
    @objc dynamic var m43: Float = 0
    @objc dynamic var m44: Float = 0

}

//
//  RotationExtension.swift
//  DemoRealm
//
//  Created by Yash Jivani on 18/03/21.
//

import UIKit

extension CGAffineTransform {
    var angle: CGFloat { return atan2(-self.c, self.a) }

    var angleInDegrees: CGFloat { return self.angle * 180 / .pi }

    var scaleX: CGFloat {
        let angle = self.angle
        return self.a * cos(angle) - self.c * sin(angle)
    }

    var scaleY: CGFloat {
        let angle = self.angle
        return self.d * cos(angle) + self.b * sin(angle)
    }
}

//import UIKit
//class WatermarkLayer: CATextLayer {
//
//    // MARK: - Constants
//
//    private let defaultFontSize: CGFloat = 48
//    private let rightMargin: CGFloat = 10
//    private let bottomMargin: CGFloat = 10
//
//    // MARK: - Initialization
//
//    init(frame: CGRect) {
//        super.init()
//        guard let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String else {
//            fatalError("!!!")
//        }
//        self.foregroundColor = UIColor.red.cgColor
//        self.backgroundColor = UIColor.clear.cgColor
//        self.string = String(format: String.watermarkFormat, appName)
//        self.font = CTFontCreateWithName(String.watermarkFontName as CFString, defaultFontSize, nil)
//        self.fontSize = defaultFontSize
//        self.shadowOpacity = 0.75
//        self.alignmentMode = .right
//        self.frame = frame
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented. Use init(frame:) instead.")
//    }
//
//    // MARK: - CALayer
//
//    override func draw(in ctx: CGContext) {
//        let height = self.bounds.size.height
//        let fontSize = self.fontSize
//        //let yDiff = (height-fontSize)/2 - fontSize/10 // Center
//        let yDiff = (height-fontSize) - fontSize/10 - bottomMargin // Bottom (minus margin)
//
//        ctx.saveGState()
//        ctx.translateBy(x: -rightMargin, y: yDiff)
//        super.draw(in: ctx)
//        ctx.restoreGState()
//    }
//}

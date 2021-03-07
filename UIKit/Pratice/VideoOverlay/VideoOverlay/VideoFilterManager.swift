//
//  VideoFilterManager.swift
//  ItsMee
//
//  Created by IBL INFOTECH on 27/01/21.
//  Copyright © 2021 IBL INFOTECH. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import Photos
//currentLabel.cgImage
func applyVideoEffects(to composition: AVMutableVideoComposition, size: CGSize, currentLabel: UILabel) {

    let overlayLayer = CALayer()
    var overlayImage: UIImage? = nil
    overlayImage = UIImage.createTransparentImageFrom(label: currentLabel, imageSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    overlayLayer.contents = overlayImage?.cgImage
    overlayLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    overlayLayer.masksToBounds = true


    let parentLayer = CALayer()
    let videoLayer = CALayer()
    parentLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    videoLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    parentLayer.addSublayer(videoLayer)
    parentLayer.addSublayer(overlayLayer)
    // 3 - apply magic
    composition.animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
}

func videoOutput(videoAsset: AVAsset, image: UILabel, urlString :@escaping((String) -> Void)) {

    // Create AVMutableComposition object. This object will hold your AVMutableCompositionTrack instances.
    let mixComposition = AVMutableComposition()

    // Video track
    let videoTrack = mixComposition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: kCMPersistentTrackID_Invalid)
    do {
        try videoTrack?.insertTimeRange(CMTimeRange(start: CMTime.zero, duration: videoAsset.duration), of: videoAsset.tracks(withMediaType: AVMediaType.video)[0], at: CMTime.zero)
    } catch {
        print("Error selecting video track !!")
    }

    // Create AVMutableVideoCompositionInstruction

    let mainInstruction = AVMutableVideoCompositionInstruction()
    mainInstruction.timeRange = CMTimeRange(start: CMTime.zero, duration: videoAsset.duration)

    // Create an AvmutableVideoCompositionLayerInstruction for the video track and fix orientation

    let videoLayerInstruction = AVMutableVideoCompositionLayerInstruction.init(assetTrack: videoTrack!)
    let videoAssetTrack = videoAsset.tracks(withMediaType: AVMediaType.video)[0]
    var videoAssetOrientation = UIImage.Orientation.up
    var isVideoAssetPortrait = false
    let videoTransform = videoAssetTrack.preferredTransform

    if videoTransform.a == 0 && videoTransform.b == 1.0 && videoTransform.c == -1.0 && videoTransform.d == 0 {
        videoAssetOrientation = .right
        isVideoAssetPortrait = true
    }
    if videoTransform.a == 0 && videoTransform.b == -1.0 && videoTransform.c == 1.0 && videoTransform.d == 0 {
        videoAssetOrientation = .left
        isVideoAssetPortrait = true
    }
    if videoTransform.a == 1.0 && videoTransform.b == 0 && videoTransform.c == 0 && videoTransform.d == 1.0 {
        videoAssetOrientation = .up
    }
    if videoTransform.a == -1.0 && videoTransform.b == 0 && videoTransform.c == 0 && videoTransform.d == -1.0 {
        videoAssetOrientation = .down
    }

    videoLayerInstruction.setTransform(videoAssetTrack.preferredTransform, at: CMTime.zero)
    videoLayerInstruction.setOpacity(0.0, at: videoAsset.duration)

    //Add instructions

    mainInstruction.layerInstructions = [videoLayerInstruction]
    let mainCompositionInst = AVMutableVideoComposition()
    let naturalSize : CGSize!
    if isVideoAssetPortrait {
        naturalSize = CGSize(width: videoAssetTrack.naturalSize.height, height: videoAssetTrack.naturalSize.width)
    } else {
        naturalSize = videoAssetTrack.naturalSize
    }

    let renderWidth = naturalSize.width
    let renderHeight = naturalSize.height

    mainCompositionInst.renderSize = CGSize(width: renderWidth, height: renderHeight)
    mainCompositionInst.instructions = [mainInstruction]
    mainCompositionInst.frameDuration = CMTime(value: 1, timescale: 30)

    applyVideoEffects(to: mainCompositionInst, size: naturalSize, currentLabel: image)
    
    // Get Path
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let outputPath = documentsURL.appendingPathComponent("newVideoWithLabel.mp4")
    print(outputPath)
    if FileManager.default.fileExists(atPath: (outputPath.path)) {
        do {
            
            try FileManager.default.removeItem(atPath: (outputPath.path))
        }
        catch {
            print ("Error deleting file")
        }
    }
    // Create exporter

    let exporter = AVAssetExportSession.init(asset: mixComposition, presetName: AVAssetExportPresetHighestQuality)
    exporter?.outputURL = outputPath
    exporter?.outputFileType = AVFileType.mov
    exporter?.shouldOptimizeForNetworkUse = true
    exporter?.videoComposition = mainCompositionInst
    print(outputPath)
    exporter?.exportAsynchronously(completionHandler: {
        exportDidFinish(session: exporter!){(strURL) in
            urlString(strURL)
        }
    })
}

func exportDidFinish(session: AVAssetExportSession, strURL :@escaping((String) -> Void)) {
    if session.status == .completed {
        let outputURL: URL? = session.outputURL
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputURL!)
        }) { saved, error in
            if saved {
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
                let fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions).lastObject
                PHImageManager().requestAVAsset(forVideo: fetchResult!, options: nil, resultHandler: { (avurlAsset, audioMix, dict) in
                    let newObj = avurlAsset as! AVURLAsset
                    print(newObj.url)
                    DispatchQueue.main.async(execute: {
                        print(newObj.url.absoluteString)
                        strURL("\(newObj.url.absoluteString)")
                    })
                })
                print (fetchResult!)
            }
            else {
                strURL("")
            }
        }
    }
}

extension UIImage {
    class func createTransparentImageFrom(label: UILabel, imageSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 2.0)
        let currentView = UIView.init(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        currentView.backgroundColor = UIColor.clear
    currentView.addSubview(label)

        currentView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

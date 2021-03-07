//
//  ViewController.swift
//  DragGestureDemo
//
//  Created by Yash on 02/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Photos

class ViewController: UIViewController {
    var myurl: URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "Demo", ofType:"mp4")
        let fileURL = NSURL(fileURLWithPath: path!)

        let composition = AVMutableComposition()
        let vidAsset = AVURLAsset(url: fileURL as URL, options: nil)

        // get video track
        let vtrack =  vidAsset.tracks(withMediaType: AVMediaType.video)
        let videoTrack: AVAssetTrack = vtrack[0]
        let vid_timerange = CMTimeRangeMake(start: CMTime.zero, duration: vidAsset.duration)

        let tr: CMTimeRange = CMTimeRange(start: CMTime.zero, duration: CMTime(seconds: 10.0, preferredTimescale: 600))
        composition.insertEmptyTimeRange(tr)

        let trackID:CMPersistentTrackID = CMPersistentTrackID(kCMPersistentTrackID_Invalid)

        if let compositionvideoTrack: AVMutableCompositionTrack = composition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: trackID) {

            do {
                try compositionvideoTrack.insertTimeRange(vid_timerange, of: videoTrack, at: CMTime.zero)
            } catch {
                print("error")
            }

            compositionvideoTrack.preferredTransform = videoTrack.preferredTransform

        } else {
            print("unable to add video track")
            return
        }


        // Watermark Effect
        let size = videoTrack.naturalSize

        let imglogo = UIImage(named: "images.jpg")
        let imglayer = CALayer()
        imglayer.contents = imglogo?.cgImage
        imglayer.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        imglayer.opacity = 0.6

        // create text Layer
        let titleLayer = CATextLayer()
        titleLayer.backgroundColor = UIColor.white.cgColor
        titleLayer.string = "Dummy text"
        titleLayer.font = UIFont(name: "Helvetica", size: 28)
        titleLayer.shadowOpacity = 0.5
        titleLayer.alignmentMode = CATextLayerAlignmentMode.center
        titleLayer.frame = CGRect(x: 0, y: 50, width: size.width, height: size.height / 6)


        let videolayer = CALayer()
        videolayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        let parentlayer = CALayer()
        parentlayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        parentlayer.addSublayer(videolayer)
        parentlayer.addSublayer(imglayer)
        parentlayer.addSublayer(titleLayer)

        let layercomposition = AVMutableVideoComposition()
        layercomposition.frameDuration = CMTimeMake(value: 1, timescale: 30)
        layercomposition.renderSize = size
        layercomposition.animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videolayer, in: parentlayer)

        // instruction for watermark
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = CMTimeRangeMake(start: CMTime.zero, duration: composition.duration)
        let videotrack = composition.tracks(withMediaType: AVMediaType.video)[0] as AVAssetTrack
        let layerinstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: videotrack)
        instruction.layerInstructions = NSArray(object: layerinstruction) as [AnyObject] as! [AVVideoCompositionLayerInstruction]
        layercomposition.instructions = NSArray(object: instruction) as [AnyObject] as! [AVVideoCompositionInstructionProtocol]

        //  create new file to receive data
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0] as NSString
        let movieFilePath = docsDir.appendingPathComponent("resul1t.mov")
        let movieDestinationUrl = NSURL(fileURLWithPath: movieFilePath)

        // use AVAssetExportSession to export video
        let assetExport = AVAssetExportSession(asset: composition, presetName:AVAssetExportPresetHighestQuality)
        assetExport?.outputFileType = AVFileType.mov
        assetExport?.videoComposition = layercomposition

        // Check exist and remove old file
        FileManager.default.removeItemIfExisted(movieDestinationUrl as URL)

        assetExport?.outputURL = movieDestinationUrl as URL
        assetExport?.exportAsynchronously(completionHandler: {
            switch assetExport!.status {
            case AVAssetExportSession.Status.failed:
                print("failed")
                print(assetExport?.error ?? "unknown error")
            case AVAssetExportSession.Status.cancelled:
                print("cancelled")
                print(assetExport?.error ?? "unknown error")
            default:
                print("Movie complete")

                self.myurl = movieDestinationUrl as URL

                PHPhotoLibrary.shared().performChanges({
                    PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: movieDestinationUrl as URL)
                }) { saved, error in
                    if saved {
                        print("Saved")
                    }
                }

                self.playVideo()

            }
        })
    }
    
    func playVideo() {
        let player = AVPlayer(url: myurl!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
        print("playing...")
    }
  

}
extension FileManager {
func removeItemIfExisted(_ url:URL) -> Void {
    if FileManager.default.fileExists(atPath: url.path) {
        do {
            try FileManager.default.removeItem(atPath: url.path)
        }
        catch {
            print("Failed to delete file")
        }
    }
}
}

//
//  ViewController.swift
//  Chess
//
//  Created by Yash Jivani on 27/03/21.
//

import UIKit
import AVFoundation
import MultipeerConnectivity

class ViewController: UIViewController {
    
    var chessEngine: ChessEngine = ChessEngine()
    var audioPlayer: AVAudioPlayer!
    var peerID: MCPeerID!
    var session: MCSession!
    var nearByServiceAdvertiser: MCNearbyServiceAdvertiser!
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        
        let filePath = Bundle.main.url(forResource: "chessMove", withExtension: "wav")!
        audioPlayer = try! AVAudioPlayer(contentsOf: filePath)
        boardView.chessDelegate = self
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
    }
    
   
}

extension ViewController: ChessDelegate{
    func pieceAt(col: Int, row: Int) -> ChessPiece?{
        return chessEngine.pieceAt(col: col, row: row)
    }
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        updateMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        let move: String = "\(fromCol):\(fromRow):\(toCol):\(toRow)"
        
        if let data = move.data(using: .utf8){
            try? session.send(data, toPeers: session.connectedPeers, with: .reliable)
        }
    }
    
    func updateMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int){
        chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        audioPlayer.play()
        
        if chessEngine.whitesTurn{
            infoLabel.text = "White"
        }else{
            infoLabel.text = "Black"
        }
    }
    
    
}


extension ViewController{
    @IBAction func reset(_ sender: UIButton) {
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.blackAtTop = true
        boardView.setNeedsDisplay()
        infoLabel.text = "White"
    }
    
    @IBAction func advertise(_ sender: UIButton) {
        nearByServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "Haco-Chess")
        nearByServiceAdvertiser.delegate = self
        nearByServiceAdvertiser.startAdvertisingPeer()
        
        boardView.blackAtTop = false
        boardView.setNeedsDisplay()
    }
    @IBAction func join(_ sender: UIButton) {
        let browser = MCBrowserViewController(serviceType: "Haco-Chess", session: session)
        browser.delegate = self
        present(browser, animated: true, completion: nil)
    }
}




extension ViewController: MCNearbyServiceAdvertiserDelegate{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
    
    
}


extension ViewController: MCBrowserViewControllerDelegate{
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension ViewController: MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("Connected \(peerID.displayName)")
        case .connecting:
            print("Connecting \(peerID.displayName)")
        case .notConnected:
            print("Not Connected \(peerID.displayName)")
        default:
            break
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("Recieved Data: \(data)")
        if let move = String(data: data, encoding: .utf8){
            let moveArr = move.components(separatedBy: ":")
            print(moveArr)
            
            if let fromCol = Int(moveArr[0]), let fromRow = Int(moveArr[1]), let toCol = Int(moveArr[2]), let toRow = Int(moveArr[3]){
                DispatchQueue.main.async {
                    self.updateMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
                }
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
}

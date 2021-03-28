//
//  ViewController.swift
//  Chess
//
//  Created by Yash Jivani on 27/03/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var chessEngine: ChessEngine = ChessEngine()
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var boardView: BoardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        audioPlayer.play()
    }
    
    
}


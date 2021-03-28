//
//  BoardView.swift
//  Chess
//
//  Created by Yash Jivani on 27/03/21.
//

import UIKit

class BoardView: UIView{
    
    let ratio: CGFloat = 0.95
    var originX: CGFloat = 0
    var originY: CGFloat = 0
    var cellSize: CGFloat = 0
    
    var fromCol : Int? = nil
    var fromRow : Int? = nil
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    var chessDelegate: ChessDelegate? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1
    
    
    override func draw(_ rect: CGRect) {
        cellSize = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.height * (1 - ratio) / 2
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        fromCol = Int((fingerLocation.x - originX) / cellSize)
        fromRow = Int((fingerLocation.y - originY) / cellSize)
    
        if let fromCol = fromCol, let fromRow = fromRow, let movingPiece = chessDelegate?.pieceAt(col: fromCol, row: fromRow){
            movingImage = UIImage(named: movingPiece.imageName)
        }
        
        print("From \(fromCol) ,  \(fromRow)")
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingPieceX = fingerLocation.x
        movingPieceY = fingerLocation.y
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol : Int = Int((fingerLocation.x - originX) / cellSize)
        let toRow : Int = Int((fingerLocation.y - originY) / cellSize)
        print("To \(toCol) ,  \(toRow)")
        
        
        if let fromCol = fromCol, let fromRow = fromRow, fromCol != toCol || fromRow != toRow{
            chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        
        movingImage = nil
        fromCol = nil
        fromRow = nil
    }
    
    func drawBoard(){
        for row in 0..<4{
            for col in 0..<4{
                drawSquare(col: col * 2, row: row * 2, color: UIColor.white)
                drawSquare(col: col * 2 + 1, row: row * 2, color: UIColor.lightGray)
                drawSquare(col: col * 2, row: row * 2 + 1, color: UIColor.lightGray)
                drawSquare(col: col * 2 + 1, row: row * 2 + 1, color: UIColor.white)
            }
        }
        
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor){
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSize, y: originY + CGFloat(row) * cellSize, width: cellSize, height: cellSize))
        color.setFill()
        path.fill()
    }
    
    
    func drawPieces(){
    
        for piece in shadowPieces{
            if fromCol == piece.col && fromRow == piece.row{
                continue
            }
            
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: originX + CGFloat(piece.col) * cellSize, y: originY + CGFloat(piece.row) * cellSize, width: cellSize, height: cellSize))
        
        }
        movingImage?.draw(in: CGRect(x: movingPieceX - cellSize/2, y: movingPieceY - cellSize/2, width: cellSize, height: cellSize))
    }
}

//
//  ChessEngine.swift
//  Chess
//
//  Created by Yash Jivani on 27/03/21.
//

import Foundation

struct ChessEngine{
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int){
        if fromCol == toCol && fromRow == toRow{
            return
        }
        
        guard let candidate = pieceAt(col: fromCol, row: fromRow) else{
            return
        }
        
        pieces.remove(candidate)
        pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: candidate.imageName))
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece?{
        for piece in pieces{
            if col == piece.col && row == piece.row{
                return piece
            }
        }
        return nil
    }
    
    mutating func initializeGame(){
        pieces.removeAll()
      
        
        for i in 0..<2{
            pieces.insert(ChessPiece(col: i * 7, row: 0, imageName: "rook_black"))
            pieces.insert(ChessPiece(col: i * 7, row: 7, imageName: "rook_white"))
            pieces.insert(ChessPiece(col: i * 5 + 1, row: 0, imageName: "knight_black"))
            pieces.insert(ChessPiece(col: i * 5 + 1, row: 7, imageName: "knight_white"))
            pieces.insert(ChessPiece(col: i * 3 + 2, row: 0, imageName: "bishop_black"))
            pieces.insert(ChessPiece(col: i * 3 + 2, row: 7, imageName: "bishop_white"))
            
            
        }
        
        
        pieces.insert(ChessPiece(col: 3, row: 0, imageName: "queen_black"))
        pieces.insert(ChessPiece(col: 3, row: 7, imageName: "queen_white"))
        pieces.insert(ChessPiece(col: 4, row: 0, imageName: "king_black"))
        pieces.insert(ChessPiece(col: 4, row: 7, imageName: "king_white"))

        for col in 0..<8{
            pieces.insert(ChessPiece(col: col, row: 1, imageName: "pawn_black"))
        }
        
        for col in 0..<8{
            pieces.insert(ChessPiece(col: col, row: 6, imageName: "pawn_white"))
        }
    }
}

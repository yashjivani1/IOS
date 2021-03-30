//
//  ChessEngine.swift
//  Chess
//
//  Created by Yash Jivani on 27/03/21.
//

import Foundation

struct ChessEngine{
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    var whitesTurn: Bool = true
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int){
        if !canMovePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow){
            return 
        }
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else{
            return
        }
        
        if let target = pieceAt(col: toCol, row: toRow){
            if target.isWhite == movingPiece.isWhite{
                return
            }
            pieces.remove(target)
        }
        
        pieces.remove(movingPiece)
        pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: movingPiece.imageName, isWhite: movingPiece.isWhite, type: movingPiece.type))
        
        whitesTurn = !whitesTurn
    }
    
    func canMovePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool{
        if fromCol == toCol && fromRow == toRow{
            return false
        }
        
        guard let candidate = pieceAt(col: fromCol, row: fromRow)else{
            return false
        }
        
        if candidate.isWhite != whitesTurn{
            return false
        }
        
        return true
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
        whitesTurn = true
        pieces.removeAll()
      
        
        for i in 0..<2{
            pieces.insert(ChessPiece(col: i * 7, row: 0, imageName: "rook_black", isWhite: false, type: .rook))
            pieces.insert(ChessPiece(col: i * 7, row: 7, imageName: "rook_white", isWhite: true, type: .rook))
            pieces.insert(ChessPiece(col: i * 5 + 1, row: 0, imageName: "knight_black", isWhite: false, type: .knight))
            pieces.insert(ChessPiece(col: i * 5 + 1, row: 7, imageName: "knight_white", isWhite: true, type: .knight))
            pieces.insert(ChessPiece(col: i * 3 + 2, row: 0, imageName: "bishop_black", isWhite: false, type: .bishop))
            pieces.insert(ChessPiece(col: i * 3 + 2, row: 7, imageName: "bishop_white", isWhite: true, type: .bishop))
            
            
        }
        
        
        pieces.insert(ChessPiece(col: 3, row: 0, imageName: "queen_black", isWhite: false, type: .queen))
        pieces.insert(ChessPiece(col: 3, row: 7, imageName: "queen_white", isWhite: true, type: .queen))
        pieces.insert(ChessPiece(col: 4, row: 0, imageName: "king_black", isWhite: false, type: .king))
        pieces.insert(ChessPiece(col: 4, row: 7, imageName: "king_white", isWhite: true, type: .king))

        for col in 0..<8{
            pieces.insert(ChessPiece(col: col, row: 1, imageName: "pawn_black", isWhite: false, type: .pawn))
        }
        
        for col in 0..<8{
            pieces.insert(ChessPiece(col: col, row: 6, imageName: "pawn_white", isWhite: true, type: .pawn))
        }
    }
}


extension ChessEngine: CustomStringConvertible{
    var description: String {
        var desc = ""
        
        desc += "  0 1 2 3 4 5 6 7\n"
        for row in 0..<8{
            desc += "\(row)"
            for col in 0..<8{
                if let piece = pieceAt(col: col, row: row){
                    switch piece.type {
                    case .king:
                        desc += piece.isWhite ? " k" : " K"
                    case .queen:
                        desc += piece.isWhite ? " q" : " Q"
                    case .bishop:
                        desc += piece.isWhite ? " b" : " B"
                    case .knight:
                        desc += piece.isWhite ? " n" : " N"
                    case .rook:
                        desc += piece.isWhite ? " r" : " R"
                    case .pawn:
                        desc += piece.isWhite ? " p" : " P"
                    }
                }else{
                    desc += " ."
                }
            }
            desc += "\n"
        }
        
        return desc
    }
    
    
}

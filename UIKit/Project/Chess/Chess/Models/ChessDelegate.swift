//
//  ChessDelegate.swift
//  Chess
//
//  Created by Yash Jivani on 28/03/21.
//

import Foundation

protocol ChessDelegate {
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
    func pieceAt(col: Int, row: Int) -> ChessPiece?
}

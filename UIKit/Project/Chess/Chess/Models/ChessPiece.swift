//
//  ChessPiece.swift
//  Chess
//
//  Created by Yash Jivani on 27/03/21.
//

import Foundation

struct ChessPiece: Hashable{
    let col: Int
    let row: Int
    let imageName: String
    let isWhite: Bool
    let type: ChessPieceType
}

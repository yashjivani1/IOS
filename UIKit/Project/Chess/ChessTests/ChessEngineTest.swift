//
//  ChessEngineTest.swift
//  ChessTests
//
//  Created by Yash Jivani on 29/03/21.
//

import XCTest
@testable import Chess

class ChessEngineTest: XCTestCase {

    func testPrintingEmptyGameBoard(){
        var game = ChessEngine()
        game.initializeGame()
        print(game)
    }

}

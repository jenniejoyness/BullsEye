//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Jennie on 12/31/20.
//

import XCTest
@testable import BullsEye
class BullsEyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
       game = Game()
    }

    override func tearDownWithError() throws {
        game=nil
    }

    func testScorePositive() throws {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() throws {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}

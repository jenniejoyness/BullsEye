//
//  Game.swift
//  BullsEye
//
//  Created by Jennie on 12/31/20.
//

import Foundation
import UIKit

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var sliderSize = CGFloat(250)
     
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(self.target - sliderValue)
        return 100 - difference
    }
    
    mutating func addToScore(numOfPoints: Int) {
        print(numOfPoints)
        self.score += numOfPoints
        print(score)
    }
    
    mutating func nextRound() {
        round += 1
    }
    
    mutating func  generateTarget(){
        self.target = Int.random(in: 1...100)
    }
    
    mutating func generateSize() {
        if (self.round >= 5) {
        self.sliderSize = CGFloat(Double.random(in: 100...250))
        }
    }
}

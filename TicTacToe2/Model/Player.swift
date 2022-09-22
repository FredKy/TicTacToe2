//
//  Player.swift
//  TicTacToe2
//
//  Created by Fredrik Kypta on 2022-09-21.
//

import Foundation


struct Player {
    var name: String
    var number: Int
    var markerImage: String
    var score: Int
    
    init(name: String, number: Int, markerImage: String, score: Int) {
        self.name = name
        self.number = number
        self.markerImage = markerImage
        self.score = score
    }
}




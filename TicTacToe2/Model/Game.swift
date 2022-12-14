//
//  Game.swift
//  TicTacToe
//
//  Created by Fredrik Kypta on 2022-09-21.
//

import Foundation

class Game {
    
    let GAME_CONTINUE = 0, CELL_EMPTY = 0
    let RESULT_PLAYER1 = 1
    let RESULT_PLAYER2 = 2
    let RESULT_DRAW = 3
    let GAME_ENDED = 4
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.currentPlayer = player1
        self.gameStatus = GAME_CONTINUE
    }
    
    var board = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    
    
    var player1: Player
    var player2: Player
    
    var gameStatus: Int
    
    var previousPlayer: Player?
    var currentPlayer: Player
    
    func resetGame() {
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        self.currentPlayer = player1
//        let res = getGameResult()
//        switch res {
//
//        }
        self.gameStatus = GAME_CONTINUE
    }
    
    func endGame(result: Int) -> Int {
        switchPlayer()
        gameStatus = result
        return result
    }
    
//    func saveToHighscore(name: String, win: Bool) {
//        let highscore = UserDefaults.standard.object(forKey: "highscore") as? [String:Int]
//
//        if let highscore = highscore {
//            if var user = highscore[name] {
//                if win {
//
//                }
//            }
//        }
//
//    }
    func getRandomSquare() -> Int {
        let idxs = board.enumerated().filter{
            $0.element == 0
        }.map{
            $0.offset
        }
        print(idxs)
        let r = idxs.randomElement()
        print(r!)
        
        return r!
    }
    
    func switchPlayer() {
        if currentPlayer.number == 1 {
            previousPlayer = player1
            currentPlayer = player2
        } else {
            previousPlayer = player2
            currentPlayer = player1
        }
    }
    
    func addMove(position: Int) -> Int {
        
        if gameStatus != GAME_CONTINUE {
            return gameStatus
        }
        
        if board[position] != 0 {
            return GAME_CONTINUE
        }
        
        print("Selected: \(currentPlayer.number)")
        
        board[position] = currentPlayer.number
        
        let result = getGameResult()
        
        if result != GAME_CONTINUE {
            return endGame(result: result)
        }
        
        if (board.filter{$0 != 0}.count == 9) {
            return endGame(result: RESULT_DRAW)
        }
        
        switchPlayer()
        
        
        return GAME_CONTINUE
    }
    
    func getGameResult() -> Int {

        func addPoint(playerNumber: Int) {
            if player1.number == playerNumber {
                player1.score += 1
            } else if player2.number == playerNumber {
                player2.score += 1
            }
        }
        
        print(board)
        // Row 1
    
        if board[0] == board[1] && board[0] == board[2] && board[0] != 0 {
            print("Player \(board[0]) has won!")
            addPoint(playerNumber: board[0])
            return board[0]
        }
        
        // Row 2
        
        if board[3] == board[4] && board[3] == board[5] && board[3] != 0 {
            print("Player \(board[3]) has won!")
            addPoint(playerNumber: board[3])
            return board[3]
        }
        
        // Row 3
        
        if board[6] == board[7] && board[6] == board[8] && board[6] != 0 {
            print("Player \(board[6]) has won!")
            addPoint(playerNumber: board[6])
            return board[6]
        }
        
        // Column 1
        
        if board[0] == board[3] && board[0] == board[6] && board[0] != 0 {
            print("Player \(board[0]) has won!")
            addPoint(playerNumber: board[0])
            return board[0]
        }
        
        // Column 2
        
        if board[1] == board[4] && board[1] == board[7] && board[1] != 0 {
            print("Player \(board[1]) has won!")
            addPoint(playerNumber: board[1])
            return board[1]
        }
        
        // Column 3
        
        if board[2] == board[5] && board[2] == board[8] && board[2] != 0 {
            print("Player \(board[2]) has won!")
            addPoint(playerNumber: board[2])
            return board[2]
        }
        
        // Diagonal row
        
        if board[0] == board[4] && board[0] == board[8] && board[0] != 0 {
            print("Player \(board[0]) has won!")
            addPoint(playerNumber: board[0])
            return board[0]
        }
        
        if board[2] == board[4] && board[2] == board[6] && board[2] != 0 {
            print("Player \(board[2]) has won!")
            addPoint(playerNumber: board[2])
            return board[2]
        }
    
        return GAME_CONTINUE
    }
    
    
}

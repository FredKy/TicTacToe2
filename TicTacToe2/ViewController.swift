//
//  ViewController.swift
//  TicTacToe2
//
//  Created by Fredrik Kypta on 2022-09-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var lblPlayer1: UILabel!
    @IBOutlet weak var lblPlayer2: UILabel!
    
    var cellButtons: [UIButton] = [UIButton]()
    @IBOutlet weak var btnPlayOrReset: UIButton!
    
    var name1: String?
    var name2: String?
    var player1: Player?
    var player2: Player?
    var playingAI: Bool?

    var game: Game?

//    required init?(coder aDecoder: NSCoder) {
//        self.game = Game(player1: Player(name: name1 ?? "Fredrik", number: 1, markerImage: "X"), player2: Player(name: name2 ?? "Robert", number: 2, markerImage: "O"))
//        super.init(coder: aDecoder)
//    }
    
//    var game: Game = Game(player1: Player(name: "Fredrik", number: 1, markerImage: "X"), player2: Player(name: "Robert", number: 2, markerImage: "O"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for (index, button) in cellButtons.enumerated() {
//            button.tag = index
//            print(button.tag)
//        }
        player1 = Player(name: name1 ?? "Fredrik", number: 1, markerImage: "X", score: 0, ai: false)
        player2 = Player(name: name2 ?? "Robert", number: 2, markerImage: "O", score: 0, ai: playingAI ?? false)
        game = Game(player1: player1!, player2: player2!)
        a1.tag = 0
        a2.tag = 1
        a3.tag = 2
        b1.tag = 3
        b2.tag = 4
        b3.tag = 5
        c1.tag = 6
        c2.tag = 7
        c3.tag = 8
        self.cellButtons = [self.a1,self.a2,self.a3,self.b1,self.b2,self.b3,self.c1,self.c2,self.c3]
        lblTop.text = "\(game!.currentPlayer.name)'s turn!"
        lblPlayer1.text = game!.player1.name
        lblPlayer2.text = game!.player2.name
    }

    @IBAction func onPlayOrReset(_ sender: UIButton) {
        player1 = game?.player1
        player2 = game?.player2
        game = Game(player1: player1!, player2: player2!)
        //game!.resetGame()
        for button in cellButtons {
            button.setTitle(nil, for: .normal)
            button.isUserInteractionEnabled = true
        }
        score1.text = "\(game!.player1.score)"
        score2.text = "\(game!.player2.score)"
        lblTop.text = "\(game!.currentPlayer.name)'s turn!"
        btnPlayOrReset.setTitle("Reset", for: .normal)
    }
    
    @IBAction func vadSomHelst(_ sender: UIButton) {
        var result = game!.addMove(position: sender.tag)
    }
    
    @IBAction func onCellSelected(_ sender: UIButton) {
        
        if let game = game {
        
            let result = game.addMove(position: sender.tag)
            print("PSelected: \(game.previousPlayer?.number ?? 5)")

        
        func setParams() {
            sender.setTitle(game.previousPlayer?.markerImage ?? "", for: .normal)
            sender.isUserInteractionEnabled = false
        }
            
            switch result {
            case game.GAME_CONTINUE:
                setParams()
                lblTop.text = "\(game.currentPlayer.name)'s turn!"
                if game.player2.ai == true {
                    aiMove()
                }
            case game.RESULT_DRAW:
                setParams()
                lblTop.text = "Game is a draw!"
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.RESULT_PLAYER1:
                setParams()
                score1.text = "\(game.player1.score)"
                lblTop.text = "\(game.player1.name) has won!"
                for button in cellButtons {
                    button.isUserInteractionEnabled = false
                }
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.RESULT_PLAYER2:
                //sender.setBackgroundImage(UIImage.init(named: game.previousPlayer?.markerImage ?? ""), for: .normal)
                setParams()
                score2.text = "\(game.player2.score)"
                lblTop.text = "\(game.player2.name) has won!"
                for button in cellButtons {
                    button.isUserInteractionEnabled = false
                }
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.GAME_ENDED:
                lblTop.text = "Game has already ended!"
                print("Game has already ended!")
            default: lblTop.text = "Error!"
            }
        
        }
    }
    
    func aiMove() {
        if let game = game {
            
            let r = game.getRandomSquare()
        
            let result = game.addMove(position: r)
            print("PSelected: \(game.previousPlayer?.number ?? 5)")
            
            let sender = self.view.viewWithTag(r) as? UIButton

        
        func setParams() {
            sender!.setTitle(game.previousPlayer?.markerImage ?? "", for: .normal)
            sender!.isUserInteractionEnabled = false
        }
            
            switch result {
            case game.GAME_CONTINUE:
                setParams()
                lblTop.text = "\(game.currentPlayer.name)'s turn!"
            case game.RESULT_DRAW:
                setParams()
                lblTop.text = "Game is a draw!"
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.RESULT_PLAYER1:
                setParams()
                score1.text = "\(game.player1.score)"
                lblTop.text = "\(game.player1.name) has won!"
                for button in cellButtons {
                    button.isUserInteractionEnabled = false
                }
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.RESULT_PLAYER2:
                //sender.setBackgroundImage(UIImage.init(named: game.previousPlayer?.markerImage ?? ""), for: .normal)
                setParams()
                score2.text = "\(game.player2.score)"
                lblTop.text = "\(game.player2.name) has won!"
                for button in cellButtons {
                    button.isUserInteractionEnabled = false
                }
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.GAME_ENDED:
                lblTop.text = "Game has already ended!"
                print("Game has already ended!")
            default: lblTop.text = "Error!"
            }
        
        }
    }
    
}


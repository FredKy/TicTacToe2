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
    
    var cellButtons: [UIButton] = [UIButton]()
    @IBOutlet weak var btnPlayOrReset: UIButton!
    
    var game: Game?
    
    var player1 = Player(name: "Fredrik", number: 1, markerImage: "X")
    var player2 = Player(name: "Robert", number: 2, markerImage: "O")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        game = Game(player1: player1, player2: player2)
        lblTop.text = "\(game!.currentPlayer.name)'s turn!"
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            UIView.animate(withDuration: 1.0, animations: {self.lblTop.alpha = 1.0}, completion: nil)
        }
    }
    
    @IBAction func onPlayOrReset(_ sender: UIButton) {
        game = Game(player1: player1, player2: player2)
        for button in cellButtons {
            button.setTitle(nil, for: .normal)
        }
        btnPlayOrReset.setTitle("Reset", for: .normal)
    }
    
    @IBAction func vadSomHelst(_ sender: UIButton) {
        var result = game?.addMove(position: sender.tag)
    }
    
    @IBAction func onCellSelected(_ sender: UIButton) {
        
        if let game = game {

            let result = game.addMove(position: sender.tag)
            print("PSelected: \(game.previousPlayer?.number ?? 5)")

            
            switch result {
            case game.GAME_CONTINUE:
                //sender.setBackgroundImage(UIImage.init(named: game.previousPlayer?.markerImage ?? ""), for: .normal)
                sender.setTitle(game.previousPlayer?.markerImage ?? "", for: .normal)
                lblTop.text = "\(game.currentPlayer.name)'s turn!"
            case game.RESULT_DRAW:
                //sender.setBackgroundImage(UIImage.init(named: game.previousPlayer?.markerImage ?? ""), for: .normal)
                sender.setTitle(game.previousPlayer?.markerImage ?? "", for: .normal)
                lblTop.text = "Game is a draw!"
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.RESULT_PLAYER1:
                //sender.setBackgroundImage(UIImage.init(named: game.previousPlayer?.markerImage ?? ""), for: .normal)
                sender.setTitle(game.previousPlayer?.markerImage ?? "", for: .normal)
                lblTop.text = "\(game.player1.name) has won!"
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.RESULT_PLAYER2:
                //sender.setBackgroundImage(UIImage.init(named: game.previousPlayer?.markerImage ?? ""), for: .normal)
                sender.setTitle(game.previousPlayer?.markerImage ?? "", for: .normal)
                lblTop.text = "\(game.player2.name) has won!"
                btnPlayOrReset.setTitle("Play again", for: .normal)
            case game.GAME_ENDED:
                lblTop.text = "Game has already ended!"
                print("Game has already ended!")
            default: lblTop.text = "Error!"
            }
            
        }
        
    }
    
    
}

